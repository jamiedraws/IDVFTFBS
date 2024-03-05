<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <!-- <button type="button" data-modal-dialog-id="test-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/348467474?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/3.0000/glo-commercial.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/342073402?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/3.0000/glo-before-after.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/356457855?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/3.0000/glo-medical.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/349136734?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/3.0000/glo-how.jpg" alt="">
    </button> -->

    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/348467474?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/3.0000/glo-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/342073402?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/3.0000/glo-before-after.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 3" class="contain contain--square" data-modal-dialog-id="pdp-video-3" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/356457855?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/3.0000/glo-medical.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 4" class="contain contain--square" data-modal-dialog-id="pdp-video-4" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/349136734?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/3.0000/glo-how.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Exfoliates skin and removes peach fuzz without causing irritation so your face looks and feels baby soft and smooth.  Features replaceable blades and a LED that draws your attention to even the finest, otherwise easy to miss hairs.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Shape and maintain brows in between salon visits in the comfort of your own home</li>
            <li>18K Gold Plated head erases hair from the surface of the skin</li>
            <li>Dermatologist Approved, hypoallergenic</li>
            <li>LED light illuminates your face, so you don&rsquo;t miss a spot</li>
        </ul>
    </div>
</asp:Content> 