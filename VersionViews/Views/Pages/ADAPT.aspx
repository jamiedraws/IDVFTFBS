<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/3.0000/adaptor-home.png" alt="Adaptor" class="gallery__main">
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Adaptor</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
        <!-- end .product__review -->


        <%Html.RenderPartial("_Products", Model); %>


        <!-- end .product__review -->

		<hr>
         <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- <div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/315242875?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-how">
	<iframe src="https://player.vimeo.com/video/379052230?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div> -->

<style>
#vert-video,
#vert-video iframe {
	min-width: 300px !important;
	min-height: 525px !important;
	width: 300px !important;
	height: 525px !important;
}
</style>

<div class="hide" id="vert-video">
	<iframe src="https://player.vimeo.com/video/405967428?title=0&byline=0&portrait=0" frameborder="0" allow="autoplay; fullscreen" width="300" height="525" allowfullscreen></iframe>
</div>

</asp:Content>
