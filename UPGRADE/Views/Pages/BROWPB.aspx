<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/289087471?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/UPGRADE/products/default.svg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": "", "allowfullscreen":"allowfullscreen", "mozallowfullscreen":"mozallowfullscreen", "webkitallowfullscreen":"webkitallowfullscreen"}'>
    </button>
    
    <button type="button" aria-label="Product video 3" class="contain contain--square" data-modal-dialog-id="pdp-video-3" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/293563430?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/UPGRADE/products/default.svg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": "", "allowfullscreen":"allowfullscreen", "mozallowfullscreen":"mozallowfullscreen", "webkitallowfullscreen":"webkitallowfullscreen"}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Painlessly shapes brows with fine-point precision and finesse.  Sleek enough, so you always have a sculpted brow wherever you go.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>FLAWLESS Brows precisely shapes every inch of your brows</li>
            <li>A quick, simple routine for beautiful brows instantly.</li>
            <li>Salon results in the comfort of home</li>
            <li>18K Gold Plated head erases brow hair from the surface of the skin</li>
            <li>NO redness, nicks, or cuts.</li>
            <li>Dermatologist Approved, hypoallergenic</li>
            <li>Built-in LED light so you never miss a hair</li>
        </ul>
    </div>
</asp:Content> 