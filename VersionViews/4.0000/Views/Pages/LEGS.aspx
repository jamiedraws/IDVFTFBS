<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="l-outer__in center-margin u-pad--vert @x3-pad">
<div class="flex">
	<div class="gallery">
		<img id="gallery__main" src="/images/products/legs-full.png" alt="Flawless&reg;" class="gallery__main">
		<div class="gallery__thumbs">
				<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/legs-full.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/legs-full-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="javascript:void(0);" class="replace-image"><img src="/images/products/legs-full-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/legs-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
				<a href="#flawless-video" class="has-fancybox no-right-m"><img src="/images/products/legs-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt=""></a>
			</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">FINISHING TOUCH&reg; FLAWLESS&reg; LEGS&reg;</h2>
		<div class="product__review">
			<div class="hearts">
				<img class="no-margin" src="/images/2.0000/hearts.png" alt="5 Star Review" class="no-margin">
			</div>
		</div>
           <!-- end .product__review -->

        <%Html.RenderPartial("_Products", Model); %>

        <!-- end product__options -->
		<hr>
		<!--DESCRIPTION HTML -->

        <%var upsellText = Model.UpsellText; %>
        <%=upsellText %>

       <!--END DISCRIPTION HTML-->
	</div>
</div>
</div>

<!-- 279323546 -->
<div class="hide" id="flawless-video">
	<iframe src="https://player.vimeo.com/video/289089064?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

<div class="hide" id="flawless-commercial">
	<iframe src="https://player.vimeo.com/video/356446139?title=0&byline=0&portrait=0" width="450" height="254" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

</asp:Content>
