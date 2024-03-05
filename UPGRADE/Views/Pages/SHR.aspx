<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/743220791?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/UPGRADE/products/default.svg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content> 

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>The finest point that removes even individual hairs one by one.  Made for those who want to maintain the most meticulous look.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>The first ultra-precise trimming micro-blade to eliminate stray hairs without tweezing</li>
            <li>Pain free razor alternative for instant hair removal results</li>
            <li>Small and discreet, great to keep in a purse, bag, or backpack</li>
            <li>Dermatologist approved for safe use on all skin types</li>
        </ul>
    </div>
</asp:Content> 