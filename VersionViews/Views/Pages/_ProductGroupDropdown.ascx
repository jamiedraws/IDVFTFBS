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
        var p = DtmContext.CampaignProducts
        .FirstOrDefault(y => y.ProductCode.ToLower() == x.ToLower() 
        && (y.PropertyIndexer["IsLive"] == null || !string.Equals("false", y.PropertyIndexer["IsLive"]))
        || (string.Equals("false", y.PropertyIndexer["IsLive"]) && DtmContext.IsStage));
        if (p != null)
        {
            products.Add(p);
        }
    });

%>


<h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $<%=price %></h4>
<div class="c-brand">
    <div class="product__options c-brand--form u-pad--vert @x2-pad top-margin sans-primary-medium h7">
        <div class="row row-to-top">
            <div class="col right-padding">
                COLOR<br>
                <select data-select name="singleDropdown_<%=productGroup%>">
                    <option value="">Select</option>
                    <%foreach (var product in products)
                        { 
                             var label = product.ProductName.Substring(product.ProductName.LastIndexOf('-') + 1);
                            %>
                    <option
                        <%if (products.Count == 1)
                        {%> selected <%} %>
                        value="<%=product.ProductCode %>"><%=label %></option>
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
                             else{ %> 
                                <option value="<%=i %>"><%=i %></option> 
                             <%} %>
                     <% } %>
                </select>
            </div>
        </div>
        <a href="#order" data-code-toggle="true" data-select data-qty-id="ddl<%=Model.ProductCode %>" data-group-name="singleDropdown_<%=productGroup%>" class="btn--product sans-primary-medium top-margin">Add To Cart</a>
    </div>
</div>

