<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var flawlessAdaptor = "FLAWLESS Adaptor";
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/NuRazor.png" alt="Flawless&reg; NuRazor&trade;" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image""><img src="/images/products/NuRazor.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/nurazor-use-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/nurazor-use-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/nurazor-use-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/nurazor-use-4.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/nurazor-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial2" class="has-fancybox"><img src="/images/3.0000/nu-commercial-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<!-- <a href="#flawless-how--full" class="no-right-m has-fancybox"><img src="/images/products/3.0000/nu-play-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a> -->
			<a href="#flawless-how2" class="no-right-m has-fancybox"><img src="/images/products/3.0000/nu-play-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<!-- <a href="#flawless-how3" class="no-right-m has-fancybox"><img src="/images/products/3.0000/nu-play-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a> -->
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">FLAWLESS Nu Razor&trade;</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div>
        <!-- end .product__review -->


        <%Html.RenderPartial("_Products", Model); %>


<%--        <h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $39.99</h4>
		<div class="product__options top-margin sans-primary-medium h7">
			<a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>
		</div>--%>

        <!-- end .product__review -->

		<hr>
         <!--DESCRIPTION HTML -->

				 <div class="product__desc sans-secondary-book p">

					<p class="u-mar--vert">
							FLAWLESS Nu Razor&trade; is the new revolutionary solution for instant, painless, hair removal. With our bi-directional pivoting head, it's perfect for your most sensitive areas, underarms, ankles and knees. FLAWLESS Nu Razor&trade; has an 18-karat gold plated head. No soap, water or creams needed. It's also rechargeable so you can use it anywhere at anytime.<br>
						</p>
						<span class="sans-secondary-bold p u-pad--vert block">FEATURES &amp; BENEFITS:</span>
						<ul class="left-margin @x2-mar p  sans-secondary-book">
										<li>Bi-Directional, shaves up and down; pivoting head floats over curves</li>
										<li>18K gold-plated head is hypoallergenic</li>
										<li>Dermatologist approved - No nicks, cuts, bumps or irritation</li>
										<li>No soap, no water, no creams &ndash; shave anytime anywhere</li>
										<li>An LED light so you never miss a hair</li>
										<li>Comes with SensaGuard Cover for sensitive areas</li>
										<li>Rechargeable. Helps conserve water, eco-friendly</li>
						 </ul>
				<p class="top-margin @x2-mar">
					<a href="#faq" class="has-fancybox sans-secondary-bold p u-mar--vert" style="font-size: 22px;">FAQ</a>
				</p>
				<hr>


			<h2 class="product__title sans-secondary-bold uppercase">FLAWLESS Nu Razor&trade; Replacement Heads</h2>
			<p class="u-mar--vert sans-secondary-book p">We recommend replacing the heads of your FLAWLESS Nu Razor&trade; unit every 3-6 months. You get a replacement head and SensaGuard Cover!</p>
			<div class="col col__heads--legs">
					<div class="row">
							<div class="col">
									<img src="/images/products/replacement-heads--nurazor.png?appV=[#DtmContext.ApplicationVersion#]" alt="Replacement Heads">
							</div>
							<div class="col left-padding uppercase sans-secondary-bold">
									<h5>Price: $14.99</h5>
									<div class="c-brand top-margin">
											<div class="c-brand--form product__options">
													QTY<br>
													<select id="addon_NUREP">
															<option value="1">1</option>
															<option value="2">2</option>
													</select>
											</div>
									</div>
									<a href="#order" data-code="NUREP" data-select-id="addon_NUREP" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">add to cart</a>
<%--								<a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>--%>
							</div>
					</div>
			</div>


			<!-- <hr> -->

			<%
          var isFreeShip = DtmContext.ShoppingCart != null && DtmContext.ShoppingCart["ADAPTF"].Quantity > 0;
      %>

			<% if (false) { %>

			<h2 class="product__title sans-secondary-bold uppercase">FLAWLESS Adaptor</h2>
			<p class="u-mar--vert sans-secondary-book p">Simply plug in the USB cable and plug the adaptor into the wall.</p>
			<div class="col col__heads--legs">
					<div class="row">
							<div class="col">
									<img src="/images/products/adaptor--thumb.jpg?appV=[#DtmContext.ApplicationVersion#]" alt="FLAWLESS Adaptor">
							</div>
							<div class="col left-padding uppercase sans-secondary-bold">
									<h5>PRICE: $4.99 <span id="AdaptShipping" class="<%=isFreeShip ? "hide" : string.Empty %>">+ $2.99 P&amp;H</span><small style="color: #717171;font-weight: normal;text-transform: capitalize;font-size: 0.6em;line-height: 1;" class="block">(Free shipping if you spend $19.99)</small></h5>
									<div class="c-brand top-margin">
											<div class="c-brand--form product__options">
													QTY<br>
													<select id="addon_NUREP">
															<option value="1">1</option>
															<option value="2">2</option>
													</select>
											</div>
									</div>
									<a id="ADAPTBtn" href="#order" title="Add <%= flawlessAdaptor %> to your shopping cart" data-code="ADAPT" data-code-toggle="true" class="btn--product sans-primary-medium top-margin <%=isFreeShip ? " hide" : string.Empty %>">Add To Cart</a>
                  <a id="ADAPTFBtn" href="#order" title="Add <%= flawlessAdaptor %> to your shopping cart" data-code="ADAPTF" data-code-toggle="true" class="btn--product sans-primary-medium top-margin <%=isFreeShip ? string.Empty : " hide" %>">Add To Cart</a>
								<!--<a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>-->
							</div>
					</div>
			</div>
			<% } %>

			<div id="faq" class="hide ">
						<p class="bottom-margin sans-secondary-book p"><strong class="block sans-secondary-bold">Can I use Flawless&reg; Nu Razor&trade; while in the shower or bath?</strong>

					Flawless&reg; Nu Razor&trade; is designed to perform best as a Dry Shaver. While the unit is water-resistant, it should NEVER get wet or be submerged in water. It is not ideal to use while showering, or on damp or wet skin. Hair is best removed when dry. It comes with SensaGuard Cover for sensitive areas.</p>

				<hr>

						<p class="bottom-margin sans-secondary-book p"><strong class="block sans-secondary-bold"> When should I use the SensaGuard Cover on Flawless&reg; Nu Razor&trade;, and why? </strong>

						The SensaGuard Cover is designed for use when removing hair under the arm and in the bikini area. The guard helps block sensitive, delicate skin in these areas from coming into direct contact with Nu Razor's oscillating 18K gold-plated head. The head, with the SensaGuard Cover on, will effectively remove hair in these sensitive areas.</p>

				<hr>


						<p class="bottom-margin sans-secondary-book p"><strong class="block sans-secondary-bold"> How long does &ldquo;recharging&rdquo; take and how long with the &ldquo;charge&rdquo; last? </strong>

					Flawless&reg; Nu Razor&trade; is a rechargeable unit and takes up to 3-hours to fully charge. The charge will last 60 minutes at full power, with consistent use. NOTE: The unit won't operate while charging. If the unit begins to slow down, clean the head. If still slow, charge unit.</p>

				<hr>


						<p class="bottom-margin sans-secondary-book p"><strong class="block sans-secondary-bold"> Are &ldquo;dry shave&rdquo; results the same as a &ldquo;wet&rdquo; shave? </strong>

					With Flawless&reg; Nu Razor&trade; you can shave without the shower, or &ldquo;dry shave&rdquo; anywhere anytime. The results to the naked eye are the same. Legs will appear as clean shaved as with a wet razor. There is, however, a very slight difference in touch as a dry shave will leave a very teeny hair shaft left behind. Again, this is typically invisible to the naked eye, but hair shaft may be felt. Additionally, results typically improve with continued use. The convenience of a dry shave, with a visually clean smooth leg, no nicks, cuts, or irritation, is for most women a desirable alternative to the inconvenience of the wet shave.</p>

						 <hr>

						 <p class="bottom-margin sans-secondary-book p">
				ECO-FRIENDLY | WATERLESS<br>
				Flawless&reg; Nu Razor&trade; does not require water for use and helps save water consumption.<br>
				Flawless&reg; Nu Razor&trade; is fully rechargeable, keeping battery acids from leaching into land-fills.<br>
				Flawless&reg; Nu Razor&trade; is not disposable and is helping keep plastics and blade use to a minimum.
				</p>
								</div>
						<div class="bottom-padding @x3-pad">&nbsp;</div>
					</div>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/380096866?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial2">
	<iframe src="https://player.vimeo.com/video/447165219?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<!--<div class="hide" id="flawless-how--full">
	<iframe src="https://player.vimeo.com/video/379052230?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div> -->

<div class="hide" id="flawless-how2">
	<iframe src="https://player.vimeo.com/video/379052230?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<!--<div class="hide" id="flawless-how3">
	<iframe src="https://player.vimeo.com/video/379059764?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div> -->

</asp:Content>
