<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>

<%
    var productCode = ViewData["ProductCode"] as string ?? DtmContext.PageCode;

    var product = DtmContext.CampaignProducts.FirstOrDefault(cp => cp.ProductCode.Equals(productCode));
    var bvRatingSnippet = product != null ? product.FormatBazaarVoiceInlineRatings() : string.Empty;

    if (!string.IsNullOrEmpty(bvRatingSnippet))
    {
        Response.Write(bvRatingSnippet);
    } 
    else
    {
        %>
        <div class="hearts">
			<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
		</div>
        <%
    }
%>