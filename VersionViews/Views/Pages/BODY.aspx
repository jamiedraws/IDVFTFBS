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
		<img id="gallery__main" src="/images/products/3.0000/flawless-body.png" alt="Flawless&reg;" class="gallery__main">
		<div class="gallery__thumbs">
			<!--<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/body--new.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>-->
			<a href="javascript:void(0);" class="no-left-m replace-image""><img src="/images/products/3.0000/flawless-body.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/body-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<!--<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/body-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>-->
			<!--<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/body-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>-->
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/body-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#flawless-how" class="no-right-m has-fancybox"><img src="/images/products/body-how-to.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold uppercase">Flawless<sup>&reg;</sup> Body<sup>&trade;</sup></h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div>
        <!-- end .product__review -->


        <%Html.RenderPartial("_Products", Model); %>


<%--        <h4 class="product__price u-pad--vert h5 sans-primary-medium">PRICE: $29.99</h4>
		<div class="product__options top-margin sans-primary-medium h7">
			<a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>
		</div>--%>

        <!-- end .product__review -->

		<hr>
         <!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/315242875?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-how">
	<iframe src="https://player.vimeo.com/video/314107625?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
