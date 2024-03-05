<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
 
</asp:Content> 

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>A gentle, yet deeply cleansing brush that leaves skin soft, smoother and ready for serums.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Ultra-hygienic silicone head</li>
            <li>4 modes, gentle cleansing, pulsating, massage, and deep cleanse for the ultimate facial cleaning experience.</li>
            <li>Cleans and massages</li>
            <li>Increases circulation to help promote collagen production</li>
            <li>Dermatologist approved</li>
            <li>Fully waterproof &ndash; perfect for the shower</li>
            <li>Rechargeable</li>
        </ul>
    </div>
</asp:Content> 