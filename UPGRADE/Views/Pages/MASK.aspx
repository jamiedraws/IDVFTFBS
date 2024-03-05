<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <!-- <button type="button" data-modal-dialog-id="test-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/527454999?title=0&byline=0&portrait=0" data-modal-dialog-title="Test Video" data-modal-dialog-template-modifier="video">
        <img src="/images/products/mask-video.jpg" alt="">
    </button> -->

    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/527454999?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/mask-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>This stylish silk mask is comfortable, breathable and gentle on the skin so you look and feel flawless!</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Washable and reusable</li>
            <li>Made with genuine silk</li>
            <li>Fitted nose piece</li>
            <li>100% Pure Mulberry Silk is hypoallergenic, breathable, and cooler than other fabrics</li>
        </ul>
    </div>
</asp:Content> 