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
		<img id="gallery__main" src="/images/products/PEDI-1.jpg" alt="Pedi" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/PEDI-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-pedi.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/pedi-full-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/pedi-full-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/pedi-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/pedi-animation-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Pedi</h2>
        
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>

        <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>

        <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

       <!--END DISCRIPTION HTML-->
		
            <hr>
			<h2 class="product__title sans-secondary-bold uppercase">Replacement Heads</h2>
			<p class="u-mar--vert sans-secondary-book p">
				We recommend replacing the heads of your Pedi unit every 3-6 months.
			</p>
			<div class="col col__heads--legs">
					<div class="row">
							<div class="col">
									<img src="/images/products/replacement-heads--pedi.png?appV=[#DtmContext.ApplicationVersion#]" alt="Replacement Heads">
							</div>
							<div class="col left-padding uppercase sans-secondary-bold">
									<h5>Price: $9.99</h5>
									<div class="c-brand top-margin">
											<div class="c-brand--form product__options">
													QTY<br>
													<select id="addon_PREP">
															<option value="1">1</option>
															<option value="2">2</option>
													</select>
											</div>
									</div>
									<a href="#order" data-code="PREP" data-select-id="addon_PREP" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">add to cart</a>
							</div>
					</div>
			</div>
	</div>
</div>
</div>

<!-- 257968597 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/497315726?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial"><!-- OG ID 572756240-->
	<iframe src="https://player.vimeo.com/video/694489889?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>


</asp:Content>
