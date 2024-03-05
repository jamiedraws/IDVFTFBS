using Dtm.Framework.ClientSites;
using Dtm.Framework.ClientSites.Web;
using System.Collections.Generic;

namespace IDVFTFBS.Classes
{
    public static class SiteStatus
    {
        /// <summary>
        /// Determines if the site allows customers to add products to the cart and checkout. Setting this property to false will display the site in a brochure/pseudo-shopping cart style.
        /// </summary>
        public static bool IsStoreOpen = false;

        /// <summary>
        /// Represents a list of product categories that will be excluded from displaying on the site.
        /// </summary>
        public static List<string> ExclusionCategoryCodes = new List<string> { "BUNDLE", "ACCESSORIES" };

        /// <summary>
        /// Represents a list of product codes that will be excluded from displaying on the site.
        /// </summary>
        public static List<string> ExclusionProductCodes = new List<string> { "RF30N", "SNREP2N", "BODREPN" };

        /// <summary>
        /// Represents a list of URL route patterns that will redirect to the index page when the store is closed.
        /// </summary>
        public static List<string> ExclusionRoutePatterns = new List<string> { "/online-offers", "/shoppingcart", "/account", "/checkout" };
    }
}