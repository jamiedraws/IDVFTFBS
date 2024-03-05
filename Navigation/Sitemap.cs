using Dtm.Framework.ClientSites.Web;

namespace IDVFTFBS.Navigation
{
    public class Sitemap
    {
        public NavigationList SitemapList;
        public Sitemap()
        {
            SitemapList = new NavigationList();

            // Home
            SitemapList.AddItem(new NavigationItem
            {
                Id = "index",
                Name = "Home",
                Page = "Index",
                Hash = "#main"
            });

            // News
            SitemapList.AddItem(new NavigationItem
            {
                Id = "news",
                Name = "Press",
                Page = "News",
                Hash = "#main"
            });

            // Articles
            SitemapList.AddItem(new NavigationItem
            {
                Id = "articles",
                Name = "Press",
                Page = "News",
                Route = string.Format("Articles?cver={0}", DtmContext.VersionId),
                Hash = "#main"
            });

            // Our Purpose
            SitemapList.AddItem(new NavigationItem
            {
                Id = "about",
                Name = "Our Purpose",
                Page = "About",
                Hash = "#main"
            });

            // Product Registration
            SitemapList.AddItem(new NavigationItem
            {
                Id = "product-registration",
                Name = "Product Registration",
                Page = "ProductRegistration",
                Hash = "#main"
            });

            // Customer Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "customer-service",
                Name = "Contact Us",
                Page = "Customer-Service",
                Hash = "#main"
            });

            // Contact Us
            SitemapList.AddItem(new NavigationItem
            {
                Id = "contact-us",
                Name = "Contact Us",
                Page = "Contact",
                Hash = "#main"
            });

            // Return Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "return-policy",
                Name = "Return Policy",
                Page = "ReturnPolicy",
                Hash = "#main"
            });

            // Shipping + Returns
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-returns",
                Name = "Returns",
                Page = "Shipping-Returns",
                Hash = "#main"
            });

            // Guarantee
            SitemapList.AddItem(new NavigationItem
            {
                Id = "guarantee",
                Name = "Guarantee",
                Page = "Shipping-Returns",
                Hash = "#main"
            });

            // Terms of Service
            SitemapList.AddItem(new NavigationItem
            {
                Id = "terms",
                Name = "Terms Of Service",
                Page = "https://churchdwight.com/terms-conditions.aspx",
                IsExternal = true
            });

            // Privacy Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "privacy-policy",
                Name = "Privacy Notice",
                Page = "https://churchdwight.com/privacy-policy.aspx",
                IsExternal = true
            });

            // Shipping Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "shipping-policy",
                Name = "Shipping Policy",
                Page = "ShippingPolicy",
                Hash = "#main"
            });

            // Security Policy
            SitemapList.AddItem(new NavigationItem
            {
                Id = "security-policy",
                Name = "Security Policy",
                Page = "SecurityPolicy",
                Hash = "#main"
            });

            // Site Map
            SitemapList.AddItem(new NavigationItem
            {
                Id = "sitemap",
                Name = "Site Map",
                Page = "SiteMap",
                Hash = "#main"
            });

            if (Classes.SiteStatus.IsStoreOpen)
            {
                // Account
                SitemapList.AddItem(new NavigationItem
                {
                    Id = "account",
                    Name = "Account",
                    Route = string.Format("{0}/{1}/Account/Index", DtmContext.OfferCode, DtmContext.Version)
                });

                // Cart
                SitemapList.AddItem(new NavigationItem
                {
                    Id = "cart",
                    Name = "Cart",
                    Page = "Checkout",
                    Hash = "#main",
                });

                // Online Offers
                SitemapList.AddItem(new NavigationItem
                {
                    Id = "offers",
                    Name = "Online Offers",
                    Page = "Online-Offers",
                    Hash = "#main"
                });
            }

            // Expert Tutorials
            SitemapList.AddItem(new NavigationItem
            {
                Id = "expert-tutorials",
                Name = "Expert Tutorials",
                Hash = "#main"
            });

            // Videos
            SitemapList.AddItem(new NavigationItem
            {
                Id = "videos",
                Name = "Videos",
                Page = "Videos",
                Hash = "#main"
            });

            // How To Videos
            SitemapList.AddItem(new NavigationItem
            {
                Id = "how-to-videos",
                Name = "Expert Tutorials",
                Page = "HowTo",
                Hash = "#main"
            });

            // FAQ
            SitemapList.AddItem(new NavigationItem
            {
                Id = "faq",
                Name = "FAQ",
                Page = "FAQ",
                Hash = "#main"
            });

            // Affiliate Program
            SitemapList.AddItem(new NavigationItem
            {
                Id = "affiliate-program",
                Name = "Affiliate Program",
                Route = "mailto:affmanager@digitaltargetmarketing.com?subject=Affiliate Program Inquiry&body=I'd like to learn more about your affiliate program!"
            });

            // Products
            SitemapList.AddItem(new NavigationItem
            {
                Id = "products",
                Name = "Products",
                Route = "Products",
                Hash = "#main"
            });

            // Replacement Heads
            SitemapList.AddItem(new NavigationItem
            {
                Id = "replacement-heads",
                Name = "Replacement Heads",
                Page = "Replacement",
                Hash = "#main"
            });

            // Track Your Order
            SitemapList.AddItem(new NavigationItem
            {
                Id = "track-your-order",
                Name = "Track Your Order",
                Page = "https://customerstatus.com/SearchUpdate.aspx",
                IsExternal = true
            });

            // International Shopping
            SitemapList.AddItem(new NavigationItem
            {
                Id = "international-shopping",
                Name = "International Shopping",
                Page = "International-Shop",
                Hash = "#main"
            });

            // Find In Store
            SitemapList.AddItem(new NavigationItem
            {
                Id = "find-in-store",
                Name = "Find in Store",
                Page = "Find-In-Store",
                Hash = "#main"
            });

            // Facebook
            SitemapList.AddItem(new NavigationItem
            {
                Id = "facebook",
                Name = "Facebook",
                Route = "https://www.facebook.com/FlawlessBeauty/",
                IsExternal = true
            });

            // Instagram
            SitemapList.AddItem(new NavigationItem
            {
                Id = "instagram",
                Name = "Instagram",
                Route = "https://www.instagram.com/flawlessbeauty/",
                IsExternal = true
            });

            // YouTube
            SitemapList.AddItem(new NavigationItem
            {
                Id = "youtube",
                Name = "YouTube",
                Route = "https://www.youtube.com/c/FlawlessBeauty",
                IsExternal = true
            });

            // TikTok
            SitemapList.AddItem(new NavigationItem
            {
                Id = "tiktok",
                Name = "TikTok",
                Route = "https://www.tiktok.com/@flawlessbeauty",
                IsExternal = true
            });
        }
    }
}