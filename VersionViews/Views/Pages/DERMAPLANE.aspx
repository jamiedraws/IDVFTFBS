<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var dermaplane = productName + " Dermaplane&trade;";
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/3.0000/dermaplane-full.png" alt="Flawless&reg;" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/3.0000/dermaplane-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/dermaplane-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/dermaplane-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-how-to" class="no-right-m has-fancybox"><img src="/images/products/dermaplane-how-to.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold uppercase">FLAWLESS Dermaplane&trade;</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div><!-- end .product__review -->


		<!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->

		<div class="product__desc sans-secondary-book p">
			<p class="u-mar--vert">FLAWLESS Dermaplane&trade; exfoliates and removes facial hair to improve surface of skin, and enable flawless application of makeup and topical creams.<br>
			</p>
			<span class="sans-secondary-bold p">FEATURES &amp; BENEFITS:</span>
			<ul class="left-margin @x2-mar  bottom-padding @x3-pad p">
				<li>German Stainless Steel Blades include a ridged safety-guard designed to protect your skin</li>
				<li>Soft-grip handles for precision control</li>
				<li>Two long blades for larger areas and two smaller blades for more precision above the brow line and upper lip</li>
				<li>Instantly and painlessly exfoliates</li>
				<li>Helps skin appear healthier, brighter and have a smoother look and feel</li>
			</ul>
		</div>
	</div>
</div>
</div>

<div class="hide" id="flawless-how-to">
	<iframe src="https://player.vimeo.com/video/313883023?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
