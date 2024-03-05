<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
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
    <link href="/css/UPGRADE/Site1/index.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    CategoryProductRouterEngine categoryProductRouterEngine = ViewData["CategoryProductRouterEngine"] as CategoryProductRouterEngine ?? new CategoryProductRouterEngine();
    var productName = SettingsManager.ContextSettings["Label.ProductName"];

    PromoCodeViewer currentPromo = new PromoCodeViewer("NAILEDIT");
    PromoCodeViewer freeRepHeadPromo = new PromoCodeViewer("FREEREPHEADPROMO");

    NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
    NavigationItem replacementHeads = sitemap.GetItemById("replacement-heads");
%>

<main aria-labelledby="main-title" class="view content content--sub-page content--online-offers section">
    <div id="main" class="view__anchor"></div>
    <article class="content__text">
        <div class="content__header">
            <h1 id="main-title" class="content__title">Online Offers</h1>
        </div>
        <div class="view__in section__in">

            <% if (currentPromo.IsActive) { %>
            <div class="content__offer">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/nailedit.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/nailedit.png" alt="Sale!" width="500" height="250" loading="lazy">
                </picture>
                <div class="content__text">
                    <div>
                        <h2 class="content__offer-title"><b>Get 20% Off</b> All Nail Devices</h2>
                        <p>Are you ready to take your nail game to the next level?</p><br>
                        <p>Valid 8/23-9/14</p>
                        <p>Promo code: <%= currentPromo.PromoCode %> <button type="button" data-modal-dialog-id="promo-disclaimer-container" data-modal-dialog-actor="open" aria-haspopup="true"><em>view details</em></button></p>
                    </div>
                    <%
                        string currentPromoUrl = string.Format("{0}?cver={1}", categoryProductRouterEngine.GetRouteToProductListingPageByCategoryCode("NAILDEVICES"), DtmContext.VersionId);    
                    %>
                    <a href="<%= currentPromoUrl %>" class="button">Shop Now</a>
                </div>
            </div>
            <% } %>

            <% if (freeRepHeadPromo.IsActive) { %>
            <div class="content__offer content content--freerephead-bogo-promo">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/replaceheads-bogo.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/replaceheads-bogo.png" alt="Buy One Get One FREE*" width="500" height="250" loading="lazy">
                </picture>
                <div class="content__text">
                    <h2 class="content__offer-title">Buy One Get One <b>FREE*</b></h2>
                    <div class="content__body-text">
                        <p>Buy any replacement head for your favorite Flawless&trade; device and get the 2nd one free!</p><br>
                        <p>Applied automatically at checkout. Valid: 9/5-10/31</p>
                        <p>*Free replacement head must match the initial one purchased.</p>
                    </div>
                    <a href="<%= replacementHeads.Page %>" class="button" id="offer-shop-replacement-heads">Shop Replacement Heads</a>
                </div>
            </div>

            <div class="content__offer content content--freerephead-promo">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/replaceheads.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/replaceheads.png" alt="Free Replacement Heads With Our Favorite Devices" width="500" height="250" loading="lazy">
                </picture>
                <div class="content__text">
                    <div class="content__body-text">
                        <h2 class="content__offer-title"><b>FREE Replacement Heads</b><br>With our Favorite Devices</h2>
                        <p>Automatically applied at checkout, no promo code needed.</p>
                    </div>
                    <p>Valid 9/5-10/31 <button type="button" data-modal-dialog-id="free-rep-heads-disclaimer-container" data-modal-dialog-actor="open" aria-haspopup="true"><em>See terms</em></button></p>
                </div>
            </div>
            <% } %>

            <%
                bool hasSaleItems = DtmContext.CampaignProducts.Any(cp => cp.CategoryIndexer.Has("SALE")); 

                if (hasSaleItems)
            {
            %>
            <div class="content__offer">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/sale.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/sale.jpg" alt="Sale" width="498" height="248">
                </picture>
                <div class="content__text">
                    <h2 class="content__offer-title"><b>SALE!</b></h2>
                    <p>These items MUST GO! Don't miss out on our limited time offers.</p>
                    <a href="/products/sale?cver=<%= DtmContext.VersionId %>" class="button" id="offer-free-shipping-and-bag">Shop Sale Items</a>
                </div>
            </div>
            <%
            }
            %>
            <div class="content__offer content content--free-gift-promo">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/hair.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/hair.jpg" alt="Girls just walking on the beach" width="498" height="248">
                </picture>
                <div class="content__text">
                    <h2 class="content__offer-title"><b>Free Gift</b> On All Orders<br><b>Free Shipping</b> On $29.99+</h2>
                    <p class="content__body-text">Receive a <b>FREE COSMETIC BAG GIFT</b> with every order.<br>No promo code needed, offer automatically applied at checkout.</p>
                    <p><b>FREE STANDARD SHIPPING</b> on all U.S. orders $29.99 or more.<br>*Offer valid on standard shipping to the continental U.S.</p>
                </div>
            </div>
            <div class="content__offer">
                <picture class="content__image">
                    <source srcset="/images/UPGRADE/pages/offers/ten-percent-off.webp" type="image/webp">
                    <img src="/images/UPGRADE/pages/offers/ten-percent-off.jpg" alt="10% Off Your First Order" width="498" height="248">
                </picture>
                <div class="content__text">
                    <h2 class="content__offer-title"><b>10% Off Your First Order</b> When You Sign Up!</h2>
                    <p>Subscribe to unlock 10% off your first order, plus be in the know about exclusive offers, launches and more!</p>
                    <%= Html.Partial("Email-Signup", new ViewDataDictionary {
                        { "submitText", "Sign Up Now" },
                        { "classModifier", "klaviyo" },
                        { "showCopy", false }
                    }) %>
                </div>
            </div>
        </div>
    </article>
</main>

</asp:Content>