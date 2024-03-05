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
		<img id="gallery__main" src="/images/products/CLEANSE-1.jpg" alt="Cleanse" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image""><img src="/images/products/CLEANSE-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image""><img src="/images/products/flawless-cleanse.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-4.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-5.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-6.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse-7.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/flawless-cleanse-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-how" class="no-right-m has-fancybox"><img src="/images/products/flawless-cleanse-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Cleanse</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
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
						Cleanse with its silicone head is an ultra-hygienic cleanser and massager that promotes the appearance of radiant, clean, more youthful skin. Cleanse has 4 modes, gentle cleansing, pulsating, massage, and deep cleanse for the ultimate facial cleaning experience.<br>
					</p>
					<span class="sans-secondary-bold p u-pad--vert block">FEATURES &amp; BENEFITS:</span>
					<ul class="left-margin @x2-mar p  sans-secondary-book">
						<li>Ultra-hygienic silicone head</li>
						<li>Cleans and massages</li>
						<li>Increases circulation to help promote collagen production</li>
                        <li>Dermatologist approved</li>
						<li>Fully waterproof &ndash; perfect for the shower</li>
						<li>Rechargeable Battery</li>
					</ul>


				</div>

				<div class="flex">
					<div class="product">
						<h2 class="product__title sans-secondary-bold uppercase">Pure Clean Mitts (7 Mitts)</h2>
							<div class="row u-mar--vert">
								<div class="col">
								<img src="/images/products/mitt--small.jpg" alt="Pure Clean Mitts" width="200" height="200"></div>
								<div class="col left-padding sans-secondary-bold">
									<h5 class="uppercase">Price: $19.99</h5>
									
									<div class="c-brand top-margin">
										<div class="c-brand--form product__options">
											QTY<br>
											<select id="addon_MITT" >
												<option value="1">1</option>
												<option value="2">2</option>
											</select>
										</div>
									</div>
									<a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="MITT" data-select-id="addon_MITT" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>
							  </div>
						</div>
					</div>
				</div>

			 <!--END DESCRIPTION HTML-->
	</div>
</div>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/566124744?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-how">
	<iframe src="https://player.vimeo.com/video/456315086?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>



</asp:Content>
