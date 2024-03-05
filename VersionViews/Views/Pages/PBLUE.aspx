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
		<img id="gallery__main" src="/images/products/flawless-blue.png" alt="Flawless" class="gallery__main">
		<div class="gallery__thumbs">
			<a href="javascript:void(0);" class="no-left-m replace-image"><img src="/images/products/flawless-blue.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-blush.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Main product"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-blue-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt="In use shot"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/flawless-blue-3.png?appV=<%= DtmContext.ApplicationVersion %>" alt="In use shot"></a>
			<a href="#flawless-commercial" class="has-fancybox"><img src="/images/products/flawless-blue-commercial.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Watch the Commercial"></a>
			<!--<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--white.png?appV=<%= DtmContext.ApplicationVersion %>" alt="White"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--teal.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Teal"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--lavender.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Lavender"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/3.0000/flawless--pink.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Pink"></a>
			<a href="javascript:void(0);" class="replace-image"><img src="/images/products/14.0000/flawless--black.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Black"></a>-->
			<a href="#flawless-video" class="no-right-m has-fancybox"><img src="/images/products/flawless-blue-how-to-video.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="How To Video"></a>
		</div>
	</div>
	<div class="product">
		<h2 class="product__title sans-secondary-bold">Facial Hair Remover</h2>
        <span class="sans-secondary-bold block u-pad--vert">DON'T PUT ON YOUR MAKEUP WITHOUT IT&trade;</span>
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
		<div class="flex" id="dv_Replace">
                <div class="product__heads product__heads--main">
                    <h2 class="product__title sans-secondary-bold uppercase">Replacement Heads</h2>
                    <p class="bottom-margin @x3-mar"><span class="sans-secondary-bold">For best results,</span> we recommend replacing the heads of your Flawless&reg; every 3-4 months.</p>
                    <div class="col">
                        <%--<div class="row">
                            <div class="col col__heads--main">
                                <img src="/images/products/3.0000/replacement-heads.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Replacement Heads">
                            </div>
                            <div class="col col__heads--main left-padding uppercase sans-secondary-bold">
                                <h3>2 PACK</h3>
                                <h5>Price: $12.99</h5>
                                <small>SKU Number: 20101290</small>
                                <h3>&nbsp;</h3>
                                <h5>&nbsp;</h5>
                                <div class="c-brand top-margin">
                                    <div class="c-brand--form product__options">
                                        QTY<br>
                                        <select id="addon_R2">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- end form -->
                                <a href="#order" data-code="R219" data-select-id="addon_R2" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a> 
                                <!-- <a href="#order" class="btn--product sans-primary-medium top-margin btn--sold-out">SOLD OUT</a>-->
                                <small style="text-transform: none; display: block; line-height: 16px; font-size: 75%;">Single Halo - When looking at your Flawless unit, if you see a single halo (like in the image above) please select this head.</small>
                            </div>
                        </div>
                
                        <!-- end images and 2 pack text-->
                    </div>
            

                    <div class="col col__heads--main">
                        <hr class="vertical-rule">
                    </div>--%>
                   <div class="col col__heads--main">
                        <div class="row">
                            <div class="col">
                            <img src="/images/products/3.0000/replacement-heads-3_0.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Replacement Heads"></div>
                            <div class="col left-padding uppercase sans-secondary-bold">
                                <h3>2 PACK</h3>
                                <h5>Price: $12.99</h5>
                                <small>SKU Number: 20507234</small>
                                
                                <div class="c-brand top-margin">
                                    <div class="c-brand--form product__options">
                                        QTY<br>
                                        <select id="addon_RF30" >
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- end form -->
<%--                                <a href="#order" data-code="RF30" data-select-id="addon_RF30" data-code-toggle="true" class="btn--product sans-primary-medium top-margin">Add to Cart</a>--%>
                                <a href="#order" class="btn--product sans-primary-medium top-margin btn--sold-out">SOLD OUT</a> 
                                <small style="text-transform: none; display: block; line-height: 16px; font-size: 75%;">Double Halo - When looking at your Facial Hair Remover unit, if you see a double halo (like in the image above) please select this head.</small>
                          </div>
                        </div>
                        <!-- end images and 2 pack text-->
                    </div>
            
                <p class="top-margin @x3-mar"><span class="span sans-secondary-bold">IMPORTANT &ndash; To select your replacement heads, please match exactly by sliding your cursor over each. Replacement heads are not interchangeable, you must use the same one.</span></p>
            
                    <hr>


                    <!--END DESCRIPTION HTML-->
                </div>
            </div>
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
