<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">

</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>
        A quick, easy way to remove peach fuzz without the risk of bumps.  Gives you a soft glow, almost immediately.
    </p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Removes hair instantly & pain free</li>
            <li>Prevents irritation</li>
            <li>Ring light for 360°precision</li>
            <li>Dermatologist approved</li>
            <li>Gentle on the skin</li>
            <li>Double ring in the head of unit.</li>
            <li>1 AA battery included, and cleaning brush included</li>
            <li>18-karat gold plated head is hypoallergenic</li>
            <li>Ultra precision trimming for 50% smoother feeling skin*</li>
        </ul>
    </div>
</asp:Content> 