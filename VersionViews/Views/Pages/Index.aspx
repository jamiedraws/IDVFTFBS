<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var flawless = "Flawless&reg;";
    var flawlessBody = "Flawless&reg; Body&trade;";
    var flawlessBrows = "Flawless&reg; Brows&reg;";
    var flawlessLegs = "Flawless&reg; Legs&reg;";
    var dermaplane = "Flawless&reg; Dermaplane&trade;";
    var rechargeable = flawless + " Rechargeable";
    var contour = "Flawless&reg; Contour&trade;";
    var glo = flawless + " Dermaplane&trade; Glo";
%>

    <div>
        <div class="hero no-padding relative">
						<!-- // hero -->

            <ul class="js-eflex--fade" data-eflex-delay="7000" data-eflex-slider-type="fade" data-eflex-nav="true">
            	<li>
                        <a href="#order"><picture>
						<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-4.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-4.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/3.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> form head to toe">
					</picture></a>
                </li>
                <li>
                        <a href="#order"><picture>
						<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-1.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-1.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/3.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> form head to toe">
					</picture></a>
                </li>
                <li>
                        <a href="#order"><picture>
						<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-2.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-2.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/3.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> form head to toe">
					</picture></a>
                </li>
                <li>
                        <a href="#order"><picture>
						<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-3.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-3.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/3.0000/banner__main.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> form head to toe">
					</picture></a>
                </li>
                <li>
                	<a href="#order">
	                	<picture>
											<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-5.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-5.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<img src="/images/3.0000/banner__main-5.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawlessBody %> form head to toe">
										</picture>
									</a>
                </li>
                <li>
                	<a href="#order">
	                	<picture>
											<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-6.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-6.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<img src="/images/3.0000/banner__main-6.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= glo %>">
										</picture>
									</a>
                </li>
                <li>
                	<a href="#order">
	                	<picture>
											<source media="(min-width: 701px)" srcset="/images/3.0000/banner__main-7.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<source media="(max-width: 701px)" srcset="/images/3.0000/banner__main--mobile-7.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<img src="/images/3.0000/banner__main-7.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= contour %>">
										</picture>
									</a>
                </li>
						</ul>
        </div>
    </div>

    <div class="bg-secondary color-gray center-text u-pad--vert @x2-pad">
        <h2 class="uppercase fn--expanded sans-secondary-bold h2">Free Shipping on Orders $19.99 and Up!</h2>
    </div>

    <div id="order" class="products__top width-at-100 white-background u-pad--vert @x3-pad">
        <div class="l-outer__in center-margin c-brand">
            <h2 class="sans-secondary-semibold center-text uppercase color-gray fn--expand products__title"><%= flawless %> Top Selling Products
		</h2>
            <div class="options u-pad @x2-pad center-text c-brand--form no-margin">

                <!-- flawless body -->
                 <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="BODY<%= Model.Extension %>" title="See details for <%= flawlessBody %>" class="option__overlay">
                                <img src="/images/products/3.0000/flawless-body.png" alt="<%= flawlessBody %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad"><%= flawlessBody %>
					</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium ">Price: $29.99</h5>
                            </div>

                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="BODY<%= Model.Extension %>" title="See details for <%= flawlessBody %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= flawlessBody %> to your shopping cart" data-code="BOD" data-match="BODBON" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                                <%--<a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>--%>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->

                <!-- flawless brows -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="BROWS<%= Model.Extension %>" title="See details for <%= flawlessBrows %>" class="option__overlay">
                                <img src="/images/products/3.0000/flawless-brows-home.png" alt="<%= flawlessBrows %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Brows&trade;</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium ">Price: $19.99</h5>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="BROWS<%= Model.Extension %>" title="See details for <%= flawlessBrows %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= flawlessBrows %> to your shopping cart" data-code="BROW" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->

                 <!-- flawless contour  -->
                    <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="CONTOUR<%= Model.Extension %>" title="See details for <%= contour %>" class="option__overlay">
                                    <img src="/images/products/contour.jpg" alt="<%= contour %>"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Contour&trade;</h4>
                            <hr>
                            <div class="row row-to-center center-margin bottom-padding">
                                <div class="col right-padding">
                                    <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                                </div>
                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center u-mar--vert center-margin">
                                <div class="col right-padding">
                                    <a href="CONTOUR<%= Model.Extension %>" title="See details for <%= contour %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= contour %> to your shopping cart" data-code="CONTOUR" data-select-id="CONTOUR" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                                </div>
                            </div>
                            <!-- end button row -->
                        </div>
                    </div>
                    <!-- end option -->

                 <!-- flawless dermaplane glo  -->
                    <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="GLO<%= Model.Extension %>" title="See details for <%= glo %>" class="option__overlay">
                                    <img src="/images/products/dermaplane-glo.png" alt="<%= glo %>"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Dermaplane GLO&trade;</h4>
                            <hr>
                            <div class="row row-to-center center-margin bottom-padding">
                                <div class="col right-padding">
                                    <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                                </div>
                                <div class="col">
                                    <select id="GLO">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center u-mar--vert center-margin">
                                <div class="col right-padding">
                                    <a href="GLO<%= Model.Extension %>" title="See details for <%= glo %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= glo %> to your shopping cart" data-code="GLO" data-select-id="GLO" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                                </div>
                            </div>
                            <!-- end button row -->
                        </div>
                    </div>
                    <!-- end option -->

                <!-- flawless dermaplane -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="DERMAPLANE<%= Model.Extension %>" title="See details for <%= dermaplane %>" class="option__overlay">
                                <img src="/images/products/3.0000/dermaplane-full.png" alt="<%= dermaplane %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Dermaplane&trade;</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium ">Price: $9.99</h5>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="DERMAPLANE<%= Model.Extension %>" title="See details for <%= dermaplane %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= dermaplane %> to your shopping cart" data-code="DERMA" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->

                <!-- flawless -->
                <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="FLAWLESS<%= Model.Extension %>" title="See details for <%= flawless %>" class="option__overlay">
                                    <img src="/images/products/3.0000/flawless--color-home.png" alt="Flawless"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS<sup>&reg;</sup></h4>
                            <hr>
                            <div class="row row-to-center center-margin bottom-padding">
                                <div class="col right-padding">
                                    <h5 class="color-gray sans-primary-medium ">Price: $19.99</h5>
                                </div>
                                <%--<div class="col">
                                    <select id="FLAWLESS_QTY">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </div>
                                           <h5 class="color-gray sans-primary-medium ">Color:</h5>            <div class="col">
                                    <select data-select name="FLAWLESS" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                        <option value="">Select</option>
                                        <option value="SEA">Seaglass</option>
                                        <option value="WHITE">White</option>
                                        <option value="BLUSH">Blush</option>
                                        <option value="LAVEN">Lavender</option>

                                    </select>
                                </div>--%>
                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center center-margin u-pad--vert center-margin">
                                <div class="col right-padding">
                                    <a href="FLAWLESS<%= Model.Extension %>" title="See details for <%= flawless %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= flawless %> to your shopping cart" data-code-toggle="true" data-code="BLUSH" class="btn--product h3 sans-primary-medium">Add To Cart</a>
                                </div>
                            </div>
                            <!-- end button row -->
                        </div>
                    </div>
                    <!-- end option -->

                    <!-- flawless face rechargable -->
<%--                    <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="RECHARGEABLE<%= Model.Extension %>" title="See details for <%= rechargeable %>" class="option__overlay">
                                    <img src="/images/products/3.0000/flawless-home.png" alt="Flawless"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Rechargeable</h4>
                            <hr>
                            <div class="row row-to-center center-margin bottom-padding">
                                <div class="col right-padding">
                                    <h5 class="color-gray sans-primary-medium">Price: $29.98</h5>
                                </div>

                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center u-pad--vert center-margin">
                                <div class="col right-padding">
                                    <a href="RECHARGEABLE<%= Model.Extension %>" title="See details for <%= rechargeable %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= rechargeable %> to your shopping cart" data-code="WHITERECH" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                                </div>
                            </div>
                            <!-- end button row -->
                        </div>
                    </div>--%>
                    <!-- end option -->

                    <!-- flawless legs -->
                    <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="LEGS<%= Model.Extension %>" title="See details for <%= flawlessLegs %>" class="option__overlay">
                                    <img src="/images/products/3.0000/flawless-legs-home.png" alt="<%= flawlessLegs %>"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Legs<sup>&reg;</sup></h4>
                            <hr>
                            <div class="row row-to-center center-margin bottom-padding">
                                <div class="col right-padding">
                                    <h5 class="color-gray sans-primary-medium">Price: $59.98</h5>
                                </div>
                                <div class="col">
                                    <select id="LEGS">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center u-mar--vert center-margin">
                                <div class="col right-padding">
                                    <a href="LEGS<%= Model.Extension %>" title="See details for <%= flawlessLegs %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= flawlessLegs %> to your shopping cart" data-code="LEG" data-select-id="LEGS" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                                </div>
                            </div>
                            <!-- end button row -->
                        </div>
                    </div>
                    <!-- end option -->

            </div>
        </div>
    </div>
    <!-- end top products -->

    <div class="white-background featured width-at-100">
        <h5 class="sans-secondary-semibold center-text uppercase color-gray fn--expand top-margin @x2-mar">As Featured In</h5>
        <!--<picture>
            <source media="(min-width: 701px)" srcset="/images/3.0000/featured-major.png?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/3.0000/featured-major--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
        </picture>-->
        <img src="/images/3.0000/featured-major.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
    </div>
    <!-- end featured media -->

    <div class="hide">
        <% Html.RenderPartial("OrderFormReviewTable"); %>
    </div>

</asp:Content>
