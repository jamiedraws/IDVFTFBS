<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/ICE-1.jpg" alt="Ice Roller" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/ICE-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/flawless-ice.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-ice-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-ice-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-ice-4.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-ice-5.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Ice Roller</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
				<!-- end .product__review -->


				<%Html.RenderPartial("_Products", Model); %>

				<!-- end .product__review -->
		<hr>
				 <!--DESCRIPTION HTML -->

				 <div class="product__desc sans-secondary-book p">

					<p class="u-mar--vert">
						The Ice Roller is a beauty device that combines two timeless beauty techniques; rolling massage and ice therapy. The Flawless Ice Roller provides an at-home spa experience that will leave your skin feeling refreshed, glowing and beautiful.
					</p>

					<span class="sans-secondary-bold p u-pad--vert block">KEY FEATURES:</span>

					<span class="sans-secondary-bold p u-pad--vert block">Includes:</span>
					<ul class="left-margin @x2-mar p  sans-secondary-book">
						<li>Beautifully constructed, lightweight and ergonomic grip handle allows for a firm hold while rolling the face and neck</li>
						<li>Gel rolling head that when frozen, can be used to reduce puffiness, irritation, and redness on the skin</li>
					</ul>

					<span class="sans-secondary-bold p u-pad--vert block">Benefits of Facial Massage</span>
					<ul class="left-margin @x2-mar p  sans-secondary-book">
						<li>Use in the morning to help wake up and tighten skin before makeup application</li>
						<li>Use at the end of your nighttime skincare routine can lead to better absorption of serums and moisturizers by locking it into the pores and pulling them deeper into the skin</li>
						<li>To massage and help to reduce inflammation on other areas of the body that may be experiencing angry skin or puffiness</li>
					</ul>


				</div>

			 <!--END DESCRIPTION HTML-->
	</div>
</div>
</div>

<!--<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/457054108?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>-->


</asp:Content>
