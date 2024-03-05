<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
    var offerName = DtmContext.OfferCode ?? null;
    var version = Decimal.ToInt32(DtmContext.Version);
    var pageCode = DtmContext.PageCode;
    var category = (Dtm.Framework.Base.Models.CategoryView)null;

    if (offerName != null)
    {
        var versionIdentifier = pageCode + "-" + offerName + "-" + version.ToString();
        var offerIdentifier = pageCode + "-" + offerName;

        //Check if there is category @ version level
        if (Model.Categories.Where(x => x.Code.Equals(versionIdentifier, StringComparison.InvariantCultureIgnoreCase)).Any())
        {
            category = Model.Categories.FirstOrDefault(x => x.Code.Equals(versionIdentifier, StringComparison.InvariantCultureIgnoreCase));
        }
        //Check if there is category @ offer level
        else if (Model.Categories.Where(x => x.Code.Equals(offerIdentifier, StringComparison.InvariantCultureIgnoreCase)).Any())
        {
            category = Model.Categories.FirstOrDefault(x => x.Code.Equals(offerIdentifier, StringComparison.InvariantCultureIgnoreCase));
        }
        //Check for page code
        else
        {
            category = Model.Categories.FirstOrDefault(x => x.Code.Equals(DtmContext.PageCode, StringComparison.InvariantCultureIgnoreCase));
        }

    }

    var title = category == null ? string.Empty : category.Name;
    if (category != null)
    {
        var categoryProducts = DtmContext.CampaignProducts
            .Where(cp => cp.CategoryIndexer.Has(category.Code))
            .ToList();


%>

<div class="hide">

    <% Html.RenderPartial("OrderFormReviewTable"); %>
</div>

<div id="product-grid" class="<%=category.Code.ToLower() %>">
    <%if (pageCode == "REPLACEMENT")
        {

            Html.RenderPartial("_ProductReplacement", categoryProducts);

        }
        else
        { %>

    <%
        foreach (var product in categoryProducts.Where(p => (p.PropertyIndexer["IsLive"] == null || string.Equals("true", p.PropertyIndexer["IsLive"], StringComparison.InvariantCultureIgnoreCase))
        || (string.Equals("false", p.PropertyIndexer["IsLive"]) && (DtmContext.Domain.FullDomain.Contains("dtmstage") || DtmContext.Domain.FullDomain.Contains("localhost")))))
        {
            if (product.ProductCode.StartsWith("GDQ_"))
            {
                Html.RenderPartial("_ProductGroupDropdown", product);
            }
            else
            {
                Html.RenderPartial("_ProductSingle", product);
            }
        }
    %>


    <%} %>
</div>
<!-- end .col -->

<% 
    if (categoryProducts != null)
    {
        var products = categoryProducts
       .Where(p =>
           (
               p.PropertyIndexer["IsLive"] == null
               || string.Equals("true", p.PropertyIndexer["IsLive"], StringComparison.InvariantCultureIgnoreCase)
           )
           ||
           (
           string.Equals("false", p.PropertyIndexer["IsLive"])
           &&
               (
               DtmContext.Domain.FullDomain.Contains("dtmstage")
               || DtmContext.Domain.FullDomain.Contains("localhost")
               )
           )
           ).ToList();

        Html.RenderPartial("StructuredDataJSONLD", new ViewDataDictionary
            {
                { "Type", "Product" },
                { "Products", products}
            }
        );
    }

%>

<% }  %>






