<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dtm.Framework.Base.Models.CampaignProductView>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="System.IO" %>


<%

    var productCode = Model.ProductCode;
    var priceOverride = Model.PropertyIndexer["PriceOverride"];
    var price = string.IsNullOrWhiteSpace(priceOverride) ? "<span class='product__price-label'>PRICE: </span>$" + Model.Price.ToString("F") : "<span class='product__price-label'>PRICE: </span>$" + priceOverride;
    var priceOverrideStyle = Model.PropertyIndexer["PriceOverrideStyle"];

    if (!string.IsNullOrWhiteSpace(priceOverrideStyle))
    {
        price = priceOverrideStyle;
    }

    if (productCode == "ADAPT" && DtmContext.ShoppingCart != null && DtmContext.ShoppingCart["ADAPTF"].Quantity > 0)
    {
        productCode = "ADAPTF";
    }

    var outOfStock = Model.PropertyIndexer["OutOfStock", "false"];
    var isOutOfStock = false;
    bool.TryParse(outOfStock, out isOutOfStock);


%>
<h4 class="product__price u-pad--vert h5 sans-primary-medium"><%=price %>
    <%
        if (productCode == "NFRIG")
        {
    %>
		&nbsp;+ $8.95 P&H
    <%
        }
        else if (productCode == "ADAPT1")
        {
    %>
        &nbsp;+ $2.99 P&amp;H
				<small style="color: #717171; font-weight: normal; text-transform: capitalize; font-size: 0.75em; line-height: 1;" class="block">(Free shipping if you spend $19.99)</small>
    <%
        }

    %>

</h4>
<div class="product__options top-margin sans-primary-medium h7">
    <%if (isOutOfStock)
        { %>
    <a href="javascript:void(0)" class="btn--product sans-primary-medium top-margin">Out of Stock</a>

    <%}
        else
        { %>
    <div class="c-brand--form product__qty-group">
        QTY&nbsp;
        <select id="<%=productCode%>_Qty" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
            <option value="1">1</option>
            <option value="2">2</option>
        </select>
    </div>

    <a href="#" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code-toggle="true" data-code="<%=productCode %>" data-select-id="<%=productCode%>_Qty" class="btn--product sans-primary-medium top-margin">Add To Cart</a>

    <%} %>
</div>
