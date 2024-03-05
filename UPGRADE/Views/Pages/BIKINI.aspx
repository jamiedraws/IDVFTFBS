<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/697434521?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/flawless-bikini-commercial.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Intuitively shaped to remove hair in sensitive, hard to reach areas...with a very delicate touch.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>FLAWLESS Bikini is angled, to better trim along your natural curves</li>
            <li>No nicks, bumps, burns, irritation or ingrown hairs</li>
            <li>Micro-oscillating 18-karat gold-plated head</li>
            <li>Hypoallergenic and gentle on all skin types</li>
            <li>Trimming attachment for a precise, even length</li>
            <li>LED light illuminates, so you don&rsquo;t miss a spot</li>
        </ul>
    </div>
</asp:Content> 