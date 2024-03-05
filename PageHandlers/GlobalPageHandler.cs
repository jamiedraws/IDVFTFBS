using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;
using Dtm.Framework.Models.Ecommerce;
using System.Web.Mvc;
using System;
using Dtm.Framework.Services.DtmApi;
using IDVFTFBS.PromoCodeHelper;
using System.Web;
using System.Text.RegularExpressions;
using Dtm.Framework.Base.Controllers;

namespace IDVFTFBS.PageHandlers
{
    public class GlobalPageHandler : PageHandler
    {
        private readonly PromoCodeManager promoCodeManager = new PromoCodeHelper.PromoCodeManager();
        private List<string> errors;


        public override void BeginRequest(HttpRequestBase request, HttpResponseBase response, ref string pageCode)
        {
            base.BeginRequest(request, response, ref pageCode);

            if(string.Equals(DtmContext.OfferCode, "IDVFTFBS") && DtmContext.Version == 20)
            {
                var defaultVersion = DtmContext.CampaignOfferVersions
                    .Where(cov => cov.OfferCode == "UPGRADE" && cov.IsDefault)
                    .Select(cov => cov.VersionNumberString)
                    .FirstOrDefault()
                    ?? 
                    string.Empty;

                var domain = string.Format("{0}{1}/{2}/{3}{4}{5}", 
                    DtmContext.Domain.FullDomain, 
                    "UPGRADE", 
                    defaultVersion, 
                    DtmContext.PageCode, 
                    DtmContext.ApplicationExtension,
                    request.Url.Query);

                response.Redirect(domain);
            }

        }

        public override void PostSetOrderStatus()
        {
            if (DtmContext.Version == 1 && DtmContext.OfferCode != "UPGRADE")
            {
                // Set this way for RemoteType usage via ajax on landing page, dont want to create orders that need to be processed.
                Order.OrderStatusId = Dtm.Framework.Base.Configuration.FrameworkCommon.OrderStatus.None;
            }
        }
        //public override bool OnValidatePromoCodeAction(PromoCodeRule promoCodeAction)
        //{
        //    var excludedCodes = DtmContext.CampaignProducts.Where(cp => cp.ProductType == "Shipping" || cp.ProductType == "Promo")
        //        .Select(cp => cp.ProductCode)
        //        .ToList();
        //    var totalPrice = DtmContext.ShoppingCart.Where(x => !excludedCodes.Contains(x.ProductCode) && x.Price.HasValue).Sum(i => i.Price.Value * i.Quantity);
        //    bool validPromo = true;
        //    switch (promoCodeAction.PromoCode)
        //    {
        //        case "COOL23":
        //            if (totalPrice <= 40)
        //            {
        //                OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
        //                AddModelStateError("PromoCode", "Your order must be more than $39.99 to use promo code PRESDAY23.");
        //                validPromo = false;
        //            }
        //            break;
        //    }

        //    return validPromo;
        //}

        public override void PostValidate(ModelStateDictionary modelState)
        {
            if ((DtmContext.Page.IsStartPageType || DtmContext.Page.PageCode == "OrderSummaryWithEdit") && (DtmContext.Version >= 2 || DtmContext.OfferCode == "UPGRADE"))
            {

                var promoCodes = new List<string>()
                {
                    "PRO10", "GLO10", "CONTOUR10", "FLAWLESS10", "LOVEFLAWLESS", "SURVEY10", "AVREY10", "JESSICA10", "BROWS10", "SHAYLA10",
                    "CARLI10", "DANIELLA10", "ARNELL10", "NYMA10", "KAIT10", "TAYLOR10", "SUMMER10", "MEG10", "ASPYN10", "KRISTIN10", "AVA10",
                    "CHANTEL10", "GRWM10", "ALEX10", "CORINNA10", "RYLEY10", "LAUREN10", "GABI10", "NYJA10", "KISH10", "MADDIE10", "LINDSI10",
                    "DANNY10", "SQUARE10", "TIKTOK10", "MOM10", "CLEANSE10", "ICE10", "DELANEY10", "SNAP10", "CHYENNE10", "KAYLEIGH10", "NEZZA10",
                    "LYNN10", "MELISSA10", "STEPHANIE10", "NAILS10","CLAUDIA10", "KIMBERLY10","YANA10","GOLDY10","LUCIE10","ASHLEY10","NIA10","NABELA10",
                    "KOUVR10","LIV10", "FRIDGE20", "LEGS20", "HEART","SHAHD10","SALE20","JENN10","JERA10","EILEEN10","TANI10","CARYN10","CATIE10","COCO10",
                    "NATALIE10","JULIA10","CASEY10","ELLIE10","ZAHRA10","MARIAH10","MONROE10","TENISHA10", "FALLFAVE", "FRIENDS20", "HOLIDAY20","FRIDAY20",
                    "MONDAY20", "BROWS20", "HALLE20","BEMINE25", "ASHLEY15","HALLE10","DOVE10","AMELIA10","AMOR25","AMELIA15","SPA10", "NEW10", "BEAUTY10",
                    "BEAUTY20","FF10","GET20", "DEAL20", "SUMMER20", "SKINCARE20", "MARIASEE10", "PEDI20", "CONTOUR20", "LESS20", "ALLURE20", "THANKYOU20",
                    "SILK20","MANI20", "FACE20", "FALL20", "TREAT20", "THANKS20", "PERFECT20", "CYBER30", "BROW20", "ALL20", "YSABELA15", "IVANA15", "PURECLEAN10",
                    "BIKINI10", "GIFT20", "NEXT20", "WOW20", "VIP20", "DEC20", "CHEERS20", "FABFACE", "PERFECT10", "STRAYHAIR10", "FACEDUO10", "ILOVEME", "YOUNAILEDIT",
                    "SPRINGCLEAN", "SUPER10", "UNDERARM10", "FRESH15", "ALYSSA20", "APPD2022", "APD2022","BUNDLES","WELCOME10", "BEAUTY25", "TIKTOK30", "FABFAM", "GET50", 
                    "SPA30", "HANKY", "MERRY", "NAILEDIT"
                };
                var totalQty = ActionItems.Where(data => data.Key != "ADDSHIP" && !data.Key.Contains("SHFEE") && !data.Key.Contains("FREESM") 
                && !promoCodes.Contains(data.Key)
                && !PromoCodeItems.OneTimeOnlyPromoCodes.Contains(data.Key)).Sum(d => d.Value);

                if (totalQty <= 0)
                {
                    AddModelStateError("form", "Please make sure a product quantity is selected to continue.");
                }

                //var oosProducts = new List<string>() { "PREP" };
                //foreach (var product in oosProducts)
                //{
                //    if (DtmContext.ShoppingCart[product].Quantity > 0)
                //    {
                //        AddModelStateError("OOSProduct", product + " is out of stock.");
                //        OrderManager.SetProductQuantity(product, 0);
                //    }
                //}

                var oneTimeOnlyPromoItems = ActionItems
                   .Where(oi => PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.Key))
                   .ToList();

                var oneTimeOnlyPromoQuantity = oneTimeOnlyPromoItems.Sum(oi => oi.Value);

                if (oneTimeOnlyPromoQuantity > 0)
                {
                    foreach (var promoItem in oneTimeOnlyPromoItems)
                    {
                        if(promoCodeManager.GetPromoAppliedAmount(promoItem.Key) > 0)
                        {
                            AddModelStateError("Form",  promoItem.Key + " has already been used");
                            break;
                        }
                    }
                }

                // PROMO CODES ONLY ALLOWED ONE USE PER EMAIL
                var onePerEmailPromoQty = ActionItems.Where(data => data.Key == "WELCOME10").Sum(d => d.Value);
                if (onePerEmailPromoQty >= 1 && promoCodeManager.IsDuplicateHouseholdOrder(out errors, "WELCOME10", Form["param_" + "Email"] ?? Form["Email"] ?? string.Empty))
                {
                    AddModelStateError("Form", "Promo code allowed for one time use per Email.");
                }
            }
        }
        public override void OnProcessCustomPromoCode(PromoCodeRule promoCodeAction, SafeDictionary postData)
        {
            var promoCode = promoCodeAction.PromoCode;
            var discountItems = new List<string>();
            var discountPercent = 0M;
            var errorMessage = "";

            switch (promoCode)
            {
                case "SPA10":
                    discountPercent = .1M;  // 10%
                    discountItems.Add("NAILS");
                    discountItems.Add("PEDI");
                    errorMessage = "Please add Flawless� Salon Nails or Flawless� Pedi to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "ASHLEY10":
                    discountPercent = .1M;  // 10%
                    discountItems.Add("CLEANSE");
                    errorMessage = "Please add Flawless� Cleanse to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "GET20":
                    discountPercent = .2M;  // 20%
                    discountItems.Add("CLEANSE");
                    errorMessage = "Please add Flawless� Cleanse to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "BEMINE25":
                case "AMOR25":
                    discountPercent = .25M;  // 25%
                    discountItems.Add("CLEANSE");
                    discountItems.Add("NU");
                    discountItems.Add("GLO");
                    discountItems.Add("CONTOUR");
                    errorMessage = "Please add Flawless� Cleanse, Flawless Nu Razor, Flawless Dermaplane GLO, or Flawless Contour to your cart to use promo code "+ promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "HR30":
                    discountPercent = .30M;  // 30%
                    var hairRemovalProducts = DtmContext.CampaignProducts
                        .Where(cp => cp.CategoryIndexer.Has("HAIRREMOVAL"))
                        .Select(cp => cp.ProductCode)
                        .ToList();
                    discountItems.AddRange(hairRemovalProducts);
                    discountItems.Add("PLAVENN");
                    discountItems.Add("FACEBLUSHN");
                    discountItems.Add("BROWBLUSHN");
                    //ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;

                    errorMessage = "Please add Flawless� Hair Removal Item to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "BROWS20":
                    discountPercent = .2M;  // 20%
                    discountItems.Add("BROWPB");
                    discountItems.Add("BROW");
                    errorMessage = "Please add Flawless� Brows to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "SALE20":
                    discountPercent = .2M;  // 20%
                    discountItems.Add("BLACK2");
                    errorMessage = "Please add Flawless� Black to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "NEW10":
                    discountPercent = .1M;  // 10%
                    discountItems.Add("BROWPB");
                    discountItems.Add("PBLUE");
                    errorMessage = "Please add Flawless� Brows, Flawless� Face to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "BEAUTY10":
                    discountPercent = .1M;  // 10%
                    discountItems.Add("NFRIG");
                    discountItems.Add("NFRIGFS");
                    errorMessage = "Please add Flawless� Beauty Fridge to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "BEAUTY20":
                    discountPercent = .2M;  // 20%
                    discountItems.Add("NFRIG");
                    discountItems.Add("NFRIGFS");
                    errorMessage = "Please add Flawless� Beauty Fridge to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "LEGS20":
                    discountPercent = .2M;  // 20%
                    discountItems.Add("LEG");
                    errorMessage = " Please add Flawless Legs to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "FABFACE":
                    discountPercent = .2M; // 20%
                    discountItems.Add("CLEANSE");
                    discountItems.Add("ICE");
                    discountItems.Add("CONTOUR");
                    errorMessage = " Please add Flawless Cleanse, Flawless Ice Roller, or Flawless Contour to your cart to use promo code " + promoCode + ".";
                    OnProcessPromoCode(promoCode, discountItems, discountPercent, errorMessage);
                    break;
                case "ILOVEME":
                        var totalPrice = DtmContext.ShoppingCart.Where(i => i.ProductCode != "ADDSHIP" && i.ProductCode != "HOLIDAY20" && !i.ProductCode.Contains("SHFEE")).Sum(io => io.Quantity * io.Price);

                        if (DtmContext.Version == 20 && totalPrice >= 75)
                        {
                            OrderManager.SetProductQuantity("ILOVEME", 1);
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("ILOVEME", 0);
                            AddModelStateError("PromoCode", "The order total must be $75 or more to use promo code ILOVEME");
                        }
                    break;
                case "YOUNAILEDIT":
                    {
                        var discountedCartTotal = DtmContext.ShoppingCart.Where(sc => !promoCode.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(discountedCartTotal * .15M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);

                        if (DtmContext.ShoppingCart["PEDI"].Quantity > 0 && DtmContext.ShoppingCart["NAILS"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("YOUNAILEDIT", 1);
                            Order.Items["YOUNAILEDIT"].Price = discountRounded;
                            DtmContext.ShoppingCart["YOUNAILEDIT"].Price = discount;
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("YOUNAILEDIT", 0);
                            AddModelStateError("PromoCode", "Please add Flawless Salon Nails & Flawless Pedi to your cart to use promo code YOUNAILEDIT.");
                        }
                        break;
                    }
                case "SPRINGCLEAN":
                    {
                        var discountedCartTotal = DtmContext.ShoppingCart.Where(sc => !promoCode.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(discountedCartTotal * .15M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);

                        if (DtmContext.ShoppingCart["CLEANSE"].Quantity > 0 || DtmContext.ShoppingCart["BUNCLSE"].Quantity > 0 || DtmContext.ShoppingCart["BUNCLSE2"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("SPRINGCLEAN", 1);
                            Order.Items["SPRINGCLEAN"].Price = discountRounded;
                            DtmContext.ShoppingCart["SPRINGCLEAN"].Price = discount;
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("SPRINGCLEAN", 0);
                            AddModelStateError("PromoCode", " Please add Flawless Cleanse to your cart to use promo code SPRINGCLEAN.");
                        }
                        break;
                    }
                case "MDW22":
                    {
                        var promoCodeVariants = new List<string>() { "MDW22", "MDW2210", "MDW2215", "MDW2220" };
                        var discountedCartTotal = DtmContext.ShoppingCart.Where(sc => !promoCodeVariants.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(discountedCartTotal * .1M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                        var excludedProducts = new List<string>() { "FREEADAPT", "FREESM", "SHFEE", "MDW2210", "MDW2215", "MDW2220", "CBAG" };
                        int overallQty = DtmContext.ShoppingCart.Where(sc => !excludedProducts.Contains(sc.ProductCode)).Sum(sc => sc.Quantity);

                        if (overallQty == 1)
                        {
                            OrderManager.SetProductQuantity("MDW2215", 0);
                            OrderManager.SetProductQuantity("MDW2220", 0);
                            OrderManager.SetProductQuantity("MDW2210", 1);

                            DtmContext.ShoppingCart["MDW2210"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDW2210"].Price = discountRounded;
                        }
                        else if (overallQty == 2)
                        {
                            discount = -(discountedCartTotal * .15M);
                            OrderManager.SetProductQuantity("MDW2210", 0);
                            OrderManager.SetProductQuantity("MDW2220", 0);
                            OrderManager.SetProductQuantity("MDW2215", 1);

                            DtmContext.ShoppingCart["MDW2215"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDW2215"].Price = discountRounded;

                        }
                        else
                        {
                            discount = -(discountedCartTotal * .2M);
                            OrderManager.SetProductQuantity("MDW2215", 0);
                            OrderManager.SetProductQuantity("MDW2210", 0);
                            OrderManager.SetProductQuantity("MDW2220", 1);

                            DtmContext.ShoppingCart["MDW2220"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDW2220"].Price = discountRounded;

                        }
                        break;
                    }
                case "MDWSALE":
                    {
                        var promoCodeVariants = new List<string>() { "MDWSALE", "MDWSALE10", "MDWSALE15", "MDWSALE20" };
                        var discountedCartTotal = DtmContext.ShoppingCart.Where(sc => !promoCodeVariants.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(discountedCartTotal * .1M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);

                        if (discountedCartTotal >= 19.99M && discountedCartTotal < 29.99M)
                        {
                            OrderManager.SetProductQuantity("MDWSALE15", 0);
                            OrderManager.SetProductQuantity("MDWSALE20", 0);
                            OrderManager.SetProductQuantity("MDWSALE10", 1);

                            DtmContext.ShoppingCart["MDWSALE10"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDWSALE10"].Price = discountRounded;
                            ViewData["promoCodeTarget"] = "MDWSALE";
                        }
                        else if (discountedCartTotal >= 29.99M && discountedCartTotal < 39.99M)
                        {
                            discount = -(discountedCartTotal * .15M);
                            OrderManager.SetProductQuantity("MDWSALE10", 0);
                            OrderManager.SetProductQuantity("MDWSALE20", 0);
                            OrderManager.SetProductQuantity("MDWSALE15", 1);

                            DtmContext.ShoppingCart["MDWSALE15"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDWSALE15"].Price = discountRounded;
                            ViewData["promoCodeTarget"] = "MDWSALE";
                        }
                        else if (discountedCartTotal >= 39.99M)
                        {
                            discount = -(discountedCartTotal * .2M);
                            OrderManager.SetProductQuantity("MDWSALE15", 0);
                            OrderManager.SetProductQuantity("MDWSALE10", 0);
                            OrderManager.SetProductQuantity("MDWSALE20", 1);

                            DtmContext.ShoppingCart["MDWSALE20"].Price = discount;
                            discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                            Order.Items["MDWSALE20"].Price = discountRounded;
                            ViewData["promoCodeTarget"] = "MDWSALE";
                        }
                       
                        break;
                    }
                case "BUNDLES":
                    {
                        var totalBundlePrice = DtmContext.ShoppingCart.Where(sc => !sc.ProductCode.Equals("BUNDLES") && sc.ProductCode.StartsWith("BUN")).Sum(sc => sc.Quantity * sc.Price);
                        var discount = -(totalBundlePrice * .15M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);

                        if (totalBundlePrice > 0)
                        {
                            OrderManager.SetProductQuantity("BUNDLES15", 1);
                            DtmContext.ShoppingCart["BUNDLES15"].Price = discount;
                            Order.Items["BUNDLES15"].Price = discountRounded;
                            ViewData["promoCodeTarget"] = "BUNDLES";
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("BUNDLES", 0);
                            AddModelStateError("PromoCode", "Please add a bundle item to your cart to use promo code BUNDLES.");
                        }
                    }
                    break;
                case "WINNERONE":
                case "WINNERTWO":
                case "WINNERTHREE":
                case "WINNERFOUR":
                case "WINNERFIVE":
                case "WINNERSIX":
                case "WINNERTEST":
                case "WINNERTEST2":
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, promoCodeAction.Quantity);

                    var subTotal = DtmContext.ShoppingCart.Where(i=> i.Price.HasValue && i.Price.Value > 0).Sum(i=> i.Price.Value * i.Quantity);
                    var shippingTotal = DtmContext.ShoppingCart.Where(i => i.Shipping.HasValue && i.Shipping.Value > 0).Sum(i => i.Shipping.Value * i.Quantity);
                    var discountTotal = subTotal + shippingTotal;
                    var absPromoValue = Math.Abs(promoCodeAction.Value);
                    var newPrice = -1 * (discountTotal > absPromoValue ? absPromoValue : discountTotal);
                     
                    DtmContext.ShoppingCart.Items[promoCodeAction.PromoCode].Price = newPrice;
                    OrderManager.AddOrderCode(newPrice.ToString(), promoCodeAction.PromoCode + "TransactionFee");
                    ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
                    break;
                case "SPA30":
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, promoCodeAction.Quantity);
                    subTotal = DtmContext.ShoppingCart.Where(i => i.Price.HasValue && i.Price.Value > 0).Sum(i => i.Price.Value * i.Quantity);
                    shippingTotal = DtmContext.ShoppingCart.Where(i => i.Shipping.HasValue && i.Shipping.Value > 0).Sum(i => i.Shipping.Value * i.Quantity);
                    discountTotal = subTotal + shippingTotal;
                    var discountPrice = Math.Round((promoCodeAction.Value * discountTotal) * -1, 2, MidpointRounding.AwayFromZero);
                    DtmContext.ShoppingCart.Items[promoCodeAction.PromoCode].Price = discountPrice;
                    OrderManager.AddOrderCode(discountPrice.ToString(), promoCodeAction.PromoCode + "TransactionFee");
                    ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
                    break;
                case "BOGOFC":
                    {
                        var facialCleanseItems = new string[] { "CLEANSEN", "BUNCLSEN", "BUNCLSE2N", "BUNMITTSN" };
                        if (DtmContext.ShoppingCart.Where(sc => facialCleanseItems.Contains(sc.ProductCode)).Sum(x => x.Quantity) > 0)
                        {
                            OrderManager.SetProductQuantity("BOGOFC", 1);
                            ViewData["promoCodeTarget"] = promoCodeAction.PromoCode;
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("BOGOFC", 0);
                            AddModelStateError("PromoCode", " Please add Facial Cleanse to your cart to use promo code BOGOFC.");
                        }
                        break;
                    }

                case "SPRING25":
                    {
                       
                        var facialItems = new string[] { "FACEBLUSHN", "PBLUEN", "FACELAVN", "BROWPBN", "BROWBLUSHN", "BROW", "UAN", "SHRN","BIKININ", "NUN", "GLON", "LEGN", "SLFLBROWN", "SLFLBODYRN" };

                        var totalProductPrice = DtmContext.ShoppingCart.Where(sc => !promoCode.Contains(sc.ProductCode) && facialItems.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(totalProductPrice * .25M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                       
                        if (totalProductPrice > 0)
                        {
                            OrderManager.SetProductQuantity("SPRING25", 1);
                            Order.Items["SPRING25"].Price = discountRounded;
                            DtmContext.ShoppingCart["SPRING25"].Price = discount;
                            ViewData["promoCodeTarget"] = promoCode;
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("SPRING25", 0);
                            AddModelStateError("PromoCode", " Please add Hair Removal Products to your cart to use promo code SPRING25.");
                        }
                        break;
                    }
                case "NAILEDIT":
                    {

                        var nailsItems = new string[] { "NAILSN", "PEDIN" };

                        var totalProductPrice = DtmContext.ShoppingCart.Where(sc => !promoCode.Contains(sc.ProductCode) && nailsItems.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(totalProductPrice * .2M);
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);

                        if (totalProductPrice > 0)
                        {
                            OrderManager.SetProductQuantity("NAILEDIT", 1);
                            Order.Items["NAILEDIT"].Price = discountRounded;
                            DtmContext.ShoppingCart["NAILEDIT"].Price = discount;
                            OrderManager.AddOrderCode(discountRounded.ToString(), promoCodeAction.PromoCode + "TransactionFee");
                            ViewData["promoCodeTarget"] = promoCode;
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("NAILEDIT", 0);
                            ViewData["promoCodeTarget"] = null;
                            AddModelStateError("PromoCode", " Please add nail device product to your cart to use promo code NAILEDIT.");
                        }
                        break;
                    }
                case "SPADAY":
                    {
                        var discountedCartTotal = DtmContext.ShoppingCart.Where(sc => sc.ProductCode == "SPAN").Sum(sc => sc.Price * sc.Quantity);
                        var discount = -(discountedCartTotal * .2M);
                        OrderManager.SetProductsQuantity(new string[] { "SPADAY1", "FREECSRH" }, 1);
                        DtmContext.ShoppingCart["SPADAY1"].Price = discount;
                        var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                        Order.Items["SPADAY1"].Price = discountRounded;
                        ViewData["promoCodeTarget"] = "SPADAY";
                        OrderManager.AddOrderCode(discountRounded.ToString(), promoCodeAction.PromoCode + "TransactionFee");

                        break;
                    }

                default:
                    break;
            }
        }

        public override void OnProcessPromoCode(SafeDictionary postData)
        {
            base.OnProcessPromoCode(postData);

            if(DtmContext.ShoppingCart != null && DtmContext.ShoppingCart.Any(i=> i.ProductCode == "BEAUTY25"))
            {
                ViewData["promoCodeTarget"] = "BEAUTY";
            }
        }
        private void OnProcessPromoCode(string promoCode, List<string> discountedItems, decimal discountedPercent, string errorMessage)
        {
            var cartQty = DtmContext.ShoppingCart.Where(sc => discountedItems.Contains(sc.ProductCode)).Sum(x => x.Quantity);
            var itemsQty = Order.OrderItems.Where(oi => discountedItems.Contains(oi.CachedProductInfo.ProductCode)).Sum(oi => oi.Quantity);
            if (DtmContext.Page.IsStartPageType && cartQty > 0)
            {
                var discountedCartTotal= DtmContext.ShoppingCart.Where(sc => discountedItems.Contains(sc.ProductCode)).Sum(sc => sc.Price * sc.Quantity);
                var discount = -(discountedCartTotal * discountedPercent);
                var discountRounded = Math.Round((decimal)discount, 2, MidpointRounding.AwayFromZero);
                OrderManager.SetProductQuantity(promoCode, 1);
                Order.Items[promoCode].Price = discountRounded;
                DtmContext.ShoppingCart[promoCode].Price = discount;
            }
            else if (DtmContext.Page.PageCode == "OrderSummaryWithEdit" && itemsQty > 0)
            {
                var itemsPrice = Order.OrderItems.Where(oi => discountedItems.Contains(oi.CachedProductInfo.ProductCode)).Sum(oi => oi.Price * oi.Quantity);
                var discount = Math.Round(-(itemsPrice) * discountedPercent, 2);
                OrderManager.SetProductQuantity(promoCode, 1);

                Order.Items[promoCode].Price = discount;
                DtmContext.ShoppingCart[promoCode].Price = discount;
            }
            else
            {
                OrderManager.SetProductQuantity(promoCode, 0);
                if (DtmContext.Page.IsStartPageType)
                {
                    AddModelStateError("form", errorMessage);
                }
            }
        }

        public override void PostProcessPageActions()
        {
            if (DtmContext.Page.IsStartPageType && DtmContext.OfferCode == "UPGRADE")
            {
                OrderManager.AddOrderCode(Form["termsCbx"] == "on" ? "True" : "False", "termsCbx");
            }
            // Custom Promo Codes
            var customPromoCodes = new List<string>() {
                "AMOR25", "ASHLEY10", "BEMINE25", "BROWS20", "SALE20", "SPA10", "NEW10", "BEAUTY10", "BEAUTY20", "LEGS20", "FABFACE",
                "ILOVEME", "YOUNAILEDIT", "MDW2210", "MDW2215", "MDW2220", "MDWSALE10", "MDWSALE15", "MDWSALE20", "BUNDLES", "HR30", "SPADAY1"
            };
            var codesExcludedFromTotal = new List<string>
            { "FREESM", "ADDSHIP", "CBAG", "ADAPT", "ADAPTF", "SHFEE",
              "FREESMN","CBAGN", "ADAPTN", "ADAPTFN","FF2"
            };

            if (DtmContext.OfferCode == "UPGRADE")
            {
                //OrderManager.SetProductQuantity("FREESMN", 1);

                var bundles = new Dictionary<string, List<string>>()
                {
                    { "BUNFACEN", new List<string>() { "BUNBROWN" } },
                    { "BUNNAILN", new List<string>() { "BUNPEDIN" } },
                    { "BUNFACE2N", new List<string>() { "BUNBIKN" } },
                    { "BUNCLSEN", new List<string>() { "BUNDERMN", "BUNSTEAMN" } },
                    { "BUNFACE3N", new List<string>() { "BUNNURN", "BUNBIK2N" } },
                    { "BUNCLSE2N", new List<string>() { "BUNCONTN", "BUNICEN" } },
                    { "BUNMITTSN", new List<string>() { "BUNCLSEM" } }
                };

                SetBundleItemQuantity(bundles);

                // FREEADAPT task_id=110686
                var codesWithFreeAdaptor = new List<string>
                { "NUN", "NAILSN", "PEDIN", "CLEANSEN", "LEGN", "BUNNAILN", "BUNPEDIN", "BUNCLSEN", "BUNNURN", "BUNCLNS2N"};
                if (DtmContext.ShoppingCart.Where(sc => codesWithFreeAdaptor.Contains(sc.ProductCode)).Sum(x => x.Quantity) > 0)
                {
                    OrderManager.SetProductQuantity("FREEADAPTN", 1);
                }
                else
                {
                    OrderManager.SetProductQuantity("FREEADAPTN", 0);
                }

                var hasFreeShip = DtmContext.ShoppingCart.Any(oi => oi.ProductCode == "HANKY");
                var totalPrice = DtmContext.ShoppingCart.Where(i => i.ProductCode != "ADDSHIP"
                && i.ProductCode != "HOLIDAY20" && !i.ProductCode.Contains("SHFEE")).Sum(io => io.Quantity * io.Price);

                // Free Shipping
                decimal freeShipPrice = 29.99M;
                var priceCompare = Decimal.Compare((decimal)totalPrice, freeShipPrice);
                var isOverfreeShipPrice = priceCompare >= 0;

                //Task ID: 114681. Pass free cosmetic bag with every order. 9/13/2023
                if (totalPrice > 0) 
                {
                    OrderManager.SetProductQuantity("CBAGN", 1);
                }

                if (isOverfreeShipPrice || hasFreeShip)
                {
                    OrderManager.SetProductQuantity("SHFEE", 0);
                    //OrderManager.SetProductQuantity("FFSHIPFREE22", 1);
                    //OrderManager.SetProductQuantity("CBAGN", 1);

                    if (DtmContext.ShoppingCart["ADAPTN"].Quantity > 0)
                    {
                        OrderManager.SetProductQuantity("ADAPTFN", DtmContext.ShoppingCart["ADAPTN"].Quantity);
                        OrderManager.SetProductQuantity("ADAPTN", 0);
                    }

                    if (DtmContext.ShoppingCart["NFRIGN"].Quantity > 0)
                    {
                        OrderManager.SetProductQuantity("NFRIGFSN", DtmContext.ShoppingCart["NFRIGN"].Quantity);
                        OrderManager.SetProductQuantity("NFRIGN", 0);
                    }
                }
                else if (totalPrice == 0)
                {
                    OrderManager.SetProductQuantity("SHFEE", 0);
                    OrderManager.SetProductQuantity("FFSHIPFREE22", 0);
                    OrderManager.SetProductQuantity("CBAGN", 0);
                    OrderManager.SetProductQuantity("FF2", 0);
                }
                else
                {
                    //OrderManager.SetProductQuantity("CBAGN", 0);
                    var hasItems = DtmContext.ShoppingCart
                        .Any(i => !codesExcludedFromTotal.Contains(i.ProductCode) && i.CampaignProduct.ProductTypeId != 9);

                    if (hasItems)
                    {
                        OrderManager.SetProductQuantity("SHFEE", 1);
                        OrderManager.SetProductQuantity("FFSHIPFREE22", 0);
                    }
                    else
                    {
                        OrderManager.SetProductQuantity("SHFEE", 0);
                        //OrderManager.SetProductQuantity("FFSHIPFREE22", 1);
                    }

                    if (DtmContext.ShoppingCart["ADAPTFN"].Quantity > 0)
                    {
                        OrderManager.SetProductQuantity("ADAPT", DtmContext.ShoppingCart["ADAPTFN"].Quantity);
                        OrderManager.SetProductQuantity("ADAPTFN", 0);
                    }
                }
                if (DtmContext.ShoppingCart["TIKTOK30"].Quantity > 0)
                {
                    OrderManager.SetProductQuantity("SHFEE", 0);
                }
                var showerWandsQuantity = (DtmContext.ShoppingCart["MERRY"].Quantity > 0) ? 1 : 0;
                OrderManager.SetProductQuantity("FREECSPA", showerWandsQuantity);


                //auto add free product on spend $49.99 task_id=113161
                decimal shipPrice = 49.99M;
                var comparePrice = Decimal.Compare((decimal)totalPrice, shipPrice);
                var isOverShipPrice = comparePrice >= 0;

                if (isOverShipPrice || hasFreeShip)
                {
                    //Disabling  again. Task ID: 113652
                    //OrderManager.SetProductQuantity("FF2", 1);

                }
                else
                {
                    OrderManager.SetProductQuantity("FF2", 0);
                }
            }

            // Custom Promo Codes
            if (DtmContext.Version >= 2 || DtmContext.OfferCode == "UPGRADE")
            {
                if (DtmContext.Page.IsStartPageType || DtmContext.Page.PageCode == "OrderSummaryWithEdit")
                {
                    var promoCodeQty = DtmContext.Page.IsStartPageType
                        ? DtmContext.ShoppingCart.Where(sc => customPromoCodes.Contains(sc.ProductCode)).Sum(x => x.Quantity)
                        : Order.OrderItems.Where(oi => customPromoCodes.Contains(oi.CachedProductInfo.ProductCode)).Sum(x => x.Quantity);
                    var totalQuantity = DtmContext.Page.IsStartPageType
                        ? DtmContext.ShoppingCart.Where(sc => !customPromoCodes.Contains(sc.ProductCode)).Sum(x => x.Quantity)
                        : Order.OrderItems.Where(sc => !customPromoCodes.Contains(sc.CachedProductInfo.ProductCode)).Sum(x => x.Quantity);

                    if (promoCodeQty >= 1 && totalQuantity > 0)
                    {
                        var promoCode = DtmContext.ShoppingCart.Where(sc => customPromoCodes.Contains(sc.ProductCode)).Select(sc => sc.ProductCode)
                            .FirstOrDefault();
                        var promoList = DtmContext.PromoCodeRules.Where(p => p.ActionType == PromoCodeRuleType.Custom).ToList();
                        var mdwPromoVariants = new List<string>() { "MDW2210", "MDW2215", "MDW2220" };
                        var mdwPromoVariants2023 = new List<string>() { "MDWSALE10", "MDWSALE15", "MDWSALE20" };
                        foreach (var p in promoList)
                        {
                            if (p.PromoCode == promoCode || (p.PromoCode == "MDW22" && mdwPromoVariants.Contains(promoCode)) || (p.PromoCode == "MDWSALE" && mdwPromoVariants2023.Contains(promoCode)))
                            {
                                OnProcessCustomPromoCode(p, null);
                            }
                        }
                    }

                    if (DtmContext.ShoppingCart.Any(i=> i.ProductCode.Contains("GET50")))
                    {
                        var totalPrice = DtmContext.ShoppingCart.Where(i => i.ProductCode != "ADDSHIP" && !i.ProductCode.Contains("GET50") && !i.ProductCode.Contains("SHFEE")).Sum(io => io.Quantity * io.Price);
                        decimal discountPriceThreshold = 100M;
                        var discountPriceCompare = Decimal.Compare((decimal)totalPrice, discountPriceThreshold);
                        var isOverThresholdPrice = discountPriceCompare >= 0;

                        if (!isOverThresholdPrice)
                        {
                            OrderManager.SetProductQuantity("GET50", 0);
                            ViewData["promoCodeTarget"] = null;
                        }
                    }

                    
                }
            }

            if (DtmContext.Version >= 2)
            {
                if (DtmContext.Page.IsStartPageType)
                {
                    //OrderManager.SetProductQuantity("FREESM", 1);

                    if (DtmContext.Version == 20)
                    {
                        var bundles = new Dictionary<string, List<string>>()
                        {
                            { "BUNFACE", new List<string>() { "BUNBROW" } }, { "BUNNAIL", new List<string>() { "BUNPEDI" } }, { "BUNFACE2", new List<string>() { "BUNBIK" } },
                            { "BUNCLSE", new List<string>() { "BUNDERM", "BUNSTEAM" } }, { "BUNFACE3", new List<string>() { "BUNNUR", "BUNBIK2" } }, { "BUNCLSE2", new List<string>() { "BUNCONT", "BUNICE" } },
                            { "BUNMITTS", new List<string>() { "BUNCLSEM" } }
                        };

                        SetBundleItemQuantity(bundles);
                    }

                    // FREEADAPT task_id=108952
                    var codesWithFreeAdaptor = new List<string> { "NU", "NAILS", "PEDI", "CLEANSE", "LEG", "BUNNAIL", "BUNPEDI", "BUNCLSE", "BUNNUR", "BUNCLNS2", "BUNCLSE2", "BUNMITTS" };
                    if (DtmContext.ShoppingCart.Where(sc => codesWithFreeAdaptor.Contains(sc.ProductCode)).Sum(x => x.Quantity) > 0)
                    {
                        OrderManager.SetProductQuantity("FREEADAPT", 1);
                    }
                    else
                    {
                        OrderManager.SetProductQuantity("FREEADAPT", 0);
                    }

                    if (DtmContext.Version >= 3)
                    {
                        OrderManager.SetProductQuantity("BODBON", DtmContext.ShoppingCart["BOD"].Quantity);
                    }

                    var totalPrice = DtmContext.ShoppingCart.Where(i => i.ProductCode != "ADDSHIP" && i.ProductCode != "HOLIDAY20" && !i.ProductCode.Contains("SHFEE")).Sum(io => io.Quantity * io.Price);

                    // 20% discount for orders over $50
                    decimal discountPriceThreshold = 49.99M;
                    var discountPriceCompare = Decimal.Compare((decimal)totalPrice, discountPriceThreshold);
                    var isOverThresholdPrice = discountPriceCompare >= 0;

                    if (!isOverThresholdPrice)
                    {
                        OrderManager.SetProductQuantity("HOLIDAY20", 0);
                    }

                    // Free Shipping
                    decimal freeShipPrice = 29.99M;
                    var priceCompare = Decimal.Compare((decimal)totalPrice, freeShipPrice);
                    var isOverfreeShipPrice = priceCompare >= 0;


                    if (isOverfreeShipPrice)
                    {
                        OrderManager.SetProductQuantity("SHFEE", 0);
                        //OrderManager.SetProductQuantity("CBAG", 1);
                        if (DtmContext.Version == 2 && DtmContext.ShoppingCart["LEG"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("SHFEE", 0);
                        }
                        if (DtmContext.ShoppingCart["ADAPT"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("ADAPTF", DtmContext.ShoppingCart["ADAPT"].Quantity);
                            OrderManager.SetProductQuantity("ADAPT", 0);
                        }

                    }
                    else if (totalPrice == 0)
                    {
                        OrderManager.SetProductQuantity("SHFEE", 0);
                        OrderManager.SetProductQuantity("CBAG", 0);
                    }
                    else
                    {
                        OrderManager.SetProductQuantity("CBAG", 0);
                        var hasItems = DtmContext.ShoppingCart
                            .Any(i => !codesExcludedFromTotal.Contains(i.ProductCode) && i.CampaignProduct.ProductTypeId != 9);

                        if (hasItems)
                        {
                            OrderManager.SetProductQuantity("SHFEE", 1);
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("SHFEE", 0);
                        }

                        if (DtmContext.ShoppingCart["ADAPTF"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("ADAPT", DtmContext.ShoppingCart["ADAPTF"].Quantity);
                            OrderManager.SetProductQuantity("ADAPTF", 0);
                        }
                    }

                  


                    //if (DtmContext.Version == 20 && totalPrice >= 40)
                    //{
                    //    OrderManager.SetProductQuantity("FREEMASK", 1);
                    //}
                    //else
                    //{
                    //    OrderManager.SetProductQuantity("FREEMASK", 0);
                    //}
                }

                if (DtmContext.Page.PageCode == "OrderSummaryWithEdit")
                {
                    if (DtmContext.Version >= 3)
                    {
                        OrderManager.SetProductQuantity("BODBON", Order.Items["BOD"].Quantity);
                    }

                    var totalPrice = Order.OrderItems.Where(oi => oi.CachedProductInfo.ProductCode != "ADDSHIP" && oi.CachedProductInfo.ProductCode != "HOLIDAY20" && oi.CachedProductInfo.ProductCode != "SHFEE").Sum(oi => oi.Quantity * oi.Price);

                    // 20% discount for orders over $50
                    decimal discountPriceThreshold = 49.99M;
                    var discountPriceCompare = Decimal.Compare(totalPrice, discountPriceThreshold);
                    var isOverThresholdPrice = discountPriceCompare >= 0;

                    if (!isOverThresholdPrice)
                    {
                        OrderManager.SetProductQuantity("HOLIDAY20", 0);
                    }
                    // Free Shipping
                    decimal freeShipPrice = 19.99M;
                    var priceCompare = Decimal.Compare((decimal)totalPrice, freeShipPrice);
                    var isOverfreeShipPrice = priceCompare >= 0;

                    if (isOverfreeShipPrice)
                    {
                        OrderManager.SetProductQuantity("SHFEE", 0);
                        OrderManager.SetProductQuantity("CBAG", 1);

                        if (DtmContext.Version == 2 && Order.Items["LEG"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("SHFEE", 0);

                        }

                        if (Order.Items["ADAPT"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("ADAPTF", Order.Items["ADAPT"].Quantity);
                            OrderManager.SetProductQuantity("ADAPT", 0);

                        }


                    }
                    else if (totalPrice == 0)
                    {
                        OrderManager.SetProductQuantity("SHFEE", 0);
                        OrderManager.SetProductQuantity("CBAG", 0);

                    }
                    else
                    {
                        OrderManager.SetProductQuantity("CBAG", 0);
                        var hasItems = Order.OrderItems.Any(i => !codesExcludedFromTotal.Contains(i.CachedProductInfo.ProductCode) && i.CachedProductInfo.ProductTypeId != 9);

                        if (hasItems)
                        {

                            OrderManager.SetProductQuantity("SHFEE", 1);
                        }
                        else
                        {
                            OrderManager.SetProductQuantity("SHFEE", 0);
                        }

                        if (Order.Items["ADAPTF"].Quantity > 0)
                        {
                            OrderManager.SetProductQuantity("ADAPT", Order.Items["ADAPTF"].Quantity);
                            OrderManager.SetProductQuantity("ADAPTF", 0);
                        }


                    }

                    //if (DtmContext.Version == 20 && totalPrice >= 40)
                    //{
                    //    OrderManager.SetProductQuantity("FREEMASK", 1);
                    //}
                    //else
                    //{
                    //    OrderManager.SetProductQuantity("FREEMASK", 0);
                    //}


                    if (DtmContext.Version == 20 && totalPrice >= 75)
                    {
                        OrderManager.SetProductQuantity("ILOVEME", 1);
                    }
                    else
                    {
                        OrderManager.SetProductQuantity("ILOVEME", 0);
                    }

                }
            }

            if (DtmContext.ShoppingCart["FLAWLESS15"].Quantity > 0 || DtmContext.ShoppingCart["SHIPFREE22"].Quantity > 0)
            {
                OrderManager.SetProductQuantity("SHFEE", 0);
            }
            if (DtmContext.ShoppingCart["SONYA20"].Quantity > 0 || DtmContext.ShoppingCart["DAFNE20"].Quantity > 0 || DtmContext.ShoppingCart["KIARRA20"].Quantity > 0)
            {
                OrderManager.SetProductQuantity("SHFEE", 0);
            }


            if (Form.AllKeys.Contains("acceptOffer"))
            {
                var oneTimeOnlyPromoItems = Order.ContextOrderItems
                    .Where(oi => PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.CachedProductInfo.ProductCode))
                    .ToList();

                var oneTimeOnlyPromoQuantity = oneTimeOnlyPromoItems.Sum(oi => oi.Quantity);

                if(oneTimeOnlyPromoQuantity > 0)
                {
                    foreach (var promoItem in oneTimeOnlyPromoItems)
                    {
                        promoCodeManager.IncrementPromoAppliedAmount(promoItem.CachedProductInfo.ProductCode);
                    }
                }

                if (DtmContext.OfferCode == "UPGRADE" && DtmContext.Order.Items["WELCOME10"].Quantity > 0
                && promoCodeManager.IsDuplicateHouseholdOrder(out errors, "WELCOME10", DtmContext.Order.Email))
                {
                    OrderManager.SetProductQuantity("WELCOME10", 0);
                    foreach (var error in errors)
                    {
                        AddModelStateError("PromoCode", error);
                    }
                }
            }
            else
            {

                if (DtmContext.OfferCode == "UPGRADE" && DtmContext.ShoppingCart["WELCOME10"].Quantity > 0
                && promoCodeManager.IsDuplicateHouseholdOrder(out errors, "WELCOME10", Form["param_" + "Email"] ?? Form["Email"] ?? string.Empty))
                {
                    OrderManager.SetProductQuantity("WELCOME10", 0);
                    foreach (var error in errors)
                    {
                        AddModelStateError("PromoCode", error);
                    }
                }
            }

            if (DtmContext.Order.Items["SPA30"].Quantity > 0)
            {
                var subTotal = DtmContext.ShoppingCart.Where(i => i.Price.HasValue && i.Price.Value > 0).Sum(i => i.Price.Value * i.Quantity);
                var shippingTotal = DtmContext.ShoppingCart.Where(i => i.Shipping.HasValue && i.Shipping.Value > 0).Sum(i => i.Shipping.Value * i.Quantity);
                var discountTotal = subTotal + shippingTotal;
                var discountPrice = Math.Round((.30M * discountTotal) * -1, 2, MidpointRounding.AwayFromZero);
                DtmContext.Order.Items["SPA30"].Price = discountPrice;
                DtmContext.ShoppingCart.Items["SPA30"].Price = discountPrice;
                OrderManager.AddOrderCode(discountPrice.ToString(), "SPA30" + "TransactionFee");
            }


            // Add SPADAY for Bundles task_id=111479
            //var totalBundleQty = DtmContext.ShoppingCart.Where(sc => sc.ProductCode.StartsWith("BUN")).Sum(sc => sc.Quantity);
            //if (totalBundleQty > 0)
            //{
            //    OrderManager.SetProductQuantity("SPADAY", 1);
            //}
            //else
            //{
            //    OrderManager.SetProductQuantity("SPADAY", 0);
            //}

            if (DateTime.Now <= DateTime.Parse("10/31/2023 11:59 PM")) 
            {
                SetFreeReplacementHeadQuantity("FREECSRH", new List<string>() { "SPAN" }, new List<string>() { "CSREPN" });
                SetFreeReplacementHeadQuantity("FREEREPNU", new List<string>() { "NUN" }, new List<string>() { "NUREPN", "BUNNURN" });
                SetFreeReplacementHeadQuantity("FREEREPPED", new List<string>() { "PEDIN" }, new List<string>() { "PREPN", "BUNPEDIN" });
                SetFreeReplacementHeadQuantity("FREEREPNAIL", new List<string>() { "NAILSN" }, new List<string>() { "SNREP2N", "BUNNAILN" });
                SetFreeReplacementHeadQuantity("FREEREP2PK", new List<string>() { "FACEBLUSHN", "PBLUEN" }, new List<string>() { "RF30N", "BUNFACEN", "BUNFACE2N", "BUNFACE3N" });
                SetFreeReplacementHeadQuantity("FREEREPH2PK", new List<string>() { }, new List<string>() { "BODREPN" });
                SetFreeReplacementHeadQuantity("FLEG", new List<string>() { }, new List<string>() { "LEGREPN" });
            }

        }

        private void SetFreeReplacementHeadQuantity(string freeReplacementHead, List<string> mainOffers, List<string> itemVariants) 
        {
            var freeReplacementHeadQuantity = 0;


            foreach (var mainOffer in mainOffers) 
            {
                if (DtmContext.ShoppingCart[mainOffer].Quantity > 0) 
                {
                    freeReplacementHeadQuantity = 1;
                    break;
                }
            }

            foreach (var itemVariant in itemVariants) 
            {
                if (DtmContext.ShoppingCart[itemVariant].Quantity > 0)
                {
                    freeReplacementHeadQuantity++;
                }
            }

            OrderManager.SetProductQuantity(freeReplacementHead, freeReplacementHeadQuantity);
        }

        private void SetBundleItemQuantity(Dictionary<string,List<string>> bundles) 
        {
            var mainItemTotal = 0;
            foreach (var bundle in bundles) 
            {
                var mainItemQuantity = DtmContext.ShoppingCart[bundle.Key].Quantity;
                foreach (var bonusItem in bundle.Value) 
                {
                    OrderManager.SetProductQuantity(bonusItem, mainItemQuantity);
                    mainItemTotal = mainItemQuantity + mainItemTotal;
                }
            }
            if(mainItemTotal == 0)
            {
                OrderManager.SetProductQuantity("BUNDLES15", 0);
            }
        }

        public override bool OnValidatePromoCodeAction(PromoCodeRule promoCodeAction)
        {
            bool validPromo = true;
            if(PromoCodeItems.OneTimeOnlyPromoCodes.Contains(promoCodeAction.PromoCode))
            {
                var total = DtmContext.ShoppingCart
                .Where(oi => oi.Price.HasValue && !PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.ProductCode))
                .Sum(oi => oi.Price.Value * oi.Quantity);
                if (promoCodeManager.GetPromoAppliedAmount(promoCodeAction.PromoCode) > 0)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.PromoCode, 0);
                    AddModelStateError("PromoCode", promoCodeAction.PromoCode + " has already been used");
                    validPromo = false;
                }
                //else if (total < 100)
                //{MakeSequenceNumberRequest
                //    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                //    AddModelStateError("PromoCode", "Please ensure you have at least $100 worth of items in your cart to use " + promoCodeAction.PromoCode);
                //    validPromo = false;
                //}
            }
            if (promoCodeAction.PromoCode == "WELCOME10" && promoCodeManager.IsDuplicateHouseholdOrder(out errors, promoCodeAction.PromoCode, Form["param_" + "Email"] ?? Form["Email"] ?? string.Empty))
            {
                OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                foreach (var error in errors)
                {
                    AddModelStateError("PromoCode", error);
                }
                validPromo = false;
            }

            if(promoCodeAction.PromoCode == "GET50")
            {
                var totalPrice = DtmContext.ShoppingCart.Where(i => i.ProductCode != "ADDSHIP" && !i.ProductCode.Contains("GET50") && !i.ProductCode.Contains("SHFEE")).Sum(io => io.Quantity * io.Price);
                decimal discountPriceThreshold = 100M;
                var discountPriceCompare = Decimal.Compare((decimal)totalPrice, discountPriceThreshold);
                var isOverThresholdPrice = discountPriceCompare >= 0;

                if (!isOverThresholdPrice)
                {
                    AddModelStateError("PromoCode", "BLACK FRIDAY SALE - Must add minimum of $100 of products to your cart, to receive $50 off your order.");
                    validPromo = false;
                }
            }

            if(promoCodeAction.PromoCode == "COOL23")
            {
                var excludedCodes = DtmContext.CampaignProducts.Where(cp => cp.ProductType == "Shipping" || cp.ProductType == "Promo")
                .Select(cp => cp.ProductCode)
                .ToList();
                var totalPrice = DtmContext.ShoppingCart.Where(x => !excludedCodes.Contains(x.ProductCode) && x.Price.HasValue).Sum(i => i.Price.Value * i.Quantity);
                if(totalPrice < 39.99M)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                    AddModelStateError("PromoCode", "Your order must be $39.99 or more to use promo code COOL23.");
                    validPromo = false;
                }
                
            }

            if (promoCodeAction.PromoCode == "MDWSALE") 
            {
                var excludedCodes = DtmContext.CampaignProducts.Where(cp => cp.ProductType == "Shipping" || cp.ProductType == "Promo")
                  .Select(cp => cp.ProductCode)
                  .ToList();
                var totalPrice = DtmContext.ShoppingCart.Where(x => !excludedCodes.Contains(x.ProductCode) && x.Price.HasValue).Sum(i => i.Price.Value * i.Quantity);
                if (totalPrice < 19.99M)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                    AddModelStateError("PromoCode", "Your order must be $20 or more to use promo code MDWSALE.");
                    validPromo = false;
                }
            }

            if (promoCodeAction.PromoCode == "SPADAY") 
            {
                var hasValidProduct = DtmContext.ShoppingCart.Any(sc => sc.ProductCode == "SPAN");

                if (!hasValidProduct) 
                {
                    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                    AddModelStateError("PromoCode", "Promo code SPADAY only valid with Cleanse Spa offer.");
                    validPromo = false;
                }
            }

            if (promoCodeAction.PromoCode == "PARISBLUE")
            {
                var hasValidProduct = DtmContext.ShoppingCart.Any(sc => sc.ProductCode == "BROWPBN");

                if (!hasValidProduct)
                {
                    OrderManager.SetProductQuantity(promoCodeAction.ProductCode, 0);
                    AddModelStateError("PromoCode", "Promo code PARISBLUE only valid with Parisian Blue Brow offer.");
                    validPromo = false;
                }
            }

            return validPromo;
        }

        public override void PageLoaded(HttpRequestBase request, HttpResponseBase response)
        {
            // PROMO CODES ONLY ALLOWED ONE USE PER EMAIL

            if (DtmContext.ShoppingCart["WELCOME10"].Quantity > 0)
            {
                var cardType = DtmContext.Order.CardType ?? string.Empty;
                if (cardType.ToString().ToUpper() == "PAYPALEC" && promoCodeManager.IsDuplicateHouseholdOrder(out errors, "WELCOME10", DtmContext.Order.Email))
                {
                    OrderManager.SetProductQuantity("WELCOME10", 0);
                    foreach (var error in errors)
                    {
                        AddModelStateError("PromoCode", error);
                    }
                }

                if (DtmContext.OfferCode == "UPGRADE" && DtmContext.PageCode == "Confirmation" && DtmContext.Order.Items["WELCOME10"].Quantity > 0
                    && !promoCodeManager.IsDuplicateHouseholdOrder(out errors, "WELCOME10", DtmContext.Order.Email))
                {
                    promoCodeManager.AddHouseholdOrder(DtmContext.Order.OrderID);
                }



            }
        }
    }
}
