<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var flawless = "Flawless&reg;";
	var flawlessBody = "Flawless&reg; Body&trade;";
	var flawlessBrows = "Flawless&reg; Brows&reg;";
	var flawlessLegs = "Flawless&reg; Legs&reg;";
	var flawlessFace = flawless + "";
	var flawlessDermaplane = "Flawless&reg; Dermaplane&trade;";
	var glo = "Flawless&reg; Dermaplane&trade; Glo";
	var contour = "Finishing Touch&reg; Flawless&reg; Contour&trade;";
	var flawlessFaceRecharge = flawlessFace + " Rechargeable";
%>

	<input id="main-menu-checkbox" type="checkbox" hidden>

	<header class="l-header @dv-o-shadow--out bg-primary @print-only-hide">

		<div class="center-text header__tagline">
			<div class="center-margin no-background l-outer__in u-pad--vert">
				<div class="flex flex--between flex--center--vert width-at-100">
					<div class="flex-start--left mobile-center">
						<h6 class="sans-secondary-bold uppercase fn--expanded h4">#1 Brand in women's hair removal</h6>
					</div>
					<div class="flex-start--right h4 mobile-hide">
						<% Html.RenderPartial("Social", Model); %>
					</div>
				</div>
			</div>
		</div><!-- end tagline -->

		<div class="bg-primary header--first center-text u-pad--bottom mobile-no-padding">
			<div class="l-outer__in no-padding relative center-margin no-background">
				<div class="flex flex--center--vert flex--between">
					<div class="header__logo flex-start--left">
						<a href="Index<%= Model.Extension %>" class="header__logo__a" data-modal-close title="<%= productName %>"><img src="/images/3.0000/logo--pink.png?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= productName %>"></a>
					</div>

                    <% if ( DtmContext.Page.IsStartPageType ) { Html.RenderPartial("Search", Model); } %>
				</div><!-- end flex -->
			</div>
		</div><!-- end logo header section -->

		<% if (DtmContext.PageCode != "HowTo" &&  DtmContext.Page.IsStartPageType) { %>

		<style>
			.l-header__nav--mobile {
				display: flex;
				align-items: center;
				justify-content: space-between;
			}

			.l-header__nav--mobile .cart-icon {
				filter: invert(100%);
				padding-left: 0.75rem;
			}

			.l-header__nav--mobile .cart-btn {
				display: flex;
				align-items: center;
				text-decoration: none;
				margin-right: 1rem;
			}

			.l-header__nav--mobile .cartTotalQty {
				font-size: 6vw;
			}

			@media all and ( max-width : 700px ) {
				.search-sub,
				#textS {
					flex: 1;
				}

				.search-sub {
					margin-bottom: -1rem;
				}

				.dtm .has-search-icon input {
					height: auto;
					padding-top: 13px;
				}

				.has-search-icon::after {
					width: 6vw;
					height: 6vw;
					top: 0;
					bottom: 0;
					margin: auto;
				}
			}

			.dtm--index .index-hide {
				display: none !important;
			}

			.dtm--sub .sub-hide {
				display: none !important;
			}

			@media all and ( min-width : 701px ) {
				.l-header__nav--mobile {
					display: none;
				}
			}
		</style>
		<div class="l-header__nav--mobile">
			<label for="main-menu-checkbox" class="menu-toggle">
				<span class="sr-only">Open main menu</span>
				<span class="hamburger h2" aria-hidden="true">
					<svg version="1.1" id="Untitled-2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="18px" height="12px" viewBox="0 0 18 12" enable-background="new 0 0 18 12" xml:space="preserve">
						<path fill="none" d="z"></path>
						<g id="Layer_x25_201">
							<rect width="18" height="2" fill="white"></rect>
							<rect y="5" width="18" height="2" fill="white"></rect>
							<rect y="10" width="18" height="2" fill="white"></rect>
						</g>
						<path fill="none" d="z"></path>
					</svg>
				</span>
				<h1 class="menu-title sans-secondary-bold uppercase h2">menu</h1>
			</label><!-- mobile menu checkbox -->
			<a href="ShoppingCart<%= DtmContext.ApplicationExtension %>#review" title="View your shopping cart" class="cart-btn">
				<span class="cartTotalQty"></span>
				<img src="/images/icon-cart.png?appV=<%= DtmContext.ApplicationVersion %>" class="cart-icon u-mar--center" alt="Shopping Cart">
			</a>
		</div>

		<!-- // nav -->

		<div class="l-header__nav white-background o-shadow--out">
			<div class="@sm-fn--xl l-header__in center-text">
				<!-- nav flex flex--around column-block -->
				<nav id="main-menu" role="navigation" class="main-menu sans-secondary-bold h4 black-text" aria-expanded="false" aria-label="Main menu">
					<label for="main-menu-checkbox" class="menu-close">
						<span class="sr-only">Close main menu</span>
						<span class="menu-close" aria-hidden="true">X</span>
					</label>
					<ul>
						<li class="nav__link--sub">
							<a href="javascript:void(0);" title="<%= productName %> Products" class="nav__link"><%= flawless %> Products</a>
							<ul class="nav__sub hide">
								<% var productTitleAttrPrefix = "Check out "; %>
								<li><a href="BODY<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessBody %>" class="nav__link"><%= flawlessBody %></a></li>
								<li><a href="BROWS<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessBrows %>" class="nav__link"><%= flawlessBrows %></a></li>
								<li><a href="CONTOUR<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= contour %>" class="nav__link">Flawless&reg; Contour&trade;</a></li>
								<li><a href="DERMAPLANE<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessDermaplane %>" class="nav__link"><%= flawlessDermaplane %></a></li>
								<li><a href="GLO<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= glo %>" class="nav__link"><%= glo %></a></li>
								<li><a href="FLAWLESS<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessFace %>" class="nav__link"><%= flawlessFace %></a></li>
								<%--<li><a href="RECHARGEABLE<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessFaceRecharge %>" class="nav__link"><%= flawlessFaceRecharge %></a></li>--%>
								<li><a href="LEGS<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawlessLegs %>" class="nav__link"><%= flawlessLegs %></a></li>
								<li><a href="REPLACEMENT<%= Model.Extension %>" title="<%= productTitleAttrPrefix %><%= flawless %> Replacement Heads" class="nav__link"><%= flawless %> Replacement Heads</a></li>
							</ul>
						</li>
						<li class="nav__link--sub">
							<a href="javascript:void(0);" title="<%= productName %> Videos" class="nav__link">Videos</a>
							<ul class="nav__sub hide">
								<li><a href="videos<%= Model.Extension %>" title="Watch all of the <%= productName %> Videos" class="nav__link">All Videos</a></li>
								<li><a href="HowTo<%= Model.Extension %>" title="Watch How To <%= productName %> Videos" class="nav__link">How To Videos</a></li>
							</ul>
						</li>
						<li class="sub-hide">
							<a href="#story" title="<%= productTitleAttrPrefix %> <%= productName %>" class="nav__link">Our Story</a>
						</li>
						<li class="index-hide">
								<a href="Index#story" title="<%= productTitleAttrPrefix %> <%= productName %>" class="nav__link">Our Story</a>
							</li>
						<li>
							<a href="ProductRegistration<%= Model.Extension %>" title="<%= productName %> Product Registration" class="nav__link">Product Registration</a>
						</li>
						<li class="nav__link--cart">
							<a href="ShoppingCart<%= Model.Extension %>#review">
							<span class="cartTotalQty"></span><span class="mv-hidden">&nbsp;&nbsp;</span>
							<img src="/images/icon-cart.png?appV=<%= DtmContext.ApplicationVersion %>" class="cart-icon mv-hidden" alt="Shopping Cart">
							<span class="mv-show hide">VIEW SHOPPING CART</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<label for="main-menu-checkbox" class="backdrop" tabindex="-1" aria-hidden="true" hidden></label>

		 <% } %>

	</header>
