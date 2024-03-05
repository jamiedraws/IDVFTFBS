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
		<img id="gallery__main" src="/images/products/NFRIG-1.jpg" alt="Beauty Fridge" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/NFRIG-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Beauty Fridge"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-glam.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Beauty Fridge"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-closed.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Beauty Fridge"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-empty.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See the fridge empty"></a>
			<!-- <a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-open.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See how it looks with products"></a> -->
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-size.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See the fridge dimensions"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-package.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="View the package"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/fridge-uses.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="What can I use in my fridge"></a>
			<a href="#vert-video" class="has-fancybox"><img src="/images/products/video--fridge-vert.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See how it works"></a>
			<a href="#video-how" class="has-fancybox"><img src="/images/products/video--fridge.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See how it works"></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Beauty Fridge</h2>
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

<div class="hide" id="video-how">
	<iframe src="https://player.vimeo.com/video/453352395?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
