<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <!-- <button type="button" data-modal-dialog-id="test-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/380096866?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/nurazor-commercial.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/447165219?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/3.0000/nu-commercial-2.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/379052230?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/3.0000/nu-play-2.jpg" alt="">
    </button>
     -->
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/380096866?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/nurazor-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/379052230?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/3.0000/nu-commercial-2.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <!-- <button type="button" aria-label="Product video 3" class="contain contain--square" data-modal-dialog-id="pdp-video-3" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/447165219?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/3.0000/nu-play-2.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button> -->
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Similar to a traditional razor, only it's safer, chicer, and flows with your natural curves for fewer nicks and ingrowns.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Bi-Directional, shaves up and down; pivoting head floats over curves</li>
            <li>18K gold-plated head is hypoallergenic</li>
            <li>Dermatologist approved - No nicks, cuts, bumps or irritation</li>
            <li>No soap, no water, no creams &mdash; it works wherever you are</li>
            <li>An LED light so you never miss a hair</li>
            <li>Use with provided SensaGuard Cover for sensitive areas</li>
            <li>Eco-friendly by conserving water</li>
            <li>Rechargeable</li>
        </ul>
    </div>
</asp:Content> 