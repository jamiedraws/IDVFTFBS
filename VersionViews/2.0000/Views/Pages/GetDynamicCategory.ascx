<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>

<% 
    var item = Request["item"] ?? string.Empty;
    var code = Request["code"] ?? string.Empty;
    var prop = Request["prop"] ?? string.Empty;
    var sum = Request["sum"] ?? string.Empty;
    var filterByProp = Request["filterByProp"] ?? string.Empty;

    if ( !String.IsNullOrEmpty(item) || !String.IsNullOrEmpty(code) ) {
        try {
            var category = DtmContext.CampaignProducts
                .Where(
                    cp => String.Equals(
                        cp.PropertyIndexer[prop], filterByProp, StringComparison.CurrentCultureIgnoreCase
                    )
                ).ToList();
            if ( category.Count == 0 ) {
                category = DtmContext.CampaignProducts
                    .Where(cp => cp.CategoryIndexer.Has(code))
                    .ToList();
            }

            if ( !String.IsNullOrEmpty(sum) ) {
                Response.Write(category.Count);
            } else {
                if ( category.Count > 0 ) {
                    int x =  Int32.Parse(item);
                    var product = category.ElementAt(x);
                    var json = new
                    {
                        ProductCode = product.ProductCode,
                        ProductName = product.ProductName,
                        DisplayText = product.DisplayText,
                        MaxQuantity = product.MaxQuantity,
                        Properties = product.PropertyIndexer[prop]
                    };

                    var jsonString = JObject.FromObject(json).ToString();
                    Response.Write(jsonString);
                }
            }
        } catch (Exception exception) {
            Response.Write("An error occurred: " + exception);
        }
    }
%>