<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<% var ProductName = SettingsManager.ContextSettings["Label.ProductName"]; %>

<!-- // social media -->
<ul class="row-to-center center-text center-margin">
	<li class="col">
		<a href="https://www.facebook.com/FlawlessBeauty/" target="_blank" title="Like <%= SettingsManager.ContextSettings["Label.ProductName"] %> on Facebook" class="no-text-decoration"><span class="icon-facebook icon--social"></span></a>
	</li>
	<li class="col u-pad--horz">
		<a href="https://www.instagram.com/flawlessbeauty/" target="_blank" title="Follow <%= SettingsManager.ContextSettings["Label.ProductName"] %> on Instagram" class="no-text-decoration"><span class="icon-instagram icon--social"></span></a>
	</li>
	<li class="col left-padding">
		<a href="https://www.youtube.com/c/FlawlessBeauty" target="_blank" title="Watch <%= SettingsManager.ContextSettings["Label.ProductName"] %> on YouTube" class="no-text-decoration"><span class="icon-youtube icon--social"></span></a>
	</li>
</ul>