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
		<img id="gallery__main" src="/images/products/STEAM-1.jpg" alt="Facial Steamer" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/STEAM-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-steamer.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-steamer-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="In use shot"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-steamer-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Box shot"></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Facial Steamer</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings", new ViewDataDictionary { { "ProductCode", "STEAMER" } }) %>
		</div>
        <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>
<%--		<div id="product-grid" class="pedi-idvftfbs">
			<h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $49.88
			</h4>
			<div class="product__options top-margin sans-primary-medium h7">
				<a href="https://www.walmart.com/ip/Finishing-Touch-Flawless-Facial-Steamer/340717004" class="btn--product sans-primary-medium top-margin" target="_blank">Buy Now</a>
			</div>
		</div>--%>

        <!-- end .product__review -->

		<hr>
         <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

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
                            <a href="#order" data-code="MITT" data-select-id="addon_MITT" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>
					  </div>
				</div>
			</div>
		</div>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

</asp:Content>
