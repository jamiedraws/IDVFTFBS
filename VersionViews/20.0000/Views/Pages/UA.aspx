<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/UA-1.jpg" alt="Underarm Hair Remover" class="gallery__main">
		<div class="gallery__thumbs">
				<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/UA-1.jpg" alt="Underarm Hair Remover photo"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/UA-2.jpg" alt="Underarm Hair Remover photo"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/UA-3.jpg" alt="Underarm Hair Remover photo"></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/UA-4.jpg" alt="Underarm Hair Remover photo"></a>
				<a href="#underarm-video" class="has-fancybox"><img src="/images/products/underarm-video.jpg" alt="Thumbnail for video"></a>
			</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Underarm Hair Remover</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
           <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>
		<!--DESCRIPTION HTML -->

		<p>A contoured hair removal device built specifically for the sensitive needs of a women's underarm area. The cordless shaver is water resistant and can be safely stored in the shower or used on dry underarms when on the go. Our unique blade technologies merge to address sensitive skin and to prevent nicks, bumps, and ingrown hairs.
		</p>

		<ul class="page--list">
			<li>Specially designed to be curved to contour a woman&rsquo;s underarm</li>
			<li>Designed for sensitive skin with two types of unique blade technologies merged to gently remove hair without no nicks, bumps, cuts or ingrowns.</li>
			<li>Wireless and rechargeable for ease</li>
			<li>Wet/dry for use in and out of the shower or on the go while vacationing or at the gym</li>
			<li>Built in LED light to luminate the skin's surface so you never miss a hair</li>
		</ul>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- 279323546 -->
<div class="hide" id="underarm-video">
	<iframe src="https://player.vimeo.com/video/741192820?title=0&byline=0&portrait=0" width="400" height="711" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>


</asp:Content>
