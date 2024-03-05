<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <!-- <button type="button" data-modal-dialog-id="test-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/279323546?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/legs-commercial.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/289089064?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/legs-how-to-video.jpg" alt="">
    </button> -->

    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/279323546?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/legs-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/289089064?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/legs-how-to-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Designed to fit within the grip of your palm, while the generous head follows the contours of your skin.  That way, you'll have soft, smooth legs almost instantly.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>With no soap or water, FLAWLESS Legs works wherever you are</li>
            <li>Built in LED light to luminate the skin's surface so you never miss a hair</li>
            <li>18-karat Gold-Plated floating heads</li>
            <li>No nicks, cuts or irritation</li>
            <li>Safe on all skin types</li>
            <li>Rechargeable</li>
        </ul>
    </div>
</asp:Content> 