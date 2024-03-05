<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="IDVFTFBS.PromoCodeHelper" %>

<asp:Content ID="ProductHeroBanner" ContentPlaceHolderID="ProductHeroBanner" runat="server">
<%
    PromoCodeViewer viewSPADAY = new PromoCodeViewer("SPADAY");

    if (viewSPADAY.IsActive) {
%>
<section aria-label="Promotion Banner" class="hero-banner hero-banner--spaday2">
    <picture class="hero-banner__bkg">
        <source srcset="/images/UPGRADE/hero-banners/spaday/bg.webp" type="image/webp"/>
        <img src="/images/UPGRADE/hero-banners/spaday/bg.jpg" role="presentation" alt="">
    </picture>
    <span class="view__in hero-banner__in section__in">
        <span class="hero-banner__group">
            <span class="hero-banner__copy">
                <span class="hero-banner__leader">
                    <span class="hero-banner__leader-line"></span>
                    Everyone Deserves A
                    <span class="hero-banner__leader-line"></span>
                </span>
                <span class="hero-banner__title">
                    Flawless Spa Day
                </span>
                <span class="hero-banner__promo">
                    GET 20% OFF
                </span>
                <span class="hero-banner__info">
                    Cleanse Spa Shower Wand + 3 FREE Replacement Heads
                </span>
                <span class="hero-banner__code">
                    Use Code <b>SPADAY</b> At Checkout
                </span>
                <span class="hero-banner__date" aria-label="Offer is valid from June 15, 2023 to June 25, 2023">
                    Valid: 6/15 - 6/25
                </span>
            </span>
            <picture class="hero-banner__image">
                <source srcset="/images/UPGRADE/hero-banners/spaday/polaroids.webp" type="image/webp" />
                <img src="/images/UPGRADE/hero-banners/spaday/polaroids.png" loading="lazy" alt="Woman using Flawless Cleanse Spa Shower Wand" width="646" height="506">
            </picture>
        </span>
    </span>
</section>
<% } %>
</asp:Content> 

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">

</asp:Content> 

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>The spa experience wherever you use it. Deeply scrubs skin while massaging it.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>3 multi-purpose cleansing heads for a full body, head-to-toe rejuvenating spa-like experience</li>
            <li>Extra long handle makes it easy for hard-to-reach areas</li>
            <li>Convenient stainless steel shower hook, so it's ready when you are</li>
            <li>Water-resistant</li>
        </ul>
    </div>
</asp:Content> 