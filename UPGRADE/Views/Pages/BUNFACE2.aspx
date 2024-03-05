<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Our hottest selling hair removal team! Combine our Facial Hair Remover and Bikini device for a quick and painless experience. Fits easily in your purse, beach bag or suitcase!</p>

    <div class="product__block">
        <h2>Facial Hair Remover:</h2>
        <ul>
            <li>NEW double halo head for faster hair removal</li>
            <li>NEW and improved floating head contours over the curves of your face</li>
            <li>18 karat gold-plated head is hypoallergenic & dermatologist approved; gentle on all skin types & tones</li>
            <li>No redness, irritation or down time - instant & painless!</li>
            <li>Built-in LED so you never miss a hair</li>
        </ul>
    </div>

    <div class="product__block">
        <h2>Bikini:</h2>
        <ul>
            <li>No nicks, bumps, burns, irritation or ingrown hairs</li>
            <li>Angled trimmer head for curves and crevices</li>
            <li>Micro-oscillating 18-karat gold-plated head</li>
            <li>Hypoallergenic and gentle on all skin types</li>
            <li>Trimming attachment for a precise, even length</li>
            <li>LED light</li>
        </ul>
    </div>
</asp:Content> 