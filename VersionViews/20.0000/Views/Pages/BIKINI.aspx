<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];

	var renderBikini = new DisplayProduct().CanDisplayByProductCode("BIKINI");

	if (!renderBikini)
    {
		var landingPageUrl = String.Format("/{0}/{1}/index{2}", DtmContext.OfferCode, DtmContext.Version, DtmContext.ApplicationExtension);

		Response.Redirect(landingPageUrl);
    }
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/flawless-bikini-main.jpg" alt="Flawless Bikini" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/flawless-bikini-main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Bikini"></a>
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/flawless-bikini.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Bikini"></a>
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/bikini-use-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Bikini"></a>
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/bikini-use-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Bikini"></a>
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/bikini-use-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Bikini"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/bikini-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="A young woman wearing a flawless bikini"></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/flawless-bikini-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Bikini</h2>
        
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>

        <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>

        <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- 257968597 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/492225455?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/697434521?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
