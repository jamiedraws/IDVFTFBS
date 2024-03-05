<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Classes" %>

<%
    var classModifier = ViewData["classModifier"] as string ?? "footer";
    string klaviyoClassModifier = "klaviyo-form-T9QMVM";

    if (!IDVFTFBS.Classes.SiteStatus.IsStoreOpen)
    {
        klaviyoClassModifier = string.Format("{0} klaviyo-form-T9QMVM--contains-overrides", klaviyoClassModifier);
    }
%>

<div class="<%= classModifier %> <%= classModifier %>--form">
    <div class="<%= klaviyoClassModifier %>"></div>
</div>