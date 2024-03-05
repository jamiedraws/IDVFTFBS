<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>
<%@ Import Namespace="IDVFTFBS.CategoryRouter" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>
<%@ Import Namespace="System.Web.Script.Serialization" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<%@ Import Namespace="IDVFTFBS.Utils" %>
<%@ Import Namespace="IDVFTFBS.PromoCodeHelper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%
    ResourceWriter resourceWriter = ViewData["ResourceWriter"] as ResourceWriter ?? new ResourceWriter();   
        
    Response.Write(resourceWriter.WriteStylePreload("css/UPGRADE/Site1/index.css"));
    Response.Write(resourceWriter.WriteLink("css/UPGRADE/Site1/index.css"));
%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;

    var categoryProductRouterEngine = ViewData["CategoryProductRouterEngine"] as CategoryProductRouterEngine ?? new CategoryProductRouterEngine();

    string hairRemovalUrl = string.Format("{0}?cver={1}", categoryProductRouterEngine.GetRouteToProductListingPageByCategoryCode("HAIRREMOVAL"), DtmContext.VersionId);
    string nailDeviceUrl = string.Format("{0}?cver={1}", categoryProductRouterEngine.GetRouteToProductListingPageByCategoryCode("NAILDEVICES"), DtmContext.VersionId);
    string bundlesUrl = string.Format("{0}?cver={1}", categoryProductRouterEngine.GetRouteToProductListingPageByCategoryCode("BUNDLES"), DtmContext.VersionId);

    NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
    NavigationItem replacementHeads = sitemap.GetItemById("replacement-heads");

    PromoCodeViewer currentPromo = new PromoCodeViewer("NAILEDIT");
    PromoCodeViewer freeRepHeadPromo = new PromoCodeViewer("FREEREPHEADPROMO");

    SortedList<string, bool> featureBannerView = new SortedList<string, bool>
    {
        { "feature-banner-0", currentPromo.IsActive },
        { "feature-banner-01", freeRepHeadPromo.IsActive },
        { "feature-banner-02", freeRepHeadPromo.IsActive },
        { "feature-banner-1", true },
        { "feature-banner-2", true },
        { "feature-banner-3", true },
        { "feature-banner-4", true }
    };

    if (!isStoreOpen)
    {
        featureBannerView = new SortedList<string, bool>
        {
            { "feature-banner-1", true }
        };
    }

    Func<string, bool> canDisplayFeatureBanner = ((string key) =>
    {
        bool result = false;

        featureBannerView.TryGetValue(key, out result);

        return result;
    });

    string ctaText = isStoreOpen ? "Shop" : "View";
%>

<main aria-labelledby="main-title" class="view content content--hero section">
    <div id="hero" class="view__anchor"></div>
    <div class="content__header">
        <div class="section__block">
            <h1 id="main-title" class="content__title content__title--first">Smart Innovation for Healthy Skin</h1>
        </div>
    </div>
    <div class="slide slide--hero-banner slide--vimeo-carousel" data-carousel-config='{ "delay" : 7000 }'>
        <div class="slide__into" tabindex="0" id="home-page-carousel">

            <% if (canDisplayFeatureBanner("feature-banner-0")) { %>
            <%                
                string currentPromoUrl = string.Format("{0}?cver={1}", categoryProductRouterEngine.GetRouteToProductListingPageByCategoryCode("NAILDEVICES"), DtmContext.VersionId);
            %>
            <div id="feature-banner-0" class="slide__item">
                <a href="<%= currentPromoUrl %>" class="hero-banner hero-banner--nailedit">
                    <picture class="hero-banner__bkg">
                        <img src="/images/UPGRADE/hero-banners/nailedit/bg.svg" role="presentation" alt="">
                    </picture>
                    <span class="view__in hero-banner__in section__in">
                        <span class="hero-banner__group">
                            <span class="hero-banner__copy">
                                <span class="hero-banner__title">
                                    Get 20% Off
                                </span>
                                <span class="hero-banner__promo">
                                    All Nail Devices
                                </span>
                                <span class="hero-banner__line"></span>
                                <span class="hero-banner__info">
                                    Are you ready to take your nail game to the next level?
                                </span>
                                <span class="hero-banner__code">
                                    Use Code <b><%= currentPromo.PromoCode %></b> At Checkout
                                </span>
                                <span class="hero-banner__date">
                                    Valid: 8/23 - 9/14
                                </span>
                            </span>
                            <div class="hero-banner__image">
                                <picture class="hero-banner__product-beauty-shot">
                                    <source srcset="/images/UPGRADE/hero-banners/nailedit/product-beauty-shot.webp" type="image/webp" />
                                    <img src="/images/UPGRADE/hero-banners/nailedit/product-beauty-shot.png" alt="" width="508" height="456">
                                </picture>
                                <picture class="hero-banner__seal">
                                    <source srcset="/images/UPGRADE/hero-banners/nailedit/derm-seal.webp" type="image/webp">
                                    <img src="/images/UPGRADE/hero-banners/nailedit/derm-seal.png" alt="Dermatologist Approved" width="141" height="118">
                                </picture>
                            </div>
                        </span>
                    </span>
                </a>
            </div>
            <% } %>

           <% if (canDisplayFeatureBanner("feature-banner-01")) { %>
            <div id="feature-banner-01" class="slide__item"> 
                <div class="hero-banner hero-banner--freerephead-bogo-promo">
                    <picture class="hero-banner__bkg">
                        <img src="/images/UPGRADE/hero-banners/freereplacements/bkg-free-replacement-head.svg" role="presentation" alt="">
                    </picture>
                    <div class="view__in hero-banner__in section__in">
                        <div class="hero-banner__group">
                            <picture class="hero-banner__image">
                                <source srcset="/images/UPGRADE/hero-banners/freereplacements/emma-replacement-head.webp" type="image/webp">
                                <img src="/images/UPGRADE/hero-banners/freereplacements/emma-replacement-head.png" alt="Emma Roberts and the Flawless Facial Hair replacement head" width="467" height="477" loading="lazy">
                            </picture>
                            <div class="hero-banner__copy">
                                <div class="hero-banner__header">
                                    <span>Buy One</span>
                                    <span>Get One</span>
                                    <b>FREE</b>
                                    <sup>*</sup>
                                </div>
                                <div class="hero-banner__info">Buy any replacement head for your favorite Flawless&trade; device and get the 2nd one FREE!</div>
                                <%
                                    if (sitemap.HasItem(replacementHeads))
                                    {
                                        %>
                                        <div class="hero-banner__button">
                                            <a href="<%= replacementHeads.Page %>" class="button">
                                                <span><%= ctaText %> Replacement Heads</span>
                                            </a>
                                        </div>
                                        <%
                                    }
                                %>

                                <div class="hero-banner__disclaimers">
                                    <p>Applied automatically at checkout. Valid: 9/5-10/31</p>
                                    <p>*Free replacement head must match the initial one purchased.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

           <% if (canDisplayFeatureBanner("feature-banner-02")) { %>
            <div id="feature-banner-02" class="slide__item">
                <div class="hero-banner hero-banner--freerephead-promo">
                    <picture class="hero-banner__bkg">
                        <img src="/images/UPGRADE/hero-banners/freereplacements/bg.svg" role="presentation" alt="">
                    </picture>
                    <span class="view__in hero-banner__in section__in">
                        <span class="hero-banner__group">
                            <picture class="hero-banner__badge">
                                <source srcset="/images/UPGRADE/hero-banners/freereplacements/badge.webp" type="image/webp">
                                <img src="/images/UPGRADE/hero-banners/freereplacements/badge.png" alt="FREE Replacement Heads. With Our Favorite Devices." width="406" height="406" loading="lazy">
                            </picture>
                            <div class="hero-banner__image">
                                <picture class="hero-banner__product-beauty-shot">
                                    <source srcset="/images/UPGRADE/hero-banners/freereplacements/product-beauty-shots.webp" type="image/webp" />
                                    <img src="/images/UPGRADE/hero-banners/freereplacements/product-beauty-shots.png" alt="" width="740" height="378" loading="lazy">
                                </picture>
                                <p>Applied automatically at checkout. Valid: 9/5-10/31</p>
                            </div>
                        </span>
                    </span>
                </div>
            </div>
            <% } %>

            <% if (canDisplayFeatureBanner("feature-banner-1")) { %>
            <div id="feature-banner-1" class="slide__item">
                <div class="hero-banner hero-banner--callout-product">
                    <div class="view__in hero-banner__in section__in">
                        <div class="hero-banner__group">
                            <div class="hero-banner__callout">
                                <h2 class="hero-banner__title">
                                    <span>Always be</span>
                                    <div class="hero-banner__logo">
                                        <svg class="icon icon--logo">
                                            <use href="#logo"></use>
                                        </svg>
                                    </div>
                                </h2>
                                <a href="<%= hairRemovalUrl %>" class="button">
                                    <span><%= ctaText %> the Collection</span>
                                </a>
                            </div>
                            <picture class="hero-banner__product">
                                <source srcset="/images/UPGRADE/hero-banners/products-arrangement.webp" type="image/webp">
                                <img src="/images/UPGRADE/hero-banners/products-arrangement.png" alt="Arrangment of Flawless products" width="798" height="450">
                            </picture>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <% if (canDisplayFeatureBanner("feature-banner-2")) { %>
            <div id="feature-banner-2" class="slide__item">
                <div class="hero-banner hero-banner--callout-product hero-banner--callout-box hero-banner--heads">
                    <div class="view__in hero-banner__in section__in">
                        <div class="hero-banner__group">
                            <div class="hero-banner__callout">
                                <h2 class="hero-banner__title">
                                    <span>BACK IN</span>
                                    <strong>STOCK!</strong>
                                </h2>
                                <p>Facial Hair Remover <br>Replacement Heads</p>
                                <a href="Replacement<%= Model.Extension %>" class="button hero-banner__button">
                                    <span><%= ctaText %> Now</span>
                                </a>
                            </div>
                            <picture class="hero-banner__product">
                                <source srcset="/images/UPGRADE/hero-banners/replacement-heads.webp" type="image/webp">
                                <img src="/images/UPGRADE/hero-banners/replacement-heads.png" alt="Arrangment of Flawless products" width="452" height="442">
                            </picture>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <% if (canDisplayFeatureBanner("feature-banner-3")) { %>
            <div id="feature-banner-3" class="slide__item">
                <div class="hero-banner hero-banner--media-text-carousel">
                    <div class="view__in hero-banner__in section__in">
                        <picture class="hero-banner__picture">
                            <source media="(min-width: 500px)" srcset="/images/UPGRADE/hero-banners/face.webp" type="image/webp">
                            <source media="(max-width: 499px)" srcset="/images/UPGRADE/hero-banners/face--mobile.webp" type="image/webp">
                            <source media="(min-width: 500px)" srcset="/images/UPGRADE/hero-banners/face.jpg" type="image/jpg">
                            <source media="(max-width: 499px)" srcset="/images/UPGRADE/hero-banners/face--mobile.jpg" type="image/jpg">
                            <img src="/images/UPGRADE/hero-banners/face.jpg" loading="lazy" alt="Girl with braids using Flawless Face to remove unwanted hair from chin" width="1200" height="800">
                        </picture>
                        <div class="hero-banner__callout">
                            <h2 class="hero-banner__tagline">Flawless<sup>&trade;</sup></h2>
                            <div class="slide slide--tagline-descriptors slide--fade hero-banner__descriptors" data-carousel-config='{ "delay" : 5000 }'>
                                <div id="tagline-carousel" class="slide__into" tabindex="0">
                                    <div class="slide__item">Products designed to be beautiful</div>
                                    <div class="slide__item">Thoughtful self-care technology</div>
                                    <div class="slide__item">Salon results in the comfort of home</div>
                                </div>
                                <div class="slide__nav">
                                    <button aria-label="Next" class="slide__next" type="button">
                                        <svg class="icon">
                                            <use href="#icon-chevron"></use>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            <a href="<%= hairRemovalUrl %>" class="button button--transparent">
                                <span><%= ctaText %> the collection</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>

            <% if (canDisplayFeatureBanner("feature-banner-4")) { %>
            <div id="feature-banner-4" class="slide__item">
                <div class="hero-banner hero-banner--callout-product-spotlight" data-product-listing-router-url>
                    <div class="view__in hero-banner__in section__in">
                        <div class="hero-banner__group">
                            <div class="hero-banner__callout">
                                <h2 class="hero-banner__title">
                                    <span>Skip the Salon</span> <span>& Still Feel <b class="hero-banner__tagline">FLAWLESS<sup>&trade;</sup></b></span>
                                </h2>
                                <a href="<%= hairRemovalUrl %>" data-product-listing-router class="button button--stormcloud">
                                    <span><%= ctaText %> the collection</span>
                                </a>
                            </div>
                            <div class="hero-banner__product">
                                <div class="slide slide--product-spotlight slide--fade product-spotlight product-spotlight--pedestal">
                                    <div id="carousel-prouduct-spotlight" class="slide__into" tabindex="0">
                                        <div class="slide__item" data-product-listing-url="<%= hairRemovalUrl %>">
                                            <div class="product-spotlight product-spotlight--face">
                                                <div class="product-spotlight__group">
                                                    <picture class="product-spotlight__spotlight">
                                                        <img src="/images/UPGRADE/product-spotlight/face/product.png" alt="Face" loading="lazy" width="188" height="373">
                                                    </picture>
                                                    <div class="product-spotlight__product">
                                                        <figure>
                                                            <picture>
                                                                <img src="/images/UPGRADE/product-spotlight/face/inset.jpg" alt="Woman smoothing her cheek using the Face" loading="lazy" width="240" height="240">
                                                            </picture>
                                                            <figcaption>Face</figcaption>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slide__item" data-product-listing-url="<%= hairRemovalUrl %>">
                                            <div class="product-spotlight product-spotlight--brows">
                                                <div class="product-spotlight__group">
                                                    <picture class="product-spotlight__spotlight">
                                                        <img src="/images/UPGRADE/product-spotlight/brows/product.png" alt="Brows" loading="lazy" width="157" height="403">
                                                    </picture>
                                                    <div class="product-spotlight__product">
                                                        <figure>
                                                            <picture>
                                                                <img src="/images/UPGRADE/product-spotlight/brows/inset.jpg" alt="Woman shaving her eyebrows using the Brows" loading="lazy" width="240" height="240">
                                                            </picture>
                                                            <figcaption>Brows</figcaption>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slide__item" data-product-listing-url="<%= hairRemovalUrl %>">
                                            <div class="product-spotlight product-spotlight--nurazor">
                                                <div class="product-spotlight__group">
                                                    <picture class="product-spotlight__spotlight">
                                                        <img src="/images/UPGRADE/product-spotlight/nurazor/product.png" alt="Nu Razor" loading="lazy" width="169" height="413">
                                                    </picture>
                                                    <div class="product-spotlight__product">
                                                        <figure>
                                                            <picture>
                                                                <img src="/images/UPGRADE/product-spotlight/nurazor/inset.jpg" alt="Woman shaving her legs using the Nu Razor" loading="lazy" width="240" height="240">
                                                            </picture>
                                                            <figcaption>Nurazor</figcaption>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slide__item" data-product-listing-url="<%= nailDeviceUrl %>">
                                            <div class="product-spotlight product-spotlight--salon-nails">
                                                <div class="product-spotlight__group">
                                                    <picture class="product-spotlight__spotlight">
                                                        <img src="/images/UPGRADE/product-spotlight/salon-nails/product.png" alt="Salon Nails" loading="lazy" width="96" height="434">
                                                    </picture>
                                                    <div class="product-spotlight__product">
                                                        <figure>
                                                            <picture>
                                                                <img src="/images/UPGRADE/product-spotlight/salon-nails/inset.jpg" alt="Woman painting her nails using the Salon Nail" loading="lazy" width="240" height="240">
                                                            </picture>
                                                            <figcaption>Nail</figcaption>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slide__item" data-product-listing-url="<%= hairRemovalUrl %>">
                                            <div class="product-spotlight product-spotlight--underarm">
                                                <div class="product-spotlight__group">
                                                    <picture class="product-spotlight__spotlight">
                                                        <img src="/images/UPGRADE/product-spotlight/underarm/product.png" alt="Underarm" loading="lazy" width="167" height="428">
                                                    </picture>
                                                    <div class="product-spotlight__product">
                                                        <figure>
                                                            <picture>
                                                                <img src="/images/UPGRADE/product-spotlight/underarm/inset.jpg" alt="Woman shaving her arm pits using the Underarm" loading="lazy" width="240" height="240">
                                                            </picture>
                                                            <figcaption>Underarm</figcaption>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slide__nav">
                                        <button aria-label="Previous" class="slide__prev" type="button">
                                            <svg class="icon">
                                                <use href="#icon-chevron"></use>
                                            </svg>
                                        </button>
                                        <button aria-label="Next" class="slide__next" type="button">
                                            <svg class="icon">
                                                <use href="#icon-chevron"></use>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <%
            int thumbnailIndexCount = featureBannerView.Where(fbv => canDisplayFeatureBanner(fbv.Key)).Count();

            if (thumbnailIndexCount > 1) {
        %>
        <nav class="slide__thumbnails">
            <%
                for (int thumbnailIndex = 0; thumbnailIndex < thumbnailIndexCount; thumbnailIndex++)
                {
                    int thumbnailNumber = thumbnailIndex + 1;
                    %>
                    <a href="javascript:void(0);" class="slide__thumbnail" data-slide-index="<%= thumbnailIndex %>"><%= thumbnailNumber.ToString("D2") %></a>
                    <%
                }
            %>
        </nav>
        <% } %>
    </div>
</main>

<section aria-labelledby="emmas-picks-title" class="view content content--emmas-picks section">
    <div id="emmas-picks" class="view__anchor"></div>
    <div class="view__in section__in content__in">
        <div class="content__group">
            <div class="content__text">
                <div class="content__header logo-title-hero logo-title-hero--for-emma">
                    <h2 class="logo-title-hero__group" id="emmas-picks-title">
                        <picture class="logo-title-hero__logo">
                            <img src="/images/UPGRADE/logo.svg" loading="lazy" alt="Finishing Touch Flawless&trade;" width="300" height="81">
                        </picture>
                        <span class="logo-title-hero__title">Favorites</span>
                    </h2>
                </div>
                <div class="content__products">
                    <div class="product-grid product-grid--top-selling">
                        <div class="product-grid__group">
                        <%
                            var featuredProductCodes = new List<string> { "PBLUEN", "BROWPBN" };
 
                            var featuredProducts = featuredProductCodes
                            .Select(pc => categoryProductRouterEngine.GetCategoryProductByProductCode(pc))
                            .Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp))
                            .ToList();
    
                            foreach (var featuredProduct in featuredProducts)
                            {
                                var index = featuredProducts.IndexOf(featuredProduct);
                                var productSlug = featuredProduct.CampaignProduct.PropertyIndexer["UrlSlug"];
                                var productImage = new ProductImages(productSlug, "images/UPGRADE/pages/index/" + productSlug);
                        
                                Html.RenderPartial("CategoryProduct", new ViewDataDictionary
                                {
                                    { "CategoryProductRouterEngine", categoryProductRouterEngine },
                                    { "CategoryProduct", featuredProduct },
                                    { "IsIndexPage", "true" },
                                    { "index", index },
                                    { "ProductImages", productImage }
                                });
                            }
                        %>
                        </div>
                    </div>
                </div>
            </div>
            <figure class="content__image">
                <picture>
                    <source srcset="/images/UPGRADE/content/bkg-girl.webp" type="image/webp">
                    <img src="/images/UPGRADE/content/bkg-girl.png" loading="lazy" alt="A Girl holding Flawless Brows" width="512" height="663">
                </picture>
            </figure>
        </div>
    </div>
</section>

<section aria-label="Product description, ingredients, directions" class="view section">
    <div class="view__anchor" id="new"></div>
    <div class="view__in section__in">
        <div class="section__block">
            <%
                // Best Sellers
                List<string> bestSellerProductCodes = new List<string> {};

                bestSellerProductCodes.Add("PBLUEN");
                bestSellerProductCodes.Add("BROWPBN");
                bestSellerProductCodes.Add("PEDIN");
                bestSellerProductCodes.Add("NAILSN");

                var bestSellerCategoryProducts = bestSellerProductCodes
                    .Select(pc => categoryProductRouterEngine.GetCategoryProductByProductCode(pc))
                    .Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp) && cp.CampaignProduct.IsProductLive())
                    .ToList();
                bool hasBestSellerCategoryProudcts = bestSellerCategoryProducts.Any();

                // Perfect Pairings
                var perfectPairingCategory = categoryProductRouterEngine.ProductCategories.Where(pc => pc.Code.Equals("BUNDLE"));
                bool hasPerfectPairingCategory = perfectPairingCategory.Any() && isStoreOpen;

                // New Products   
                var allNewCategoryProducts = DtmContext.CampaignProducts
                    .Where(cp => string.Equals(cp.PropertyIndexer["IsNew"], "true", StringComparison.InvariantCultureIgnoreCase))
                    .Select(cp => categoryProductRouterEngine.GetCategoryProductByProductCode(cp.ProductCode))
                    .Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp))
                    .ToList();

                if (sitemap.HasItem(replacementHeads))
                {
                    allNewCategoryProducts.Where(cp => cp.CampaignCategory.Code.Equals("REPLACEMENTHEADS")).ToList().ForEach(cp =>
                    {
                        cp.RouteToProductDetailPage = string.Format("{0}#product-{1}", replacementHeads.Page, cp.CampaignProduct.ProductCode);
                    });
                }

                var newReplacementHeadProducts = allNewCategoryProducts.Where(cp => cp.CampaignCategory.Code.Equals("REPLACEMENTHEADS")).ToList();
                var newCategoryProducts = allNewCategoryProducts.Except(newReplacementHeadProducts).Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp) && cp.CampaignProduct.IsProductLive()).ToList();

                newCategoryProducts.AddRange(newReplacementHeadProducts);

                if (DtmContext.IsStage)
                {
                    List<string> newProductCodeOrder = new List<string> { "FW4N" };
                    newCategoryProducts = newCategoryProducts.OrderByDescending(cp => newProductCodeOrder.Contains(cp.CampaignProduct.ProductCode)).ToList();
                }
                else
                {
                    newCategoryProducts = newCategoryProducts.OrderByDescending(cp => cp.CampaignCategory.Code.Equals("REPLACEMENTHEADS")).ToList();
                }

                bool hasNewCategoryProducts = newCategoryProducts.Any();
            %>
            <div id="accordion" class="accordion accordion--tabs">
                <div class="accordion__group">
                    <% if (hasNewCategoryProducts) { %>
                    <h2 class="accordion__header">
                        <button type="button" class="accordion__button" aria-expanded="true" aria-controls="new-products-section" id="new-products-title">New</button>
                    </h2>
                    <% } %>

                    <% if (hasBestSellerCategoryProudcts) { %>
                    <h2 class="accordion__header">
                        <button type="button" class="accordion__button" aria-controls="best-sellers-section" id="best-sellers-title">Best Sellers</button>
                    </h2>                    
                    <% } %>

                    <% if (hasPerfectPairingCategory) { %>
                    <h2 class="accordion__header">
                        <button type="button" class="accordion__button" aria-controls="perfect-pairings-section" id="perfect-pairings-title">Product Pairings</button>
                    </h2>                    
                    <% } %>

                    <h2 class="accordion__header">
                        <a href="/products?cver=<%= DtmContext.VersionId %>" class="accordion__link">See All</a>
                    </h2>
                </div>
                <% if (hasBestSellerCategoryProudcts) { %>
                <section aria-labelledby="best-sellers-title" hidden id="best-sellers-section" class="accordion__section">
                    <div class="accordion__content">
                        <div class="product-grid product-grid--listing">
                            <div class="product-grid__group">
                            <%
                                foreach (var categoryProduct in bestSellerCategoryProducts)
                                {
                                    var index = bestSellerCategoryProducts.IndexOf(categoryProduct);

                                    Html.RenderPartial("CategoryProduct", new ViewDataDictionary
                                    {
                                        { "CategoryProductRouterEngine", categoryProductRouterEngine },
                                        { "CategoryProduct", categoryProduct },
                                        { "IsIndexPage", "true" },
                                        { "Index", index }
                                    });    
                                }
                            %>
                            </div>
                        </div>   
                    </div>
                </section>                
                <% } %>

                <% if (hasPerfectPairingCategory) { %>
                <section id="perfect-pairings-section" aria-labelledby="perfect-pairings-title" hidden class="accordion__section">
                    <div class="accordion__content">
                        <div class="product-grid product-grid--listing">
                           <div class="product-grid__group">
                                <%
                                    var perfectPairingCategoryProducts = categoryProductRouterEngine.GetProductsByCategoryView(perfectPairingCategory.FirstOrDefault()).Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp) && cp.CampaignProduct.IsProductLive()).ToList();
                                    
                                    foreach (var categoryProduct in perfectPairingCategoryProducts)
                                    {
                                        var index = perfectPairingCategoryProducts.IndexOf(categoryProduct);

                                        Html.RenderPartial("CategoryProduct", new ViewDataDictionary
                                        {
                                            { "CategoryProductRouterEngine", categoryProductRouterEngine },
                                            { "CategoryProduct", categoryProduct },
                                            { "IsIndexPage", "true" },
                                            { "Index", index }
                                        });
                                    }
                                %>
                           </div>
                        </div>
                    </div>
                </section>
                <% } %>
                
                <% if (hasNewCategoryProducts) { %>
                <section id="new-products-section" aria-labelledby="new-products-title" class="accordion__section">
                    <div class="accordion__content">
                        <div class="product-grid product-grid--listing slide slide--category-products">
                            <div id="new-product-category-carousel" class="slide__into">
                                <%
                                    foreach (var categoryProduct in newCategoryProducts)
                                    {
                                        var index = newCategoryProducts.IndexOf(categoryProduct);
                                        %>
                                        <div class="slide__item">
                                            <%
                                                Html.RenderPartial("CategoryProduct", new ViewDataDictionary
                                                {
                                                    { "CategoryProductRouterEngine", categoryProductRouterEngine },
                                                    { "CategoryProduct", categoryProduct },
                                                    { "IsIndexPage", "true" },
                                                    { "Index", index }
                                                });  
                                            %>
                                        </div>
                                        <%
                                    }
                                %>
                            </div>
                            <div class="slide__nav">
                                <button aria-label="Previous" class="slide__prev" type="button">
                                    <svg class="icon">
                                        <use href="#icon-chevron"></use>
                                    </svg>
                                </button>
                                <button aria-label="Next" class="slide__next" type="button">
                                    <svg class="icon">
                                        <use href="#icon-chevron"></use>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
                <% } %>
            </div>
        </div>
    </div>
</section>

<section aria-label="Finishing Touch Flawless has been featured in these publications" class="view content content--featured section">
    <div id="featured-publications" class="view__anchor"></div>
    <div class="view__in section__in">
        <a href="/Articles?cver=<%= DtmContext.VersionId %>">
            <div class="logo-title-hero section__block">
                <h2 id="featured-title" class="logo-title-hero__group">
                    <img class="logo-title-hero__logo" src="/images/UPGRADE/logo.svg" loading="lazy" alt="Finishing Touch Flawless&trade;" width="300" height="81">
                    <span class="logo-title-hero__title">In the Press</span>
                </h2>
            </div>
            <div class="content__group">
                <picture class="content__bazaar">
                    <img src="/images/UPGRADE/brands/bazaar.svg" alt="BAZAAR" loading="lazy" width="125" height="41">
                </picture>
                <picture class="content__elle">
                    <img src="/images/UPGRADE/brands/elle.svg" alt="ELLE" loading="lazy" width="112" height="41">
                </picture>
                <picture class="marie-claire">
                    <img src="/images/UPGRADE/brands/marie-claire.svg" alt="marie-claire" loading="lazy" width="175" height="41">
                </picture>
                <picture class="content__allure">
                    <img src="/images/UPGRADE/brands/allure.svg" alt="allure" loading="lazy" width="114" height="41">
                </picture>
                <picture class="content__cosmopolitan">
                    <img src="/images/UPGRADE/brands/cosmopolitan.svg" alt="COSMOPOLITAN" loading="lazy" width="176" height="41">
                </picture>
                <picture class="content__byrdie">
                    <img src="/images/UPGRADE/brands/byrdie.svg" alt="BYRDIE" width="216" loading="lazy" height="41">
                </picture>
            </div>
        </a>
    </div>
</section>


<section aria-labelledby="seen-on-tiktok-title" class="view content content--tiktok section">
  <div id="seen-on-tiktok" class="view__anchor"></div>
  <div class="view__in section__in">
    <div class="section__block">
      <h2 id="seen-on-tiktok-title" class="content__title">As seen on <b>TikTok</b></h2>
    </div>
    <div class="section__block">
      <div class="slide slide--tiktok-videos">
        <div class="slide__into" tabindex="0" id="tiktokSlider">
          <div class="slide__item">
            <blockquote class="tiktok-embed" cite="https://www.tiktok.com/@flawlessbeauty/video/7224151323048971562" data-video-id="7224151323048971562" style="max-width: 605px;min-width: 325px;" >
              <section> <a target="_blank" title="@flawlessbeauty" href="https://www.tiktok.com/@flawlessbeauty?refer=embed">@flawlessbeauty</a> Mommas, say goodbye to the lady-stache and hello to ?FLAWLESS? Shop now on @amazon <a title="flawlessskin" target="_blank" href="https://www.tiktok.com/tag/flawlessskin?refer=embed">#flawlessskin</a> <a title="glassskin" target="_blank" href="https://www.tiktok.com/tag/glassskin?refer=embed">#glassskin</a> <a title="finishingtouchflawless" target="_blank" href="https://www.tiktok.com/tag/finishingtouchflawless?refer=embed">#finishingtouchflawless</a> <a title="mothersday" target="_blank" href="https://www.tiktok.com/tag/mothersday?refer=embed">#mothersday</a> <a target="_blank" title="? Sunshine - WIRA" href="https://www.tiktok.com/music/Sunshine-7087902657213384705?refer=embed">? Sunshine - WIRA</a> </section>
            </blockquote>
            <script async src="https://www.tiktok.com/embed.js"></script> 
          </div>
          <div class="slide__item">
            <blockquote class="tiktok-embed" cite="https://www.tiktok.com/@flawlessbeauty/video/7214121227202448686" data-video-id="7214121227202448686" style="max-width: 605px;min-width: 325px;" >
              <section> <a target="_blank" title="@flawlessbeauty" href="https://www.tiktok.com/@flawlessbeauty?refer=embed">@flawlessbeauty</a> Skip the painfull waxing and switch to the Flawless Brows device for pain free hair removal! Shop now at @target ? ?@malibumama__ <a title="flawlesspartner" target="_blank" href="https://www.tiktok.com/tag/flawlesspartner?refer=embed">#FlawlessPartner</a> <a target="_blank" title="? original sound  - flawlessbeauty" href="https://www.tiktok.com/music/original-sound-flawlessbeauty-7214122076444756782?refer=embed">? original sound  - flawlessbeauty</a> </section>
            </blockquote>
            <script async src="https://www.tiktok.com/embed.js"></script> 
          </div>
          <div class="slide__item">
            <% if (DtmContext.IsStage) { %>
                <blockquote class="tiktok-embed" cite="https://www.tiktok.com/@flawlessbeauty/video/7213379248332016938" data-video-id="7213379248332016938" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@flawlessbeauty" href="https://www.tiktok.com/@flawlessbeauty?refer=embed">@flawlessbeauty</a> The new Body Touch Up device is an absolute game changer! 🙌🏼 You wont want to leave the house without it! <a title="bodytouchup" target="_blank" href="https://www.tiktok.com/tag/bodytouchup?refer=embed">#BodyTouchUp</a> at @ultabeauty <a target="_blank" title="♬ original sound  - flawlessbeauty" href="https://www.tiktok.com/music/original-sound-flawlessbeauty-7214868548202646318?refer=embed">♬ original sound  - flawlessbeauty</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>
            <% } else { %>
                <blockquote class="tiktok-embed" cite="https://www.tiktok.com/@flawlessbeauty/video/7240100871529499950" data-video-id="7240100871529499950" style="max-width: 605px;min-width: 325px;" >
                  <section> <a target="_blank" title="@flawlessbeauty" href="https://www.tiktok.com/@flawlessbeauty?refer=embed">@flawlessbeauty</a> @imhollyfrances gets <a title="bikiniready" target="_blank" href="https://www.tiktok.com/tag/bikiniready?refer=embed">#bikiniready</a> with the Flawless Bikini trimmer ? Pick it up today at your local @Ulta Beauty <a title="flawlesspartner" target="_blank" href="https://www.tiktok.com/tag/flawlesspartner?refer=embed">#FlawlessPartner</a> ? <a title="summerhacks" target="_blank" href="https://www.tiktok.com/tag/summerhacks?refer=embed">#summerhacks</a> <a title="hairremoval" target="_blank" href="https://www.tiktok.com/tag/hairremoval?refer=embed">#hairremoval</a> <a title="painfreehairremoval" target="_blank" href="https://www.tiktok.com/tag/painfreehairremoval?refer=embed">#painfreehairremoval</a> <a target="_blank" title="? Caramel Latte - Prod. By Rose" href="https://www.tiktok.com/music/Caramel-Latte-7164911253784102913?refer=embed">? Caramel Latte - Prod. By Rose</a> </section>
                </blockquote>
                <script async src="https://www.tiktok.com/embed.js"></script> 
            <% } %>
          </div>
          <div class="slide__item">
            <blockquote class="tiktok-embed" cite="https://www.tiktok.com/@flawlessbeauty/video/7240109619962580270" data-video-id="7240109619962580270" style="max-width: 605px;min-width: 325px;" >
              <section> <a target="_blank" title="@flawlessbeauty" href="https://www.tiktok.com/@flawlessbeauty?refer=embed">@flawlessbeauty</a> ?@Caro Viee is taking a break from acrylics ? Save ? when you do your nails at home with the Flawless Salon Nails device. Find it today at @Ulta Beauty <a title="flawlesspartner" target="_blank" href="https://www.tiktok.com/tag/flawlesspartner?refer=embed">#flawlesspartner</a> <a title="athomenails" target="_blank" href="https://www.tiktok.com/tag/athomenails?refer=embed">#athomenails</a> <a title="athomemanicure" target="_blank" href="https://www.tiktok.com/tag/athomemanicure?refer=embed">#athomemanicure</a> <a title="nailtok" target="_blank" href="https://www.tiktok.com/tag/nailtok?refer=embed">#nailtok</a> <a target="_blank" title="? original sound - flawlessbeauty" href="https://www.tiktok.com/music/original-sound-7240109662383770414?refer=embed">? original sound - flawlessbeauty</a> </section>
            </blockquote>
            <script async src="https://www.tiktok.com/embed.js"></script> 
          </div>
        </div>
        <div class="slide__nav">
          <button aria-label="Previous" class="slide__prev" type="button">
          <svg class="icon">
            <use href="#icon-chevron"></use>
          </svg>
          </button>
          <button aria-label="Next" class="slide__next" type="button">
          <svg class="icon">
            <use href="#icon-chevron"></use>
          </svg>
          </button>
        </div>
      </div>
    </div>
  </div>
</section>

</asp:Content>
