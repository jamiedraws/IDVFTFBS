<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
    <button type="button" aria-label="Product video 1" class="contain contain--square" data-modal-dialog-id="pdp-video-1" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/718489220?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/mitt-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
    <button type="button" aria-label="Product video 2" class="contain contain--square" data-modal-dialog-id="pdp-video-2" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/456315086?title=0&byline=0&portrait=0" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/products/flawless-cleanse-how-to-video.jpg" data-attr='{ "width":"100", "height":"100", "loading":"lazy", "alt": ""}'>
    </button>
</asp:Content>


<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>The ultimate cleansing set! Use the pure clean mitt to remove stubborn dirt and erase eye makeup. 1 Mitt saves on 500 makeup wipes! Use wet or dry to cleanse and exfoliate skin. Follow this with the ultra-hygienic cleanser and massager that promotes the appearance of radiant, clean, more youthful skin. Cleanse has 4 modes, gentle cleansing, pulsating, massage, and deep cleanse for the ultimate facial cleaning experience.</p>

    <div class="product__block">
        <h2>Cleanse:</h2>
        <ul>
            <li>Ultra-hygienic silicone head</li>
            <li>Cleans and massages</li>
            <li>Increases circulation to help promote collagen production</li>
            <li>Dermatologist approved</li>
            <li>Fully waterproof &mdash; perfect for the shower</li>
            <li>Rechargeable Battery</li>
        </ul>
    </div>

    <div class="product__block">
        <h2>Pure Clean Mitts:</h2>
        <ul>
            <li>The dual sided, micro-fiber mitt shape allows for cleansing and exfoliation; remove facial and eye makeup, dirt, and oil - Refresh and rejuvenates your skin with each wash.</li>
            <li>Mitt fits over fingers. Simply add warm water. No makeup remover or other chemicals needed for a fresh face when starting your day or your nighttime skincare routine.</li>
            <li><p>Includes set of <b>7 mitts</b> with hanging loop for a full week supply and a suction cup to hang dry</p></li>
            <li>Super soft and gentle on all skin types, even sensitive</li>
            <li>Machine washable and reusable - no need to continuously buy makeup wipes and facial cleansing wipes</li>
        </ul>
    </div>
</asp:Content> 