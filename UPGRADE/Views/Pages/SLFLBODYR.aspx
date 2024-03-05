<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/315242875?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/body-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/314107625?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/body-how-to.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Body Hair Remover is an instant, painless shaving solution.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>DRY SHAVE with no nicks, cuts, bumps or irritation</li>
            <li>18-Karat Gold-Plated, hypoallergenic</li>
            <li>Pivoting head contours around curves</li>
            <li>Bi-directional - Shaves UP or DOWN</li>
            <li>Rechargeable with Built-in LED light</li>
        </ul>
    </div>
</asp:Content> 