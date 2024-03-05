<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <!-- <button type="button" data-modal-dialog-id="test-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/405967428?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/video--fridge-vert.jpg" alt="">
    </button>
    <button type="button" data-modal-dialog-id="test-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/453352395?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/video--fridge.jpg" alt="">
    </button> -->

    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/405967428?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/video--fridge-vert.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
    
    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/453352395?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/video--fridge.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Preserves and cools all your beauty products, extending their shelf life, and making them even more refreshing.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Compact beauty fridge features 2 shelves for your makeup, creams and Jade rollers. This unit measures 7.5" wide x 10.25" deep x 11" tall and weighs 5 pounds.</li>
            <li>Versatile beauty fridge is great for your makeup, creams, cosmetics and rollers. Perfect for moisturizers, masks, oils and serums. You can even use it for your medicine, food, beverages and breast milk!</li>
            <li>Inside of the fridge door features a mini basket perfect for face masks, rollers, stones, ice packs or dermaplanes.</li>
            <li>Keep all your organic products cool and maintain their shelf life and consistency with our adorable Beauty Fridge.</li>
        </ul>
    </div>
</asp:Content> 