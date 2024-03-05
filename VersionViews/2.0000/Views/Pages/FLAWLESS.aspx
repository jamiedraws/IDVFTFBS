<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/flawless-full.png" alt="Flawless" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/flawless-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-video" class="has-fancybox"><img src="/images/products/face-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial" class="no-right-m has-fancybox"><img src="/images/products/face-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title h3 sans-primary-black">FLAWLESS BY FINISHING TOUCH</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div><!-- end .product__review -->
		<h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $19.99</h4>
		<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
		<hr>
		<div class="product__desc sans-primary-book h6">
			<p class="u-mar--vert">Flawless is the revolutionary new facial hair removal device that erases hair instantly and painlessly without the irritation that comes with plucking, waxing or depilatories. Flawless is designed to look like a lipstick but contains the finest German engineered technology that microscopically removes hair. You can be "flawless" anywhere, anytime.<br>
			</p>
			<span class="sans-primary-bold">Finishing Touch Flawless Features:</span>
			<ul class="left-margin @x2-mar">
				<li>Instant and Pain-Free Hair Removal</li>
				<li>Built-in light</li>
				<li>Safe on any skin type</li>
				<li>Dermatologist recommended</li>
				<li>1 AA Battery Included</li>
				<li>Head is gold plated</li>
				<li>Hair will not grow back thicker or faster</li>
				<li>No nicks, cuts, irritation, bumps or redness</li>
			</ul>
			<hr>
			<p class="bottom-margin"><strong class="block">Does Flawless shave the hair or pull it out by the root?</strong>

			The secret is a revolutionary Butterfly Technology that erases hair by microscopically paring it down through a spinning head. Neatly and discreetly housed under the 18 karat gold-plated head, the Butterfly Technology never touches delicate facial skin. Dermatologist approved, Flawless is not a laser, hot wire, epilator, or razor. It is safe on all skin types and tones.</p>

			<p class="bottom-margin"><strong class="block">Are the hairs eliminated using a light feature, laser, or heat?</strong>

			No, Finishing Touch Flawless does not use a laser or hot wire. The revolutionary Butterfly Technology erases hair by microscopically paring it down to the surface of the skin. It is safe on all skin types and tones. Dermatologist approved, Flawless is not a laser, hot wire, epilator, or razor.</p>
			<div class="bottom-padding @x3-pad">&nbsp;</div>
		</div>
	</div>
</div>
</div>

<!-- 207160876 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/289088755?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/207160876?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
