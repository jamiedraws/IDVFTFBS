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
		<img id="gallery__main" src="/images/products/BUNCLSE.jpg" alt="Texture + Tone Bundle" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/BUNCLSE.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Texture + Tone Bundle"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-cleanse.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Cleanse"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/dermaplane-glo.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-steamer.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Facial Steamer"></a>
			<!--<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/face-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Watch the Commercial"></a>
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/face-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="How To Video"></a>-->
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Texture + Tone Bundle</h2>
        <span class="sans-secondary-bold block u-pad--vert">Includes: Cleanse + Flawless Derma GLO&trade; Lighted Facial Exfoliator + Facial Steamer</span>
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

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- 207160876 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/289088755?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/489581708?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
