using Dtm.Framework.ClientSites.Web;
using IDVFTFBS.PromoCodeHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IDVFTFBS.PageHandlers
{
    public class ProcessPaymentPageHandler : PageHandler
    {
        public override void PostValidate(ModelStateDictionary modelState)
        {
            base.PostValidate(modelState);

            var oneTimeOnlyPromoItems = Order.ContextOrderItems
                   .Where(oi => PromoCodeItems.OneTimeOnlyPromoCodes.Contains(oi.CachedProductInfo.ProductCode))
                   .ToList();

            var oneTimeOnlyPromoQuantity = oneTimeOnlyPromoItems.Sum(oi => oi.Quantity);
            
            if (oneTimeOnlyPromoQuantity > 0)
            {
                var promoCodeManager = new PromoCodeManager();
                foreach (var promoItem in oneTimeOnlyPromoItems)
                {
                    promoCodeManager.IncrementPromoAppliedAmount(promoItem.CachedProductInfo.ProductCode);
                }
            }
        }
    }
}