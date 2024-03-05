<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/masks.jpg" alt="Silk Mask" class="gallery__main">
		<div class="gallery__thumbs">
				<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/maskS.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-silk-mask-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-silk-mask-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-silk-mask-4.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="#mask-video" class="has-fancybox"><img src="/images/products/mask-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Silk Mask - Set of 4</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
           <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>
		<!--DESCRIPTION HTML -->

		<p>This stylish silk mask is comfortable, breathable and gentle on the skin so you look and feel flawless!</p>

		<ul class="page--list">
		  <li>Ultra soft and gentle on the skin</li>

		  <li>Breathable, comfortable and adjustable</li>

		  <li>Washable and reusable</li>

		  <li>Made with genuine silk</li>

		  <li>Fitted nose piece</li>

		<li>100% Pure Mulberry Silk is hypoallergenic,
		  breathable, and cooler than other fabrics</li>

		</ul>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- 279323546 -->
<div class="hide" id="mask-video">
	<iframe src="https://player.vimeo.com/video/527454999?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>


</asp:Content>
