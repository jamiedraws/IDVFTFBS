<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/743226386?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/UPGRADE/products/default.svg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content> 

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Perfectly formed to fit beneath your arms to easily, speedily remove stubble without scratching.  For softer, smoother underarms.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Specially designed to be curved to contour a woman&rsquo;s underarm</li>
            <li>Designed for sensitive skin with two types of unique blade technologies merged to gently remove hair without nicks, bumps, cuts or ingrowns.</li>
            <li>Wet/dry for use in and out of the shower or on the go while vacationing or at the gym</li>
            <li>Built in LED light to luminate the skin's surface so you never miss a hair</li>
            <li> Cordless and rechargeable, FLAWLESS Underarm works with a plan or in a pinch</li>
        </ul>
    </div>
</asp:Content> 