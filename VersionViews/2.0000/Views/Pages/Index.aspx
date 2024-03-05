<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="bg-tertiary">
	<div class="hero l-outer__in no-padding relative">
		<!-- // hero -->
		<picture>
			<source media="(min-width: 701px)" srcset="/images/2.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>">
			<source media="(max-width: 701px)" srcset="/images/2.0000/banner__main--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
			<img src="/images/2.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless form head to toe">
		</picture>
		<!--<a href="#order" target="_blank" class="btn button animate btn--shop h3 sans-secondary-bold">SHOP NOW</a>-->
	</div>
</div>

<div class="black-background white-text center-text u-pad--vert @x2-pad">
	<h2 class="uppercase fn--expanded sans-secondary-bold h2">Free Shipping on Orders $19.99 and Up!</h2>
</div>

<div class="white-background featured width-at-100">
	<ul class="js-eflex--fade center-margin">
		<li>
			<picture>
				<source media="(min-width: 701px)" srcset="/images/2.0000/featured--large-1.jpg?appV=<%= DtmContext.ApplicationVersion %>">
				<img src="/images/2.0000/featured--med-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
			</picture>
		</li>
		<li>
			<picture>
				<source media="(min-width: 701px)" srcset="/images/2.0000/featured--large-2.jpg?appV=<%= DtmContext.ApplicationVersion %>">
				<img src="/images/2.0000/featured--med-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
			</picture>
		</li>
		<li>
			<picture>
				<source media="(min-width: 701px)" srcset="/images/2.0000/featured--large-3.jpg?appV=<%= DtmContext.ApplicationVersion %>">
				<img src="/images/2.0000/featured--med-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
			</picture>
		</li>
	</ul>
</div><!-- end featured media -->

<div class="products__top width-at-100 white-background u-pad--vert @x3-pad">
	<div class="l-outer__in center-margin">
		<h2 class="sans-secondary-semibold center-text uppercase color-gray u-pad--vert @x2-pad fn--expand">
			Flawless<sup>&reg;</sup> Top Selling Products
		</h2>
		<div class="flex flex--between u-pad @x2-pad center-text">

			<div class="option">
				<div class="relative center-margin">
					<a href="BROWS<%= Model.Extension %>" class="option__overlay"><img src="/images/products/flawless-brows.png" alt="Flawless Brows"></a>
				</div>
				<div class="hearts">
					<img src="/images/2.0000/hearts.png" alt="5 Star Review" class="center-margin">
				</div>
				<h4 class="color-gray sans-secondary-semibold uppercase top-padding">
					Flawless Brows&trade;<br>
					<span class="color-tertiary h5">$19.99</span>
				</h4>
				<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
			</div><!-- end option -->

			<div class="option">
				<div class="relative center-margin">
					<a href="LEGS<%= Model.Extension %>" class="option__overlay"><img src="/images/products/flawless-legs.png" alt="Flawless Legs"></a>
				</div>
				<div class="hearts">
					<img src="/images/2.0000/hearts.png" alt="5 Star Review" class="center-margin">
				</div>
				<h4 class="color-gray sans-secondary-semibold uppercase top-padding">
					Flawless Legs&trade;<br>
					<span class="color-tertiary h5">$59.98</span>
				</h4>
				<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
			</div><!-- end option -->

			<div class="option">
				<div class="relative center-margin">
					<a href="FLAWLESS<%= Model.Extension %>" class="option__overlay"><img src="/images/products/flawless.png" alt="Flawless"></a>
				</div>
				<div class="hearts">
					<img src="/images/2.0000/hearts.png" alt="5 Star Review" class="center-margin">
				</div>
				<h4 class="color-gray sans-secondary-semibold uppercase top-padding">
					Flawless&trade;<br>
					<span class="color-tertiary h5">$19.99</span>
				</h4>
				<a href="#order" class="btn--order sans-secondary-bold h3">Order Now</a>
			</div><!-- end option -->

		</div>
	</div>
</div><!-- end top products -->

</asp:Content>
