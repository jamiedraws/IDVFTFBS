<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/legs-full.png" alt="Flawless" class="gallery__main">
		<div class="gallery__thumbs">
				<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/legs-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/legs-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/legs-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="#flawless-video" class="has-fancybox"><img src="/images/products/legs-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="#flawless-commercial" class="no-right-m has-fancybox"><img src="/images/products/legs-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			</div>
	</div>
	<div class="product">
		<h2 class="product__title h3 sans-primary-black">FLAWLESS LEGS BY FINISHING TOUCH</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div><!-- end .product__review -->
		<h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $59.98</h4>
		<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
		<hr>
		<div class="product__desc sans-primary-book h6">
			<p class="u-mar--vert">
				Flawless Legs breakthrough design gives you 4 times more coverage than razors. Floating heads contour to every curve - even small, delicate areas around ankles and knees. Plus the built-in LED lights make it easy to see and remove it all with no nicks, cuts or irritation.<br>
			</p>
			<span class="sans-primary-bold">Finishing Touch Flawless Legs Features:</span>
			<ul class="left-margin @x2-mar">
				<li>18-Karat gold-plated floating heads</li>
				<li>'Palm perfect' design for superior control</li>
				<li>No nicks, cuts or irritation</li>
				<li>No soap or water - use anywhere, any time</li>
				<li>Rechargeable and lighted</li>
				<li>Safe on all skin types</li>
			</ul>
			<hr>

			<p class="bottom-margin"><strong class="block">Does Flawless Legs&trade; pull hair out by the root?</strong>
			Flawless Legs&trade; is not an epilator &ndash; there is NO pulling hair out by the root (ouch!). The secret to Flawless Legs instant and painless hair removal is the revolutionary Butterfly Technology that erases hair by microscopically paring it down through the spinning head. Neatly and discretely housed under the 18 karat gold-plated head, the Butterfly Technology ensures precision hair removal without nicks, cuts, or irritation. 
			</p>

			<p class="bottom-margin"><strong class="block">Is hair eliminated through a light feature, laser, or heat?</strong>
			Flawless Legs&trade; does not use a laser or hot wire; it's safe on all skin types and tones. The revolutionary Butterfly Technology erases hair instantly and painlessly by microscopically paring it down to the surface of the skin. 

			<p class="bottom-margin"><strong class="block">How long does Flawless Legs&trade; hold a charge?</strong>
			Unit will work for approximately 1-hour on a full charge. 
			</p>

			<p class="bottom-margin"><strong class="block">How do I clean my Flawless Legs&trade; unit?</strong>
			NOTE: Do NOT use Flawless Legs&trade; in the shower or submerge it in water to clean. While the unit is water resistant, it is NOT water-proof.  
			To clean your Flawless Legs unit, hold the main body of the shaver in one hand, and with the other hand, grip the tabs on the lower head and pull it away from the upper head.<br>
			To remove hair clippings from the lower head, simply turn it over and gently shake it out over a trash can. Use the unit's cleaning brush to dislodge and remove any clippings stuck in the heads.
			</p>


			<p class="bottom-margin"><strong class="block">How often should I replace my Flawless Legs&trade; head?</strong>
			Everyone is different. People with very long legs and a lot of hair will probably want to replace the head sooner than someone with shorter legs and lighter hair.   
			<br>
			For average coverage area and hair density, replace the head every 3-6 months. 
			</p>

			<p class="bottom-margin"><strong class="block">Where can I order Flawless Legs&trade; replacement heads? </strong>
			Flawless Legs&trade; replacement head are available online at <a href="https://www.FlawlessHeads.com/" target="_blank">www.FlawlessHeads.com</a>! The 4-heads are built into a single replacement head. 
			</p>
			<div class="bottom-padding @x3-pad">&nbsp;</div>
		</div>
	</div>
</div>
</div>

<!-- 279323546 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/289089064?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/279323546?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
