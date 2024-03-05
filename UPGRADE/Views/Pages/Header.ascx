<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.ClientSites.Web" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>
<%@ Import Namespace="IDVFTFBS.CategoryRouter" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>
<%@ Import Namespace="IDVFTFBS.PromoCodeHelper" %>

<%
    int cartQuantity = DtmContext.ShoppingCart.Where(sc => sc.CampaignProduct.PropertyIndexer["ExcludeFromCartCount"] != "true" && sc.CampaignProduct.ProductTypeId != 8).Sum(sc => sc.Quantity);

    bool isStartPage = DtmContext.Page.IsStartPageType && DtmContext.PageCode != "PaymentForm";
    var id = DtmContext.VersionId;

    string productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
    string productName = productAttributeName;

    NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
    NavigationItem index = sitemap.GetItemById("index");

    string logo = string.Format(@"<img src=""/images/UPGRADE/logo.svg"" alt=""{0}"" width=""300"" height=""81"">", productAttributeName);

    if (isStartPage)
    {
        logo = string.Format(@"
            <a 
                href=""{0}"" 
                id=""navbar-logo"" 
                class=""nav__logo"" 
                aria-label=""{1}"">
                {2}
            </a>
        ", index.Page, productAttributeName, logo);
    }
    else
    {
        logo = string.Format(@"
            <div class=""nav__logo"">{0}</div>
        ", logo);
    }

    string logoTagline = string.Format(@"
        <div class=""nav__logo-tagline"">
            {0}
        </div>
    ", logo);

    var isStandalone = false;
    if (DtmContext.Page.PageCode == "International-Shop") {
        isStandalone = true;
    }

    PromoCodeViewer currentPromo = new PromoCodeViewer("NAILEDIT");
    PromoCodeViewer freeRepHeadPromo = new PromoCodeViewer("FREEREPHEADPROMO");

    bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;
%>

<header class="view header">
    <span class="skip-link delay-render">
        <a href="#main" class="skip-link__button" id="skip-link"><span>Skip To Main Content?</span></a>
    </span>
    <%
        string navClassList = string.Format(@"section nav {0}", isStartPage ? "nav--is-start-page" : "nav--is-end-page");
        if (isStandalone) {
            navClassList = "nav nav--simple";
        }
    %>

    <% if (isStartPage && !isStandalone && isStoreOpen) { %>
    <div class="promo-banner slide slide--promo-banner promo-banner--scroll-indicator">
        <div class="slide__in section__in">
            <div class="slide__into">
                <% if (currentPromo.IsActive) { %>
                <div class="slide__item promo-banner__promo promo-banner__promo--split">
                    <span><b>20% Off</b> all Nail Devices</span>
                    <span>using code: <b><%= currentPromo.PromoCode %></b> <button type="button" data-modal-dialog-id="promo-disclaimer-container" data-modal-dialog-actor="open" class="promo-banner__link" aria-haspopup="true">details</button></span> 
                </div>
                <% } %>
                <% if (freeRepHeadPromo.IsActive) { %> 
                <div class="slide__item promo-banner__promo promo-banner__promo--split">
                    <span><b>FREE Replacement Heads</b> with our favorite devices.</span>
                    <span>Applied automatically at checkout. <button type="button" data-modal-dialog-id="free-rep-heads-disclaimer-container" data-modal-dialog-actor="open" class="promo-banner__link" aria-haspopup="true">See terms</button></span>
                </div>
                <% } %>
                <div class="slide__item promo-banner__promo promo-banner__promo--split">
                    <span><b>FREE GIFT on All Orders</b></span>
                    <span>FREE SHIPPING ON $29.99+ <button type="button" data-modal-dialog-id="shipping-disclaimer-container" data-modal-dialog-actor="open" class="promo-banner__link" aria-haspopup="true">details</button></span>
                </div>
            </div>
        </div> 
    </div>
    
    <% if (currentPromo.IsActive) { %>
    <template data-modal-dialog-template>
        <section id="promo-disclaimer-container" aria-labelledby="promo-disclaimer-title" data-modal-dialog-title="Promotion disclaimer details" data-modal-dialog-container class="view content content--modal section">
            <div id="promo-disclaimer-mdwsale" class="view__anchor"></div>
            <div class="view__in content__text section__in">
                <h2 id="promo-disclaimer-title" class="content__modal-title">DISCLAIMER</h2>
                <p>Offer valid through 11:59pm EST September 14th, 2023. Receive 20% off Nail Devices, including Nail and Pedi, on Flawlessbeauty.com while supplies last using code NAILEDIT at checkout. Offer not valid where other Flawless Beauty products are sold.</p>
            </div>
        </section>
    </template>
    <% } %>

    <% if (freeRepHeadPromo.IsActive) { %>
    <template data-modal-dialog-template>
        <section id="free-rep-heads-disclaimer-container" aria-labelledby="free-rep-heads-disclaimer-title" data-modal-dialog-title="Free Replacement Heads Terms" data-modal-dialog-container class="view content content--modal section">
            <div id="free-rep-heads-disclaimer" class="view__anchor"></div>
            <div class="view__in content__text section__in">
                <h2 id="free-rep-heads-disclaimer-title" class="content__modal-title">DISCLAIMER</h2>
                <p>Offer valid through 11:59pm EST October 31st, 2023. Receive a free set of replacement heads for the following devices, Face, Nails, Pedi, NuRazor and Cleanse Spa, plus all replacement head orders. Replacement Heads will be automatically applied to your order at checkout, no discount code needed. Offer not valid where other Flawless Beauty products are sold.</p>
            </div>
        </section>
    </template>
    <% } %>

    <template data-modal-dialog-template>
        <section id="shipping-disclaimer-container" aria-labelledby="shipping-disclaimer-title" data-modal-dialog-title="Shipping disclaimer details" data-modal-dialog-container class="view content content--modal section">
            <div id="shipping-disclaimer" class="view__anchor"></div>
            <div class="view__in content__text section__in">
                <h2 id="shipping-disclaimer-title">FREE GIFT WITH ALL ORDERS!</h2>
                <div class="content__group">
                    <p>Receive a <b>FREE COSMETIC BAG GIFT</b> with every order. No promo code needed, offer automatically applied at checkout.</p>
                    <img src="/images/UPGRADE/cosmetic-bag.jpg" alt="Cosmetic Bag" loading="lazy" width="142" height="70">
                </div>
                

                <h2><svg class="icon content__icon content__icon--shipping-truck"><use href="#shipping-truck"></use></svg> FREE SHIPPING!</h2>
                <p><b>FREE STANDARD SHIPPING</b> on all U.S. orders $29.99 or more.<br>*Offer valid on standard shipping to the continental U.S.</p>
            </div>
        </section>
    </template>

    <template data-modal-dialog-template>
        <section id="guarantee-disclaimer-container" aria-labelledby="guarantee-disclaimer-title" data-modal-dialog-title="Money back guarantee disclaimer details" data-modal-dialog-container class="view content content--modal section">
            <div id="guarantee-disclaimer" class="view__anchor"></div>
            <div class="view__in content__text section__in">
                <h2 id="guarantee-disclaimer-title">Money Back Guarantee</h2>
                <div class="content__group">
                    <p>Your Complete satisfaction is guaranteed or your money back! 60-Day Money Back Guarantee (Less S&amp;H). If you&rsquo;re not absolutely delighted with any of our products, for any reason, simply contact our customer service team to return your product within 60 days of receipt for a refund of your purchase price (less S&amp;H).</p>
                    <img src="/images/UPGRADE/mbg.svg" width="100" height="100" alt="60-Day Money Back Guarantee (Less S&amp;H" loading="lazy">
                </div>
            </div>
        </section>
    </template>
    <% } %>

    <% if (DtmContext.Page.PageCode == "International-Shop") { %>
    <div class="promo-banner promo-banner--center">
        <div class="section__in">
            <span>AVAILABLE WORLDWIDE</span>
        </div> 
    </div>
    <% } %>

    <nav id="nav" aria-label="Website page links" class="<%= navClassList %>">
        <div class="section__in nav__in nav__group">
            <%= logoTagline %>

            <% if (isStartPage) { %>
            <button type="button" class="nav__label" aria-label="Toggle Menu">
                <span></span>
            </button>
            <div class="nav__underlay"></div>
            <div class="nav__pane">
                <div class="nav__list">
                    <%= logoTagline.Replace("navbar-logo", "navbar-header-logo") %>

                    <%
                        CategoryProductRouterEngine categoryProductRouterEngine = ViewData["CategoryProductRouterEngine"] as CategoryProductRouterEngine ?? new CategoryProductRouterEngine();

                        Func<CategoryProductRouter, string> renderProductLink = ((CategoryProductRouter categoryProduct) =>
                        {
                            string imageHTML = @"<picture><img src=""/images/UPGRADE/products/default.svg"" alt="""" loading=""lazy"" width=""100"" height=""100""></picture>";
                            string productSlug = categoryProduct.CampaignProduct.PropertyIndexer["UrlSlug"];
                            ProductImages productImage = new ProductImages(productSlug, "images/UPGRADE/nav/products/" + productSlug);
                            string productRoute = categoryProduct.RouteToProductDetailPage;
                            string productNavName = categoryProduct.CampaignProduct.GetProductShortName();

                            if (productImage.Images.Any())
                            {
                                imageHTML = productImage.BuildHTMLPictureElement(productImage.GetFirstFallbackImage(), true);
                            }

                            return string.Format(@"<a href=""{0}?cver={1}"">{2}<span>{3}</span></a>", 
                                productRoute, 
                                DtmContext.VersionId, 
                                imageHTML, 
                                productNavName
                            );
                        });

                        Func<string, string> renderCategoryProductList = ((string categoryCode) =>
                        {
                            string HTML = string.Empty;

                            var captureCampaignCategory = categoryProductRouterEngine.ProductCategories.Where(pc => pc.Code.Equals(categoryCode));

                            if (captureCampaignCategory.Any())
                            {
                                var campaignCategory = captureCampaignCategory.FirstOrDefault();
                                var categoryProducts = categoryProductRouterEngine
                                    .GetProductsByCategorySlug(campaignCategory.RedirectUrl)
                                    .Where(cp => categoryProductRouterEngine.IsValidCategoryProductRouter(cp))
                                    .Where(cp => cp.CampaignProduct.IsProductLive())
                                    .ToList();
                        
                                if (categoryProducts.Any())
                                {
                                    string productLinkHTML = string.Empty;

                                    categoryProducts.ForEach(categoryProduct =>
                                    {
                                        productLinkHTML += renderProductLink(categoryProduct);
                                    });

                                    var parentCampaignCategory = categoryProductRouterEngine.GetParentCategoryByChildCategory(campaignCategory);
                                    string productListingRoute = categoryProductRouterEngine.CreateRouteToProductListingPage(categoryProductRouterEngine.CreateRouteToProductCategoryPage(parentCampaignCategory.RedirectUrl), campaignCategory);

                                    string ctaText = isStoreOpen ? "Shop" : "View";
                                                                            
                                    HTML = string.Format(@"
                                    <div class=""flyout flyout--full-width-container delay-input flyout--products-view delay-input--for-flyout"" data-flyout-allow-hover>
                                        <button type=""button"" class=""flyout__button nav__link"" aria-controls=""{0}-container"">
                                            <span>{1}</span>
                                        </button>
                                        <div id=""{0}-container"" class=""flyout__container"">
                                            <div class=""flyout__content"">
                                                <div class=""product-card"">
                                                    <div class=""product-card__group"">
                                                        {2}
                                                    </div>
                                                    <div class=""product-card__button-group"">
                                                        <a class=""product-card__footer"" href=""{3}?cver={4}"">{5} All {1}</a>
                                                        <a class=""product-card__footer"" href=""/products?cver={4}"">{5} All Products</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    ", categoryCode.ToLower(), campaignCategory.Name, productLinkHTML, productListingRoute, DtmContext.VersionId, ctaText);
                                }
                                
                            }

                            return HTML;
                        });

                        Response.Write(renderCategoryProductList("HAIRREMOVAL"));
                        Response.Write(renderCategoryProductList("NAILDEVICES"));
                        Response.Write(renderCategoryProductList("SKINDEVICES"));

                        if (isStoreOpen)
                        {
                            Response.Write(renderCategoryProductList("BUNDLE"));
                        }
                        
                        NavigationItem replacementHeads = sitemap.GetItemById("replacement-heads");
                        
                        if (sitemap.HasItem(replacementHeads))
                        {
                            List<string> exclusionProductCodes = IDVFTFBS.Classes.SiteStatus.ExclusionProductCodes;

                            List<CampaignProductView> replacementProducts = DtmContext.CampaignProducts.Where(cp => cp.CategoryIndexer.Has("REPLACEMENTHEADS") && cp.IsProductLive() && !exclusionProductCodes.Contains(cp.ProductCode)).OrderBy(cp => cp.CategoryIndexer["REPLACEMENTHEADS"]).ToList();

                            if (replacementProducts.Any())
                            { 
                                %>
                                <div class="flyout flyout--full-width-container flyout--products-view delay-input delay-input--for-flyout" data-flyout-allow-hover>
                                    <button type="button" class="flyout__button nav__link" aria-controls="<%= replacementHeads.Id %>-container">
                                        <span><%= replacementHeads.Name %></span>
                                    </button>
                                    <div id="<%= replacementHeads.Id %>-container" class="flyout__container">
                                        <div class="flyout__content">
                                            <div class="product-card">
                                                <div class="product-card__group">
                                                    <%
                                                        replacementProducts.ForEach(replacementProduct =>
                                                        {
                                                            string landmarkId = string.Format("#product-{0}", replacementProduct.ProductCode);

                                                            string url = replacementHeads.Page.Contains(replacementHeads.Hash) 
                                                                ? replacementHeads.Page.Replace(replacementHeads.Hash, landmarkId) 
                                                                : replacementHeads.Page + landmarkId;

                                                            string imageHTML = @"<picture><img src=""/images/UPGRADE/products/default.svg"" alt="""" loading=""lazy"" width=""100"" height=""100""></picture>";
                                                            ProductImages productImage = new ProductImages(replacementProduct.ProductCode, "images/UPGRADE/nav/products/" + replacementProduct.ProductCode);

                                                            string backInStockText = replacementProduct.PropertyIndexer["NavigationBackInStockMessage", replacementProduct.PropertyIndexer["BackInStockMessage", string.Empty]];

                                                            if (productImage.Images.Any())
                                                            {
                                                                imageHTML = productImage.BuildHTMLPictureElement(productImage.GetFirstFallbackImage(), true);
                                                            }
                                                            %>
                                                            <a href="<%= url %>">
                                                                <%= imageHTML %>
                                                                <span>
                                                                    <%= replacementProduct.GetProductShortName() %>
                                                                    <% if (!string.IsNullOrWhiteSpace(backInStockText)) { %>
                                                                    <span class="product-card__message"><%= backInStockText %></span>
                                                                    <% } %>
                                                                </span>
                                                            </a>
                                                            <%
                                                        });
                                                    %>
                                                </div>
                                                <%
                                                    string ctaText = isStoreOpen ? "Shop" : "View";    
                                                %>
                                                <div class="product-card__button-group">
                                                    <a class="product-card__footer" href="<%= replacementHeads.Page %>"><%= ctaText %> All <%= replacementHeads.Name %></a>
                                                    <a class="product-card__footer" href="/Products?cver=<%= DtmContext.VersionId %>"><%= ctaText %> All Products</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                    
                                <%
                            }
                        }

                        NavigationItem expertTutorials = sitemap.GetItemById("how-to-videos");

                        if (sitemap.HasItem(expertTutorials))
                        {
                            %>
                            <a href="<%= expertTutorials.Page %>" class="nav__link">
                                <span><%= expertTutorials.Name %></span>
                            </a>
                            <%
                        }

                        NavigationItem onlineOffers = sitemap.GetItemById("offers");

                        if (sitemap.HasItem(onlineOffers))
                        {
                            %>
                            <a href="<%= onlineOffers.Page %>" class="nav__link">
                                <span><%= onlineOffers.Name %></span>
                            </a>
                            <%
                        }
                    %>
                </div>
            </div>
            <div class="nav__actions">
                <div class="text-button-icon">
                    <div class="text-button-icon__group">
                        <div id="search-form" class="flyout flyout--full-width-container delay-input delay-input--for-flyout">
                            <button type="button" class="flyout__button text-button-icon__button" aria-label="Toggle Search Form" aria-controls="search-form-container">
                                <svg class="icon text-button-icon__icon">
                                    <use href="#icon-search"></use>
                                </svg>
                            </button>
                            <div id="search-form-container" class="flyout__container">
                                <div class="flyout__content">
                                    <form action="/Search?cver=<%= DtmContext.VersionId %>" data-processing-message="Searching" method="post" class="view search-form section">
                                        <input id="text" name="text" type="hidden" value="">
                                        <input id="versionNumber" name="versionNumber" type="hidden" value="<%= DtmContext.Version.ToString("N4") %>">
                                        <div class="view__in search-form__in section__in">
                                            <div class="search-form__group message message--search">
                                                <div class="search-form__field message__select">
                                                    <div class="form form--field-button form--search">
                                                        <div class="form__contain form__field-button">
                                                            <input type="text" id="textS" name="textS" required data-required aria-label="Product Search" placeholder="Search..." title="Search for a product by name or by type" pattern="^[a-zA-Z0-9()-_ ]*$" class="form__field">
                                                            <button type="submit" class="button form__button">
                                                                <span>Search</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="message__group" role="alert">
                                                    <span class="message__invalid">
                                                        Please enter a valid search term
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            NavigationItem stores = sitemap.GetItemById("find-in-store");
                            
                            if (sitemap.HasItem(stores))
                            {
                                %>
                                <a href="<%= stores.Page %>" aria-label="<%= stores.Name %>" class="text-button-icon__button">
                                    <svg class="icon text-button-icon__icon">
                                        <use href="#icon-location"></use>
                                    </svg>
                                </a>
                                <%
                            }

                            NavigationItem account = sitemap.GetItemById("account");    

                            if (sitemap.HasItem(account))
                            {
                                bool isLoggedIn = DtmContext.StoreCustomerId != Guid.Empty;
                                %>
                                <div id="customer-account" class="flyout flyout--for-customer-account delay-input delay-input--for-flyout" data-flyout-allow-hover>
                                    <button type="button" class="flyout__button text-button-icon__button" aria-label="Toggle Customer Account Settings" aria-controls="customer-account-container">
                                        <svg class="icon text-button-icon__icon">
                                            <use href="#icon-person"></use>
                                        </svg>
                                        <svg x="0px" y="0px" viewBox="0 0 87 76" class="flyout__pointer">
                                            <polygon points="43.5,0.5 0.2,75.5 86.8,75.5"/>
                                        </svg>
                                    </button>
                                    <div id="customer-account-container" class="flyout__container">
                                        <div class="flyout__content customer-account-menubar">
                                            <div class="customer-account-menubar__group">
                                                <a href="<%= account.Page %>">
                                                    <%
                                                        string accountLinkText = isLoggedIn ? "My Account" : "Log in";    
                                                    %>
                                                    <span><%= accountLinkText %></span>
                                                </a>
                                                <% if (isLoggedIn) { %>
                                                <a href="/Profile/Logout">
                                                    <span>Log out</span>
                                                </a>
                                            <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                            }

                            NavigationItem cart = sitemap.GetItemById("cart");    

                            if (sitemap.HasItem(cart))
                            {
                                %>
                                <a href="<%= cart.Page %>" aria-label="<%= cart.Name %>" class="text-button-icon__button">
                                    <span class="text-button-icon__group">
                                        <span class="text-button-icon__image">
                                            <svg class="icon text-button-icon__icon">
                                                <use href="#icon-cart"></use>
                                            </svg>
                                        </span>
                                        <span role="status" class="text-button-icon__status cartTotalQtyNumbersOnly"><% 
                                            if (cartQuantity > 0)
                                            { 
                                                Response.Write(cartQuantity);
                                            } 
                                            %></span>
                                    </span>
                                </a>
                                <%
                            }
                            %>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </nav>
</header>