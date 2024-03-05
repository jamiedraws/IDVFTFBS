<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/dermaplane-full.png" alt="Flawless" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/dermaplane-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/dermaplane-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/dermaplane-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/dermaplane-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title h3 sans-primary-black">FINISHING TOUCH DERMAPLANE</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div><!-- end .product__review -->
		<h4 class="product__title h5 uppercase sans-primary-medium">Only Available In Stores</h4>
		<hr>
		<div class="product__desc sans-primary-book h6">
			<p class="u-mar--vert">Finishing Touch&reg; Flawless&reg; Dermaplane&trade; exfoliates and removes facial hair to improve surface of skin, and enable flawless application of makeup and topical creams.<br>
			</p>
			<span class="sans-primary-bold">Finishing Touch Flawless Dermaplane Features:</span>
			<ul class="left-margin @x2-mar  bottom-padding @x3-pad">
				<li>German Stainless Steel Blades include a ridged safety-guard designed to protect your skin</li>
				<li>Soft-grip handles for precision control</li>
				<li>Two long blades for larger areas and two smaller blades for more precision above the brow line and upper lip</li>
				<li>Instantly and painlessly exfoliates and removes peach fuzz without having to wax or laser</li>
				<li>Helps skin appear healthier, brighter and have a smoother look and feel</li>
			</ul>
		</div>
	</div>
</div>
</div>

<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/255397466?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
