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
            <li>FLAWLESS Face removes peach fuzz with ease, leaving skin soft and dewy</li>
            <li>NEW double halo head for faster hair removal</li>
            <li>NEW and improved floating head contours over the curves of your face</li>
            <li>18 karat gold-plated head is hypoallergenic & dermatologist approved; gentle on all skin types & tones</li>
            <li>No redness, nicks, or cuts &ndash; Instantly soft and FLAWLESS</li>
            <li>Built-in LED so you never miss a hair</li>
        </ul>
    </div>
</asp:Content> 