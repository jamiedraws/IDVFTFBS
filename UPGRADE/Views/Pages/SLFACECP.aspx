<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/489581708?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/face-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/289088755?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/face-how-to-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Facial Hair Remover is the revolutionary facial hair removal device that erases hair instantly and painlessly without the irritation that comes with plucking, waxing or depilatories. Facial Hair Remover is designed to look like a lipstick. You can be "flawless" anywhere, anytime.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Single halo head for faster hair removal</li>
            <li>Floating head contours over the curves of your face</li>
            <li>18 karat gold-plated head is hypoallergenic & dermatologist approved; gentle on all skin types & tones</li>
            <li>No redness, irritation or down time - instant & painless!</li>
            <li>Built-in LED so you never miss a hair</li>
        </ul>
    </div>
</asp:Content> 