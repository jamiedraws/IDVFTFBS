<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/489581708?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/brows-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>

    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/289088755?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/brows-animation-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Brows gently erases hair from the surface of the skin with pinpoint precision. Now you can shape and maintain beautiful brows without destroying the root, or promoting premature aging like waxing, plucking and threading. Brows is fast, painless, and so precise, you can remove as little as one hair, or many.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Pinpoint precision head can erase a single hair or many</li>
            <li>Shape and maintain brows in between salon visits in the comfort of your own home</li>
            <li>18K Gold Plated head erases brow hair from the surface of the skin</li>
            <li>NO redness, irritation, or downtime</li>
            <li>Dermatologist Approved, hypoallergenic</li>
            <li>Built-in LED light so you never miss a hair</li>
        </ul>
    </div>
</asp:Content> 