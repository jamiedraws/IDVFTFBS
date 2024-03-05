<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var dermaplane = "Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator";
%>

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery gallery--glo">
		<img id="gallery__main" src="/images/products/dermaplane-glo.png" alt="Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/dermaplane-glo.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/glo-use-1.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/glo-use-2.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/glo-use-3.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#glo-commercial" class="has-fancybox"><img src="/images/products/3.0000/glo-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#before-after" class="has-fancybox"><img src="/images/products/3.0000/glo-before-after.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#medical-video" class="has-fancybox"><img src="/images/3.0000/glo-medical.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			<a href="#how" class="has-fancybox"><img src="/images/3.0000/glo-how.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator</h2>
		<div class="product__review">
			<%= Html.Partial("GetInlineRatings") %>
		</div><!-- end .product__review -->


		<!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->

		<div class="product__desc sans-secondary-book p">
			<p class="u-mar--vert">Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator instantly reveals smoother, more radiant, younger-looking skin.<br>
			</p>
			<span class="sans-secondary-bold p">FEATURES &amp; BENEFITS:</span>
			<ul class="left-margin @x2-mar  bottom-padding @x3-pad p">
				<li>Exfoliates dry, dead skin and removes peach fuzz</li>
				<li>Professional-style dermaplaning in your own home</li>
				<li>Instantly reveals smoother, more radiant, younger-looking skin</li>
				<li>Elegant contour design with professional-grade Japanese stainless steel blade</li>
				<li>Specially designed safety guard helps prevent nicks and cuts</li>
				<li>Built-in LED light &mdash; never miss a spot</li>
				<li>Includes 6 replacement heads</li>
			</ul>
			<%--AdditionalItems--%>
			<%var upsellText = Model.UpsellText; %>
			<%=upsellText %>
			<p>Use a Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator Head for each use. <br>Be sure to space treatments every 2 to 4 weeks apart.</p>
		</div>
	</div>
</div>
</div>

<div class="hide" id="glo-commercial">
	<iframe src="https://player.vimeo.com/video/348467474?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>
<div class="hide" id="before-after">
	<iframe src="https://player.vimeo.com/video/342073402?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>
<div class="hide" id="how">
	<iframe src="https://player.vimeo.com/video/349136734?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>
<div class="hide" id="medical-video">
	<iframe src="https://player.vimeo.com/video/356457855?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>



</asp:Content>
