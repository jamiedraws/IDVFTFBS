<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/ProductDetailLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="ProductImageCarouselThumbnail" ContentPlaceHolderID="ProductImageCarouselThumbnail" runat="server">
 
</asp:Content>

<asp:Content ID="ProductFeatures" ContentPlaceHolderID="ProductFeatures" runat="server">
    <p>Sculpts and tones skin by massaging it. Meanwhile the vibrating roller promotes collagen and circulation to give your face that dewy glow.</p>

    <div class="product__block">
        <h2>Features & Benefits:</h2>
        <ul>
            <li>Helps stimulate circulation and promotes collagen production*</li>
            <li>Designed to help reduce the appearance of fine lines*</li>
            <li>Roller head and under eye press are genuine Rose Quartz and can be refrigerated to increase cooling effect</li>
            <li>Vibrating handle can be used "on" or "off"</li>
            <li>Roll-on anti-wrinkle creams and serums for deeper penetration and improved results over time*</li>
            <li>Helps tone, de-puff and improve the appearance of your skin</li>
        </ul>
    </div>

    <div class="product__block">
        <a href="/images/studies.pdf" data-modal-dialog-id="studies" data-modal-dialog-actor="open" data-modal-dialog-iframe data-modal-dialog-title="Studies" data-modal-dialog-template-modifier="document">*CLICK HERE FOR STUDIES</a>
    </div>
</asp:Content> 