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
		<img id="gallery__main" src="/images/products/BUNMITTS.jpg" alt="Pure Clean Mitts and Cleanse Bundle" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/BUNMITTS.jpg" alt="Pure Clean Mitts and Cleanse Bundle"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/CLEANSE-1.jpg" alt="Cleanse in a bathroom"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-3.jpg" alt="Cleanse exfoliating face"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/mitt-celebrity-2.jpg" alt="<%= productName %> with Emma Roberts"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-6.jpg" alt="Rinsing off Flawless Cleanse"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-7.jpg" alt="Before and after of cleaning face with Flawless"></a>
			<a href="#mitt-video" class="no-right-m has-fancybox"><img src="/images/products/mitt-video.jpg" alt="How To Video"></a>
			<a href="#cleanse-video" class="no-right-m has-fancybox"><img src="/images/products/flawless-cleanse-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Face Be Clean Bundle</h2>
        <span class="sans-secondary-bold block u-pad--vert">Includes: Cleanse + Pure Clean Mitts (7 Mitts)</span>
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

<div class="hide" id="mitt-video">
	<iframe src="https://player.vimeo.com/video/718489220?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="cleanse-video">
	<iframe src="https://player.vimeo.com/video/456315086?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>


</asp:Content>
