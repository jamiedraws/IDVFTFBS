<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var contour = "Flawless Contour&trade; Facial Roller";
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/contour.jpg" alt="Flawless Contour&trade; Facial Roller" class="gallery__main">
		<div class="gallery__thumbs gallery__thumbs--six">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/contour.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/contour-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/contour-in-use-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/contour-in-use-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/contour-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-how-to" class="no-right-m has-fancybox"><img src="/images/products/contour-how-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Flawless Contour&trade; Facial Roller</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div><!-- end .product__review -->


		<!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->

		<div class="product__desc sans-secondary-book p">
			</p>
			<span class="sans-secondary-bold p">FEATURES &amp; BENEFITS:</span>
			<ul class="left-margin @x2-mar  bottom-padding @x3-pad p">
				<li>Helps stimulate circulation and promotes collagen production*</li>
				<li>Designed to help reduce the appearance of fine lines*</li>
				<li>Roller head and under eye press are genuine Rose Quartz and can be refrigerated to increase cooling effect</li>
				<li>Vibrating handle can be used "on" or "off"</li>
				<li>Roll-on anti-wrinkle creams and serums for deeper penetration and improved results over time*</li>
				<li>Helps tone, de-puff and improve the appearance of your skin<br><a href="/images/studies.pdf" target="_blank" style="text-decoration: underline;">*CLICK HERE FOR STUDIES</a></li>
			</ul>
		</div>
	</div>
</div>
</div>

<div class="hide" id="flawless-how-to">
	<iframe src="https://player.vimeo.com/video/353415216?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/353411545?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
