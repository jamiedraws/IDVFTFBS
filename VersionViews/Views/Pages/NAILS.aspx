
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
		<img id="gallery__main" src="/images/products/NAILS-1.jpg" alt="Salon Nails" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/NAILS-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-nails.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-nails-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt="In use shot"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-nails-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt="In use shot"></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/salon-nails-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Watch the Commercial"></a>
			<!--<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--white.png?appV=<%= DtmContext.ApplicationVersion %>" alt="White"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--teal.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Teal"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--lavender.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Lavender"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--pink.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Pink"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/14.0000/flawless--black.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Black"></a>-->
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/salon-nails-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="How To Video"></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Salon Nails</h2>
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

<!-- 207160876 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/491705447?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial"><!-- OG ID 572755450 -->
	<iframe src="https://player.vimeo.com/video/694489889?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
