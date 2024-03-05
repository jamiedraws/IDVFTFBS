using Dtm.Framework.Base.Models;
using Dtm.Framework.ClientSites.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDVFTFBS.Models
{
    public class DisplayProduct
    {
        public bool CanDisplayByProduct(CampaignProductView product)
        {
            var result = true;

            var isLive = string.Equals(product.PropertyIndexer["IsLive", "true"], "true", StringComparison.InvariantCultureIgnoreCase);

            if (!isLive && !DtmContext.IsStage)
            {
                result = false;
            }

            return result;
        }

        public bool CanDisplayByProductCode(string productCode)
        {
            var product = DtmContext.CampaignProducts.Where(cp => cp.ProductCode == productCode);

            return product.Any() ? CanDisplayByProduct(product.First()) : true;
        }
    }
}