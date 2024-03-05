<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<% 
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var url = SettingsManager.ContextSettings["CustomerService.DomainUrl"]; 
%>

<div class="row-to-center center-margin u-vw--100 center-text">
    <div class="col @sm-u-vw--50 @sm-fn--lg @md-fn--xl @sm-u-pad--bottom @x2-pad">
        <a href="<%= url %>" title="Visit our <%= productName %> Replacements" class="order-button u-vw--100">
            <small>Click Here To</small> Order Now
        </a>
    </div>
    <div class="col @sm-u-vw--50 @sm-fn--lg @md-fn--xl @sm-u-pad--top @x2-pad">
        <a href="<%= url %>" title="Visit our <%= productName %> Replacements" class="order-button u-vw--100">
            <small>Click Here For</small> Replacement Heads
        </a>
    </div>
</div>