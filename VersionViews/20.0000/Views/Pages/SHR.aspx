<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/SHR.jpg" alt="Stray Hair Remover" class="gallery__main">
		<div class="gallery__thumbs">
				<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/SHR.jpg" alt="Stray Hair Remover image"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/SHR-1.jpg" alt="Stray Hair Remover image"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/SHR-2.jpg" alt="Stray Hair Remover image"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/SHR-3.jpg" alt="Stray Hair Remover image"></a>
				<a href="#stray-video" class="has-fancybox"><img src="/images/products/stray-video.jpg" alt="Stray Hair Remover image video thumbnail"></a>
			</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Stray Hair Remover</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
           <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>
		<!--DESCRIPTION HTML -->

		<p>A super precise, micro-blade tool built to painlessly remove pesky hairs that pop up when you least expect them or those hairs left behind from other hair removal treatments. The small and discrete tool removes stray hairs from your chin, lip, fingers, or toes. You will want this innovative tool as an alternative to razors and tweezing.
		</p>

		<ul class="page--list">
			<li>The first ultra-precise trimming micro-blade to eliminate stray hairs without tweezing</li>
			<li>Pain free razor alternative for instant hair removal results</li>
			<li>Small and discreet, great to keep in a purse, bag, or backpack</li>
			<li>Dermatologist approved for safe use and different skin types</li>
		</ul>

			<hr>

	</div>
</div>
</div>

<!-- 279323546 -->
<div class="hide" id="stray-video">
	<iframe src="https://player.vimeo.com/video/741207715?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>


</asp:Content>
