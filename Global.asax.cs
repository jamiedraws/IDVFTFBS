using Dtm.Framework.ClientSites.Web;
using System.Web.Mvc;
using Dtm.Framework.Models;
using System.Web.Routing;
using System.Collections.Generic;
using System.Linq;
using System;
using IDVFTFBS.Extensions;
using IDVFTFBS.Classes;

namespace IDVFTFBS
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {
            //10% off promo codes
            var tenPercentOffPromoCodes = new List<string>()
            {
                "PRO10", "GLO10", "CONTOUR10", "FLAWLESS10", "SURVEY10", "AVREY10", "JESSICA10", "BROWS10", "SHAYLA10",
                "CARLI10", "DANIELLA10", "ARNELL10", "NYMA10", "KAIT10", "TAYLOR10", "SUMMER10",  "MEG10", "ASPYN10",
                "KRISTIN10", "AVA10", "CHANTEL10", "GRWM10", "ALEX10", "CORINNA10", "RYLEY10", "LAUREN10", "GABI10", 
                "NYJA10", "KISH10", "MADDIE10", "LINDSI10", "DANNY10", "SQUARE10", "TIKTOK10", "MOM10", "CLEANSE10", "ICE10", "DELANEY10",
                "SNAP10", "CHYENNE10", "KAYLEIGH10", "NEZZA10", "LYNN10", "MELISSA10", "STEPHANIE10", "NAILS10","CLAUDIA10",
                "KIMBERLY10","YANA10","GOLDY10","LUCIE10","NIA10","NABELA10","KOUVR10","LIV10","THANKU10","SHAHD10",
                "JENN10","JERA10","EILEEN10","TANI10","CARYN10","CATIE10","COCO10","NATALIE10","JULIA10","CASEY10","ELLIE10","ZAHRA10",
                "MARIAH10","MONROE10","TENISHA10", "FALLFAVE", "NINA10", "ELIANA10", "LESLIE10", "SONALI10", "KENNEDY10", "DASIA10", "TAJ10",
                "HALLE10","DOVE10","AMELIA10","FF10","SAVE10","MARIASEE10", "PURECLEAN10", "BIKINI10", "PERFECT10", "STRAYHAIR10", "FACEDUO10", "UNDERARM10","WELCOME10"
            };

            foreach (var promoCode in tenPercentOffPromoCodes)
            {

                DtmContext.PromoCodeRules.Add(new PromoCodeRule(promoCode, PromoCodeRuleType.AddDiscountPercent, promoCode, (decimal)0.1, 1));
            }

            //15% off promo codes
            var fifthteenPercentOffPromoCodes = new List<string>()
            {
                "ASHLEY15","AMELIA15","YSABELA15","IVANA15"
            };

            foreach (var promoCode in fifthteenPercentOffPromoCodes)
            {

                DtmContext.PromoCodeRules.Add(new PromoCodeRule(promoCode, PromoCodeRuleType.AddDiscountPercent, promoCode, (decimal)0.15, 1));
            }

            //20% off promo codes
            var twentyPercentOffPromoCodes = new List<string>()
            {
                "FRIDGE20", "FRIENDS20","LOVEFLAWLESS","HOLIDAY20",
                "FRIDAY20", "MONDAY20", "NEWYEAR21", "HALLE20","FF20","SAVE20",
                "DEAL20", "SUMMER20", "NAILS20", "SAFE20", "SUNNY20","SKINCARE20","PEDI20",
                "CONTOUR20", "LESS20", "ALLURE20", "THANKYOU20", "SILK20", "MANI20", "FACE20", 
                "FALL20", "TREAT20", "THANKS20", "PERFECT20", "ALL20", "BROW20", "GIFT20", "NEXT20",
                "WOW20", "VIP20", "DEC20", "CHEERS20"
            };

            foreach (var promoCode in twentyPercentOffPromoCodes)
            {
                DtmContext.PromoCodeRules.Add(new PromoCodeRule(promoCode, PromoCodeRuleType.AddDiscountPercent, promoCode, (decimal)0.2, 1));
            }

            //25% off promo codes
            var twentyFivePercentOffPromoCodes = new List<string>()
            {
                "WELOVEU"
            };

            foreach (var promoCode in twentyFivePercentOffPromoCodes)
            {
                DtmContext.PromoCodeRules.Add(new PromoCodeRule(promoCode, PromoCodeRuleType.AddDiscountPercent, promoCode, (decimal)0.25, 1));
            }

            //Custom Promo Codes
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("LEGS20", PromoCodeRuleType.Custom, "LEGS20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("AMOR25", PromoCodeRuleType.Custom, "AMOR25", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("ASHLEY10", PromoCodeRuleType.Custom, "ASHLEY10", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BEMINE25", PromoCodeRuleType.Custom, "BEMINE25", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BROWS20", PromoCodeRuleType.Custom, "BROWS20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SALE20", PromoCodeRuleType.Custom, "SALE20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPA10", PromoCodeRuleType.Custom, "SPA10", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("NEW10", PromoCodeRuleType.Custom, "NEW10", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BEAUTY10", PromoCodeRuleType.Custom, "BEAUTY10", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BEAUTY20", PromoCodeRuleType.Custom, "BEAUTY20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("GET20", PromoCodeRuleType.Custom, "GET20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("CONTOUR20", PromoCodeRuleType.Custom, "CONTOUR20", 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MDW22", PromoCodeRuleType.Custom, "MDW2210", 1, DateTime.Parse("2022-05-24"), DateTime.Parse("2022-06-06")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MDWSALE", PromoCodeRuleType.Custom, "MDWSALE10", 1, DateTime.Parse("2023-05-12"), DateTime.Parse("2023-05-30 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MERRY", PromoCodeRuleType.AddDiscountPercent, "MERRY",.25m, 1, DateTime.Parse("2022-12-13"), DateTime.Parse("2023-01-02")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("HR30", PromoCodeRuleType.Custom, "HR30", 1, DateTime.Parse("2023-01-15"), DateTime.Parse("2023-01-30")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPADAY", PromoCodeRuleType.Custom, "SPADAY1", 1, DateTime.Parse("2023-06-12"), DateTime.Parse("2023-06-25 11:59PM")));

            //20% off + free shipping
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SONYA20", PromoCodeRuleType.AddDiscountPercent, "SONYA20", .20m, 1, DateTime.Parse("2023-03-23"), DateTime.Parse("2023-12-31")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("DAFNE20", PromoCodeRuleType.AddDiscountPercent, "DAFNE20", .20m, 1, DateTime.Parse("2023-03-23"), DateTime.Parse("2023-12-31")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("KIARRA20", PromoCodeRuleType.AddDiscountPercent, "KIARRA20", .20m, 1, DateTime.Parse("2023-03-23"), DateTime.Parse("2023-12-31")));


            //           ************  Add 6 days to end date.    ******************
            //Banner is removed 6 days prior (The true end date) but promo should still be usable for users 6 days after the "true" end date.
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FABFACE", PromoCodeRuleType.Custom, "FABFACE", 1, DateTime.Parse("2022-03-02"), DateTime.Parse("2022-03-16")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("ILOVEME", PromoCodeRuleType.Custom, "ILOVEME", 1, DateTime.Parse("2022-03-10"), DateTime.Parse("2022-03-24")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("YOUNAILEDIT", PromoCodeRuleType.Custom, "YOUNAILEDIT", 1, DateTime.Parse("2022-03-20"), DateTime.Parse("2022-04-05")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPRINGCLEAN", PromoCodeRuleType.Custom, "SPRINGCLEAN", 1, DateTime.Parse("2022-04-20"), DateTime.Parse("2022-05-06")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SUPER10", PromoCodeRuleType.AddDiscountPercent, "SUPER10", .1m, 1, DateTime.Parse("2022-05-04"), DateTime.Parse("2022-05-20")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("CYBER30", PromoCodeRuleType.AddDiscountPercent, "CYBER30", .30m, 1, DateTime.Parse("2021-11-11"), DateTime.Parse("2021-12-01")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FRESH15", PromoCodeRuleType.AddDiscountPercent, "FRESH15", .15m, 1, DateTime.Parse("2022-06-06"), DateTime.Parse("2022-06-01")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FLAWLESS15", PromoCodeRuleType.AddDiscountPercent, "FLAWLESS15", .15m, 1, DateTime.Parse("2022-08-10"), DateTime.Parse("2022-08-23")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("APPD2022", PromoCodeRuleType.AddDiscountPercent, "APPD2022", .15m, 1, DateTime.Parse("2022-7-06"), DateTime.Parse("2022-07-17")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("APD2022", PromoCodeRuleType.AddDiscountPercent, "APD2022", .20m, 1, DateTime.Parse("2022-07-06"), DateTime.Parse("2022-07-19")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BUNDLES", PromoCodeRuleType.Custom, "BUNDLES", 1, DateTime.Parse("2022-09-14"), DateTime.Parse("2022-10-09 11:59PM"))); // Valid 9/20-10/3  task_id=111333
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BUNDLES15", PromoCodeRuleType.Custom, "BUNDLES15", 1, DateTime.Parse("2022-09-13"), DateTime.Parse("2022-10-09 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SHIPFREE22", PromoCodeRuleType.Add, "SHIPFREE22", 1, DateTime.Parse("2022-08-14"), DateTime.Parse("2022-12-31")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BEAUTY", PromoCodeRuleType.AddDiscountPercent, "BEAUTY25", .25m, 1, DateTime.Parse("2022-10-05"), DateTime.Parse("2022-11-06")));//Validity Dates 10/5-10/31
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("TIKTOK30", PromoCodeRuleType.AddDiscountPercent, "TIKTOK30", .30m, 1, DateTime.Parse("2022-10-04"), DateTime.Parse("2022-11-05 11:59PM")));//Validity Dates 10/13-11/5 task_id=111508
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FABFAM", PromoCodeRuleType.AddDiscountPercent, "FABFAM", .30m, 1, DateTime.Parse("2022-10-31"), DateTime.Parse("2022-11-14 11:59PM")));//Validity Dates 10/31-11/8 task_id=111867
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("GET50", PromoCodeRuleType.AddDiscountValue, "GET50", -50M, 1, DateTime.Parse("2022-11-18"), DateTime.Parse("2022-11-27 11:59PM")));//Validity Dates 11/18-11/27 task_id=112015
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPA30", PromoCodeRuleType.Custom, "SPA30_custom", .30M, 1, DateTime.Parse("2022-11-16"), DateTime.Parse("2022-11-29 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MERRY", PromoCodeRuleType.Custom, "MERRY_custom", .25M, 1, DateTime.Parse("2022-12-15"), DateTime.Parse("2023-1-2 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPA30_custom", PromoCodeRuleType.ProductTransactionFee, "SPA30", .30M, 1, DateTime.Parse("2022-11-16"), DateTime.Parse("2022-11-29 11:59PM")));//Validity Dates 11/28-11/29 task_id=112016
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MERRY_custom", PromoCodeRuleType.ProductTransactionFee, "MERRY", .30M, 1, DateTime.Parse("2022-12-15"), DateTime.Parse("2023-1-2 11:59PM")));//Validity Dates 11/28-11/29 task_id=112016
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST2", PromoCodeRuleType.Custom, "WINNERTEST2_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST2_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTEST2", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST", PromoCodeRuleType.Custom, "WINNERTEST_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTEST_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTEST", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERONE", PromoCodeRuleType.Custom, "WINNERONE_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERONE_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERONE", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTWO", PromoCodeRuleType.Custom, "WINNERTWO_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTWO_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTWO", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTHREE", PromoCodeRuleType.Custom, "WINNERTHREE_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERTHREE_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERTHREE", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERFOUR", PromoCodeRuleType.Custom, "WINNERFOUR_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERFOUR_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERFOUR", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERFIVE", PromoCodeRuleType.Custom, "WINNERFIVE_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERFIVE_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERFIVE", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERSIX", PromoCodeRuleType.Custom, "WINNERSIX_custom", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("WINNERSIX_custom", PromoCodeRuleType.ProductTransactionFee, "WINNERSIX", -100M, 1));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("BOGOFC", PromoCodeRuleType.Custom, "BOGOFC", 1, DateTime.Parse("2023-02-08"), DateTime.Parse("2023-02-15")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("COOL23", PromoCodeRuleType.Add, "COOL23", 1, DateTime.Parse("2023-02-15"), DateTime.Parse("2023-02-15")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("PARISBLUE", PromoCodeRuleType.Add, "PARISBLUE", 1, DateTime.Parse("2023-07-12"), DateTime.Parse("2023-07-22")));
            //DtmContext.PromoCodeRules.Add(new PromoCodeRule("FREEFRIDGE", PromoCodeRuleType.Add, "FREEFRIDGE", 1, DateTime.Parse("2023-03-2"), DateTime.Parse("2023-05-30")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MOM20", PromoCodeRuleType.AddDiscountPercent, "MOM20", .2M, 1, DateTime.Parse("2023-05-04"), DateTime.Parse("2023-05-14 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("MISSEDYOU", PromoCodeRuleType.AddDiscountPercent, "MISSEDYOU", .25M, 1, DateTime.Parse("8/8/2023"), DateTime.Parse("11/1/2023 11:59 PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("NAILEDIT", PromoCodeRuleType.Custom, "NAILEDIT_custom", 0.2M, 1, DateTime.Parse("2023-08-21"), DateTime.Parse("2023-09-14 11:59PM")));
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("NAILEDIT_custom", PromoCodeRuleType.ProductTransactionFee, "NAILEDIT", 0.2M, 1, DateTime.Parse("2023-08-21"), DateTime.Parse("2023-09-14 11:59PM")));

            //15% off site wide
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SB2023", PromoCodeRuleType.AddDiscountPercent, "SB2023", .15M, 1, DateTime.Parse("2023-03-02"), DateTime.Parse("2023-03-16")));

            //Adding back on stage. Task ID: 113425 
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SPRING25", PromoCodeRuleType.Custom, "SPRING25", 1, DateTime.Parse("2023-03-19"), DateTime.Parse("2023-04-15 11:59PM")));

            DtmContext.PromoCodeRules.Add(new PromoCodeRule("FREEREPHEADPROMO", PromoCodeRuleType.Custom, "FREEREPHEADPROMO", 1, DateTime.Parse("2023-09-05"), DateTime.Parse("2023-10-31")));

            PromoCodeHelper.PromoCodeItems.OneTimeOnlyPromoCodes.AddRange(new List<string>
            {
                "WINNERONE",
                "WINNERTWO",
                "WINNERTHREE",
                "WINNERTEST",
                "WINNERTEST2",
                "WINNERTEST3",
                "WINNERFOUR",
                "WINNERFIVE",
                "WINNERSIX"

            });
        }
        protected override void OnBeginRequest(object sender, EventArgs e)
        {
            base.OnBeginRequest(sender, e);

            IDVFTFBS.RedirectRules.RedirectResult redirectResult = IDVFTFBS.RedirectRules.RedirectRuleEngine.GetMigratedRedirect(Request);
            if (redirectResult.HasRedirect)
            {
                Response.Redirect(redirectResult.RedirectUrl, true);
            }
        }

        protected override void OnEndRequest(object sender, EventArgs e)
        {

            base.OnEndRequest(sender, e);
            IDVFTFBS.RedirectRules.RedirectResult redirectResult;
            if (Response.StatusCode == 404)
            {
                redirectResult = IDVFTFBS.RedirectRules.RedirectRuleEngine.GetPageNotFoundRedirect(Request);
                if (redirectResult.HasRedirect)
                {
                    Response.Redirect(redirectResult.RedirectUrl);
                }
            }

        }

        protected override void ConfigureAdditionalRoutes(RouteCollection routes)
        {
            var offerRegex = string.Format("({0})", string.Join("|", DtmContext.CampaignOfferVersions
                .Select(cov => cov.OfferCode)
                .Distinct()));
            var versionRegex = string.Format("({0})", string.Join("|", DtmContext.CampaignOfferVersions
              .Select(cov => cov.VersionNumber)
              .Distinct()));

            routes.MapRoute("OfferAccountRoutes",
             "{offer}/{version}/Account/{action}/{id}",
                new { controller = "Account", action = "Index", pageCode = "Login", id = UrlParameter.Optional },
                new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("AddAddress", "Profile/AddAddress", 
                new { controller = "Profile", action = "AddAddress" });

            routes.MapRoute("EditAddress", "Profile/EditAddress",
                new { controller = "Profile", action = "EditAddress" });

            routes.MapRoute("RemoveAddress", "Profile/RemoveAddress",
                new { controller = "Profile", action = "DeleteAddress" });

            routes.MapRoute("AddAddressOfferVersion", "{offer}/{version}/Profile/AddAddress",
               new { controller = "Profile", action = "AddAddress" },
               new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("EditAddressOfferVersion", "{offer}/{version}/Profile/EditAddress",
                new { controller = "Profile", action = "EditAddress" },
                new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("RemoveAddressOfferVersion", "{offer}/{version}/Profile/RemoveAddress",
                new { controller = "Profile", action = "DeleteAddress" },
                new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("RegisterProfile", "Profile/CreateAccount/{accountType}",
                new { controller = "Profile", action = "CreateAccount", accountType = AccountType.Consumer });

            routes.MapRoute("RegisterProfileOfferVersion", "{offer}/{version}/Profile/CreateAccount/{accountType}",
                new { controller = "Profile", action = "CreateAccount", accountType = AccountType.Consumer },
                new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("SetDefault", "Profile/SetDefault",
                new { controller = "Profile", action = "SetDefault" });

            routes.MapRoute("SetDefaultOfferVersion", "{offer}/{version}/Profile/SetDefault",
                new { controller = "Profile", action = "SetDefault" },
                new { offer = offerRegex, version = versionRegex });

            routes.MapRoute("CheckoutLogin", "Profile/Checkout", new { controller = "Profile", action = "CheckoutLogin" });
            routes.MapRoute("ProfileLogin", "Profile/Login", new { controller = "Profile", action = "LoginAccount" });
            routes.MapRoute("ProfileLogout", "Profile/Logout", new { controller = "Profile", action = "LogoutAccount" });
            routes.MapRoute("ProfileLogoutRedirect", "Profile/Logout/{redirectOverride}", new { controller = "Profile", action = "LogoutAccount", redirectOverride = string.Empty });
            routes.MapRoute("UnauthorizedLogin", "Login", new { controller = "Login", action = "Login" });

            routes.MapRoute("DynamicCategory", "GetCategory", new { controller = "Category", action = "RenderCategory" });
            routes.MapRoute("DynamicPage", "GetPage", new { controller = "Page", action = "RenderPage" });
            routes.MapRoute("Search", "Search", new { controller = "Search", action = "Search" });

            // Article blogs
            routes.MapRoute("Articles", "Articles", new { controller = "Articles", action = "GetPosts", tagSlug = "Articles" });
            routes.MapRoute("CategoryArticles", "Articles/{categorySlug}", new { controller = "Articles", action = "GetPostsByCategory", tagSlug = "Articles" });
            routes.MapRoute("Article", "Articles/{categorySlug}/{urlSlug}", new { controller = "Articles", action = "GetPost", tagSlug = "Articles" });

            routes.MapRoute("ProductCategory", "Products", new { controller = "CategoryProduct", action = "ProductCategoryPage", parentCategory = "Products" });
            routes.MapRoute("ProductListing", "Products/{category}", new { controller = "CategoryProduct", action = "ProductListingPage", parentCategory = "Products" });
            routes.MapRoute("ProductDetail", "Products/{category}/{productSlug}", new { controller = "CategoryProduct", action = "ProductDetailPage", parentCategory = "Products" });

            base.ConfigureAdditionalRoutes(routes);
        }
    }
}