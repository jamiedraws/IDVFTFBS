<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"] + " Pure Clean Mitts";
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<div class="gallery__main has-zoom">
            <img id="gallery__main" src="/images/products/mitt.jpg" alt="<%= productName %>">
        </div>
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/mitt.jpg" alt="<%= productName %>"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/mitt-box.jpg" alt="<%= productName %> Packaging"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/mitt-box-back.jpg" alt="<%= productName %> Packaging"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/mitt-celebrity-2.jpg" alt="<%= productName %> with Emma Roberts"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/mitt-showcase.jpg" alt="<%= productName %>"></a>
			<%-- <a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/flawless-blue-commercial.jpg" alt="Watch the Commercial"></a> --%>
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/mitt-video.jpg" alt="How To Video"></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Pure Clean Mitts (7 Mitts)</h2>
        <span class="sans-secondary-bold block u-pad--vert">DON'T PUT ON YOUR MAKEUP WITHOUT IT</span>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
        <!-- end .product__review -->


        <%Html.RenderPartial("_Products", Model); %>

        <!-- end .product__review -->

		<hr>
         <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

		<div class="flex">
			<div class="product">
				<h2 class="product__title sans-secondary-bold uppercase">Face Be Clean Bundle</h2>
					<div class="row u-mar--vert">
						<div class="col">
						<img src="/images/products/BUNMITTS--small.jpg" alt="Face Be Clean Bundle" width="200" height="200"></div>
						<div class="col left-padding sans-secondary-bold">
							<h5 class="uppercase">Price: $52 (Save 13%)</h5>
							
							<div class="c-brand top-margin">
								<div class="c-brand--form product__options">
									QTY<br>
									<select id="addon_BUNMITTS" >
										<option value="1">1</option>
										<option value="2">2</option>
									</select>
								</div>
							</div>
							<!-- end form -->
                                <a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNMITTS" data-select-id="addon_BUNMITTS" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>
					  </div>
				</div>
			

				<!--END DESCRIPTION HTML-->
			</div>
		</div>

        </div>
	</div>
</div>
</div>


<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/718489220?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<%-- do not remove extra div unless needed, for some reason IE11 doesn't close off this page and all following sections do not span full width --%>
</div>

</asp:Content>
