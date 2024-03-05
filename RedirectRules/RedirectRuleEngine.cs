using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDVFTFBS.RedirectRules
{
    public static class RedirectRuleEngine
    {

        private static readonly RedirectRuleIndexer _redirectRuleIndexer = new RedirectRuleIndexer();

        public static RedirectResult GetPageNotFoundRedirect(HttpRequest request)
        {

            RedirectResult result;
            if(request == null || request.Url == null || request.Url.AbsolutePath == null)
            {
                return new RedirectResult { HasRedirect = false };  
            }

            var path = request.Url.AbsolutePath.ToLower();
            if (_redirectRuleIndexer.Has(path, true))
            {
                result = new RedirectResult { HasRedirect = true, RedirectUrl = _redirectRuleIndexer[path, true] };
            }
            else if (path.Contains("/bundles"))
            {
                result = new RedirectResult { HasRedirect = true, RedirectUrl = "/products/product-pairings?cver=b6a095f0-0809-ed11-8b97-a0369f1303c7" };
            }
            else
            {
                result = new RedirectResult { HasRedirect = false };
            }

            if (result.HasRedirect && string.Equals(path, result.RedirectUrl, StringComparison.InvariantCultureIgnoreCase))
            {
                result = new RedirectResult { HasRedirect = false };
            }

            return result;
        }

        public static RedirectResult GetMigratedRedirect(HttpRequest request)
        {
            RedirectResult result;
            if (request == null || request.Url == null || request.Url.AbsolutePath == null)
            {
                return new RedirectResult { HasRedirect = false };
            }
            var path = request.Url.AbsolutePath.ToLower();
            if (_redirectRuleIndexer.Has(path, false))
            {
                result = new RedirectResult { HasRedirect = true, RedirectUrl = _redirectRuleIndexer[path, false] };
            }
            else
            {
                result = new RedirectResult { HasRedirect = false };
            }

            if(result.HasRedirect && string.Equals(path, result.RedirectUrl, StringComparison.InvariantCultureIgnoreCase))
            {
                result = new RedirectResult { HasRedirect = false };
            }

            if (!Classes.SiteStatus.IsStoreOpen && Classes.SiteStatus.ExclusionRoutePatterns.Any(erp => path.Contains(erp)))
            {
                result = new RedirectResult { HasRedirect = true, RedirectUrl = "/" };
            }

            return result;
        }



    }
}