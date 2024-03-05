<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">

</asp:Content> 

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Our professional-quality product that can shape, file, buff, smooth, and shine your nails at home.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Salon-quality tools for all your mani-pedi needs</li>
            <li>Shape & file, grind & smooth, buff & shine and clean-up your nails like a pro!</li>
            <li>Forward & reverse, Hi/Lo speeds for fast and easy use</li>
            <li>LED light for a clear view of the nails</li>
            <li>Get beautiful nails in the comfort of your own home</li>
            <li>Rechargeable</li>
        </ul>
    </div>
</asp:Content> 