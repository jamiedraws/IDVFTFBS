<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>The Perfect Facial Hair Remover Kit! Meet your new painless instant hair removal set without the irritation that comes with plucking, waxing or depilatories.</p>

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
        <h2>Brows:</h2>
        <ul>
            <li>New & Improved pinpoint precision head can erase a single hair or many</li>
            <li>Shape and maintain brows in between salon visits in the comfort of your own home</li>
            <li>18K Gold Plated head erases brow hair from the surface of the skin</li>
            <li>NO redness, irritation, or downtime</li>
            <li>Dermatologist Approved, hypoallergenic</li>
            <li>Built-in LED light so you never miss a hair</li>
        </ul>
    </div>
</asp:Content> 