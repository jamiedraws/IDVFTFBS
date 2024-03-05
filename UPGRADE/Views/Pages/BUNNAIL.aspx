<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Perfect Mani Pedi at home solution. No more expensive nail appointments when you have this rechargeable duo!</p>

    <div class="product__block">
        <h2>Salon Nails:</h2>
        <ul>
            <li>Salon-quality tools for all your mani-pedi needs</li>
            <li>Shape & file, grind & smooth, buff & shine and clean-up your nails like a pro!</li>
            <li>Forward & reverse, Hi/Lo speeds for fast and easy use</li>
            <li>LED light for a clear view of the nails</li>
        </ul>
    </div>

    <div class="product__block">
        <h2>Pedi:</h2>
        <ul>
            <li>Easy reach design for a more natural back-and-forth motion</li>
            <li>Removes tough calluses, cracked dry skin, and rough areas safely</li>
            <li>Easy to use on heels, toes, sides, and balls of feet</li>
            <li>Two speeds and two heads, coarse and fine, for every treatment needed</li>
            <li>With a built-in LED light so you never miss a spot</li>
        </ul>
    </div>
</asp:Content> 