<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/brows-full.png" alt="Flawless" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/brows-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/brows-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/brows-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-video" class="has-fancybox"><img src="/images/products/brows-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial" class="no-right-m has-fancybox"><img src="/images/products/brows-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title h3 sans-primary-black">FLAWLESS BROWS BY FINISHING TOUCH</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div><!-- end .product__review -->
		<h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $19.99</h4>
		<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
		<hr>
		<div class="product__desc sans-primary-book h6">
			<p class="u-mar--vert">It's the new gold standard and first precision hair remover that instantly and painlessly sweeps away unwanted hair for stunningly beautiful brows!<br>
			</p>
			<span class="sans-primary-bold">Finishing Touch Flawless Brows Features:</span>
			<ul class="left-margin @x2-mar  bottom-padding @x3-pad">
				<li>Instantly and painlessly sweeps away unwanted hair</li>
				<li>18-karat gold plated head is hypo-allergenic</li>
				<li>Gentle enough to use every day</li>
				<li>Safe to the touch</li>
				<li>Built-in LED light</li>
				<li>Discreet and portable so you can use it anytime, anywhere</li>
				<li>1 AAA battery included</li>
			</ul>
		</div>
	</div>
</div>
</div>

<!-- 257968597 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/289087471?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/291200135?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
