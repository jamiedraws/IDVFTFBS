<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
	var EnableOrderForm = SettingsManager.ContextSettings["Order.EnableOrderform", true];
	var ShowMobileOrderForm = SettingsManager.ContextSettings["FrameworkJS/CSS.DtmStyle.ShowOrderFormOnMobile", false];
%>

	<section id="content_bottom" class="l-outer__in c-brand block @dv-o-box--top @dv-o-shadow--out">



	<%-- // Displays the offer details on desktop --%>
	<% if ( EnableOrderForm && !Model.IsMobile ) { %>

		<div class="u-mar--bottom @x2-mar">

			<div class="snippet--od o-box u-vw--80 u-mar--center" tabindex="0">

				<% Html.RenderSnippet("OFFERDETAILS"); %>

			</div>

		</div>

	<% } %>

	</section>


	<%-- // Displays the offer details on mobile --%>
	<% if ( EnableOrderForm && Model.IsMobile ) { %>

		<div class="c-brand l-outer__in block o-box" tabindex="0">

			<% Html.RenderSnippet("OFFERDETAILS"); %>

		</div>

	<% } %>
