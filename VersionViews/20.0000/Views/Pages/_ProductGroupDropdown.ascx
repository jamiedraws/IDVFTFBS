<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Dtm.Framework.Base.Models.CampaignProductView>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="System.IO" %>


<%
    var productGroup = Model.ProductCode;
    var price = Model.Price.ToString("F");
    var maxQty = string.IsNullOrEmpty(Model.PropertyIndexer["MaxOverride"]) ? Model.MaxQuantity : int.Parse(Model.PropertyIndexer["MaxOverride"]);
    var products = new List<CampaignProductView>();
    ((string)Model.PropertyIndexer["Products"]).Split(',').ToList().ForEach(x =>
    {
        var p = DtmContext.CampaignProducts.FirstOrDefault(y => y.ProductCode.ToLower() == x.ToLower());
        var showProduct = (p.PropertyIndexer["IsLive"] == null || !string.Equals("false", p.PropertyIndexer["IsLive"]) || (string.Equals("false", p.PropertyIndexer["IsLive"]) && DtmContext.IsStage));
        if (p != null && showProduct)
        {
            products.Add(p);
        }
    });

%>

<% if (productGroup == "GDQ_FACE" || productGroup == "GDQ_BROW")
    {%>

<h4 class="product__price u-pad--vert h5 sans-primary-medium"><span class="product__price-label">Price:</span> $<%=price %></h4>
<div class="c-brand">

    <div class="product__group">
    <% foreach (var product in products) {
        var color = product.ProductName.Substring(product.ProductName.LastIndexOf('-') + 1);
        var colorClass = color.Replace(" ", "").ToLower();
        %>
       <div class="product__item c-brand--form u-pad--vert sans-primary-medium h7">
            <span class="product__color product__color--<%= colorClass %>"><%= color %></span>
            <select id="<%=product.ProductCode %>_QTY" >         
                <%for (int i = 1; i <= product.MaxQuantity; i++)
                    {%>
                        <option value="<%=i %>"><%=i %></option>
                <% } %>
            </select>
            <a href="javascript:void(0);" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="<%=product.ProductCode %>" data-select-id="<%=product.ProductCode %>_QTY" data-code-toggle="true"  class="btn--product sans-primary-medium top-margin" >Add to Cart</a>
        </div> 
    <% } %>
    </div>
 
 
</div>

<script>

    window.onload = function () {
        $('#cart_<%=productGroup%>').on('click', function (e) {

                var code = $('#singleDropdown_<%=productGroup%>').val();
            var qty = $('#ddl<%=Model.ProductCode %>').val();

            handleCartChange(code, parseInt(qty), null, [], null, e);
            toast.post("Added to Cart");
            toast.show();

        });
    };

</script>

<%}
    else
    { %>
<h4 class="product__price u-pad--vert h5 sans-primary-medium"><span class="product__price-label">Price:</span> $<%=price %></h4>
<div class="c-brand">
    <div class="product__options c-brand--form u-pad--vert @x2-pad top-margin sans-primary-medium h7">
        <div class="row row-to-top">
            <div class="col right-padding">
                COLOR<br>
                <select data-select id="singleDropdown_<%=productGroup%>" name="singleDropdown_<%=productGroup%>">
                    <option value="">Select</option>
                    <%foreach (var product in products)
                        {
                            var label = product.ProductName.Substring(product.ProductName.LastIndexOf('-') + 1);
                            %>
                    <option value="<%=product.ProductCode %>"><%=label %></option>
                    <% } %>
                </select>
            </div>
            <!-- end col -->
            <div class="col">
                QTY<br>
                <select id="ddl<%=Model.ProductCode %>" class="data-qty-dropdown fld c-brand--form__select o-box o-shadow u-vw--20 u-anim">
                    <%for (int i = 0; i <= maxQty; i++)
                        {
                            if (i == 1)
                            {%>
                                <option selected value="<%=i %>"><%=i %></option>
                             <%}
                                 else
                                 { %> 
                                <option value="<%=i %>"><%=i %></option> 
                             <%} %>
                     <% } %>
                </select>
            </div>
        </div>
        <a href="#order" data-code-toggle="true" data-select data-qty-id="ddl<%=Model.ProductCode %>" data-group-name="singleDropdown_<%=productGroup%>" class="btn--product sans-primary-medium top-margin">Add To Cart</a>
    </div>
</div>

<% }%>

