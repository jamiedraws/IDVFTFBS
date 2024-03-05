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
                <img id="gallery__main" src="/images/products/SPA-1.jpg" alt="Cleanse Spa" class="gallery__main">
                <div class="gallery__thumbs">
                    <a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/SPA-1.jpg?appV= <%=DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa.jpg?appV= <%=DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-4.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-5.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-6.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="javascript:void(0);" class="replace-image"><img src="/images/products/cleanse-spa-7.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/cleanse-spa-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                    <a href="#flawless-how" class="no-right-m has-fancybox"><img src="/images/products/cleanse-spa-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
                </div>
            </div>
            <div class="product">
                <h2 class="product__title sans-secondary-bold">Cleanse Spa</h2>
                <div class="product__review">
                    <%= Html.Partial("GetInlineRatings") %>
                </div>
                <!-- end .product__review -->
                <%Html.RenderPartial("_Products", Model); %>
                <hr>
                <!--DESCRIPTION HTML -->
                <%var upsellText = Model.UpsellText; %>
                <%=upsellText %>
                <!--END DESCRIPTION HTML-->
            <hr>
			<h2 class="product__title sans-secondary-bold uppercase">Replacement Heads</h2>
			<p class="u-mar--vert sans-secondary-book p">We recommend replacing the heads of your Cleanse Spa unit every 3-6 months.</p>
			<div class="col col__heads--legs">
					<div class="row">
							<div class="col">
									<img src="/images/products/replacement-heads--cleanse-spa.png?appV=[#DtmContext.ApplicationVersion#]" alt="Replacement Heads">
							</div>
							<div class="col left-padding uppercase sans-secondary-bold">
									<h5>Price: $9.99</h5>
									<div class="c-brand top-margin">
											<div class="c-brand--form product__options">
													QTY<br>
													<select id="addon_CSREP">
															<option value="1">1</option>
															<option value="2">2</option>
													</select>
											</div>
									</div>
									<a href="#order" data-code="CSREP" data-select-id="addon_CSREP" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">add to cart</a>
							</div>
					</div>
			</div>
            </div>
        </div>
    </div>
    <div class="hide" id="flawless-commercial">
        <iframe src="https://player.vimeo.com/video/471439185?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>
    <div class="hide" id="flawless-how">
        <iframe src="https://player.vimeo.com/video/491720018?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>
</asp:Content>