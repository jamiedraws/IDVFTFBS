using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDVFTFBS.RedirectRules
{
    public class RedirectRuleIndexer
    {
        private readonly Dictionary<string, string> _notFoundRedirects = new Dictionary<string, string>() {
         {"/idvftfbs/bundles.dtm","/products/product-pairings?cver=b6a095f0-0809-ed11-8b97-a0369f1303c7"}

        };

        private readonly Dictionary<string, string> _migratedRedirects = new Dictionary<string, string>() {
            {"/idvftfbs/bundles.dtm","/products/product-pairings?cver=b6a095f0-0809-ed11-8b97-a0369f1303c7"}

        };

        public string this[string path, bool isNotFound = false]
        {
            get
            {
                string redirectUrl = null;
                if(Has(path, isNotFound))
                {
                    redirectUrl = isNotFound ? _notFoundRedirects[path] : _migratedRedirects[path];
                }

                return redirectUrl;

            }
        }

        public bool Has(string path, bool isNotFound = false)
        {
            if(path == null)
            {
                return false;
            }

            return isNotFound 
                ? _notFoundRedirects.Keys.Any(k => k.ToLower() == path.ToLower()) 
                : _migratedRedirects.Keys.Any(k => k.ToLower() == path.ToLower());
        }

    }
}