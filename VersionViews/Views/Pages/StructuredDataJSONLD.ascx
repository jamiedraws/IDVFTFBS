<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<%@ Import Namespace="IDVFTFBS.StructuredData" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>

<%
    var type = ViewData["Type"] as string ?? string.Empty;


    JObject structuredData = null;
    if (type.Equals("BreadcrumbList"))
    {
        var listItems = ViewData["ListItems"] as List<IDVFTFBS.StructuredData.ListItem> ?? new List<IDVFTFBS.StructuredData.ListItem>();

        structuredData = new JObject(
           new JProperty("@context", "https://schema.org"),
           new JProperty("@type", "BreadcrumbList"),
           new JProperty("itemListElement",
               new JArray(
                   from listItem in listItems
                   select new JObject(
                       new JProperty("@type", "ListItem"),
                       new JProperty("position", (listItems.IndexOf(listItem) + 1).ToString()),
                       new JProperty("name", listItem.Name),
                       new JProperty("item", listItem.Item)
                   )
               )
           )
       );



    }
    else if (type.Equals("Product"))
    {
        var products = ViewData["Products"] as List<CampaignProductView>;
        if (products != null && products.Any())
        {
            var productCount = products.Count;

            if (productCount == 1)
            {
                var product = products.FirstOrDefault();
                structuredData = new JObject(
                   new JProperty("@context", "https://schema.org"),
                   new JProperty("@type", "Product"),
                   new JProperty("sku", product.ProductSku),
                   new JProperty("name", product.ProductName),
                   new JProperty("offers",
                       new JArray(
                           new JObject(
                               new JProperty("@type", "Offer"),
                               new JProperty("availability", "https://schema.org/InStock"),
                               new JProperty("price", product.Price.ToString("#.00")),
                               new JProperty("priceCurrency", "USD")
                           )
                       )
                   )
                );
            }
            else
            {
                 structuredData = new JObject(
                   new JProperty("@context", "https://schema.org"),
                   new JProperty("@type", "ItemList"),
                   new JProperty("numberOfItems", productCount),
                   new JProperty("itemListElement",
                       new JArray(
                           from product in products
                           select new JObject(
                               new JProperty("@type", "Product"),
                               new JProperty("sku", product.ProductSku),
                               new JProperty("name", product.ProductName),
                               new JProperty("offers",
                                   new JArray(
                                       new JObject(
                                           new JProperty("@type", "Offer"),
                                           new JProperty("availability", "https://schema.org/InStock"),
                                           new JProperty("price", product.Price.ToString("#.00")),
                                           new JProperty("priceCurrency", "USD")
                                       )
                                   )
                               )
                           )
                       )
                   )
                );

            }

        }

    }
%>
<script type="application/ld+json">
    <%=structuredData != null ? structuredData.ToString() : String.Empty%>
</script>
