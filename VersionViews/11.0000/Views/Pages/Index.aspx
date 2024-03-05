<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var flawless = "Flawless&reg;";
    var NuRazor = "Flawless&reg; Nu Razor&trade;";
    var flawlessBrows = "FLAWLESS BROWS 24/7&trade;";
    var flawlessAdaptor = "Flawless Adaptor";
	var flawlessBrowsFull = "FLAWLESS BROWS 24/7&trade; BY FINISHING TOUCH FLAWLESS&reg;";
    var flawlessLegs = "Flawless&reg; Legs&reg;";
    var rechargeable = flawless + " Rechargeable";
    var contour = "Flawless&reg; Contour&trade;";
		var glo = flawless + " Dermaplane&trade; Glo";
		var fridge = flawless + " Beauty Fridge&trade;";
%>

    <div>
        <div class="hero no-padding relative">
						<!-- // hero -->

            <ul class="js-eflex--fade" data-eflex-delay="7000" data-eflex-slider-type="fade" data-eflex-nav="true">

								<li>
										<a href="NU<%= Model.Extension %>">
											<picture>
												<source media="(min-width: 701px)" srcset="/images/6.0000/glam-nurazor--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
												<source media="(max-width: 701px)" srcset="/images/6.0000/glam-nurazor--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
												<img src="/images/6.0000/glam--nurazor.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Nu Razor&trade;">
											</picture>
										</a>
									</li>

            	<li>
              <a href="FLAWLESS<%= Model.Extension %>"><picture>
						<source media="(min-width: 701px)" srcset="/images/9.0000/glam--face.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/9.0000/glam--face--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/9.0000/glam--face.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="The new gold standard in hair removal">
					</picture></a>
                </li>
                <li>
                        <a href="BROWS<%= Model.Extension %>"><picture>
						<source media="(min-width: 701px)" srcset="/images/5.0000/glam--brows.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/5.0000/glam-mobile--brows.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/5.0000/glam--brows.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Your new brow routine">
					</picture></a>
                </li>
                <li>
                        <a href="CONTOUR<%= Model.Extension %>"><picture>
						<source media="(min-width: 701px)" srcset="/images/5.0000/glam--contour.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<source media="(max-width: 701px)" srcset="/images/5.0000/glam-mobile--contour.jpg?appV=<%= DtmContext.ApplicationVersion %>">
						<img src="/images/5.0000/glam--contour.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> form head to toe">
					</picture></a>
								</li>

								<li>
									<a href="NFRIG<%= Model.Extension %>">
										<picture>
											<source media="(min-width: 701px)" srcset="/images/7.0000/glam-fridge.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<source media="(max-width: 701px)" srcset="/images/7.0000/glam-fridge--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<img src="/images/7.0000/glam-fridge.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= fridge %>">
										</picture>
									</a>
								</li>
                                <li>
									<a href="LEGS<%= Model.Extension %>">
										<picture>
											<source media="(min-width: 701px)" srcset="/images/7.0000/glam-legs.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<source media="(max-width: 701px)" srcset="/images/7.0000/glam-legs--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
											<img src="/images/7.0000/glam-legs.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawlessLegs %>">
										</picture>
									</a>
								</li>
						</ul>
        </div>
    </div>

    <div class="color-gray sans-secondary-book center-text center-margin u-pad--vert @x3-pad shipping--tagline">
        <h2 class="h2"><span class="color-pink--new sans-primary-ultra">FREE SHIPPING</span> on orders $19.99 and up!</h2>
        <h4 class="top-margin">We are shipping from the US with no disruptions!</h4>
    </div>

    <div id="order" class="products__top width-at-100 white-background u-pad--vert @x3-pad">
        <div class="l-outer__in center-margin c-brand">
            <h2 class="sans-secondary-book center-text uppercase color-gray fn--expand products__title">Flawless<sup>&reg;</sup> Top Selling Products
		</h2>
            <div class="options u-pad @x2-pad center-text c-brand--form no-margin">

                <!-- NuRazor -->
               <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="NU<%= Model.Extension %>" title="See details for <%= NuRazor %>" class="option__overlay">
                                <img src="/images/products/NuRazor.png" alt="<%= NuRazor %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Nu Razor&trade;</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium ">Price: $39.99</h5>
                            </div>

                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="NU<%= Model.Extension %>" title="See details for <%= NuRazor %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= NuRazor %> to your shopping cart" data-code="NU" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
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
	                      <div class="row row-to-center u-pad--vert center-margin">
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
                        <div class="row row-to-center u-pad--vert center-margin">
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

                                <!-- flawless -->
                <div class="option">
                        <div class="option__wrap">
                            <div class="relative center-margin option__img">
                                <a href="FLAWLESS<%= Model.Extension %>" title="See details for <%= flawless %>" class="option__overlay">
                                    <img src="/images/products/3.0000/flawless--color-home.png" alt="Flawless"></a>
                            </div>
                            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS<sup>&reg;</sup>
                        </h4>
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
                                </div>--%>
                                           <h5 class="color-gray sans-primary-medium ">Color:</h5>
                                <select data-select name="FLAWLESS" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                        <option value="">Select</option>
<%--                                        <option value="SEA">Seaglass</option>--%>
                                        <option value="BLUSH">Blush</option>
                                        <option value="LAVEN">Lavender</option>
                                        <option value="BLACK2">Black</option>
                                    </select>
                            </div>
                            <!-- end price row -->
                            <div class="row row-to-center center-margin u-pad--vert center-margin">
                                <div class="col right-padding">
                                    <a href="FLAWLESS<%= Model.Extension %>" title="See details for <%= flawless %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                </div>
                                <div class="col">
                                    <a href="#order" title="Add <%= flawless %> to your shopping cart" data-select data-group-name="FLAWLESS" data-code-toggle="true" data-code="BLUSH" class="btn--product h3 sans-primary-medium">Add To Cart</a>
                                    <%--<a href="#order" title="Add <%= flawless %> to your shopping cart" data-code-toggle="true" data-code="BLUSH" class="btn--product h3 sans-primary-medium">Add To Cart</a>--%>
                                </div>
                            </div>
                            <!-- end button row -->
                </div>
                                <!-- end option -->
                            </div>

								<!-- flawless fridge -->
								<div class="option">
											<div class="option__wrap">
													<div class="relative center-margin option__img">
															<a href="NFRIG<%= Model.Extension %>" title="See details for <%= fridge %>" class="option__overlay">
																	<img src="/images/products/fridge.jpg" alt="<%= fridge %>"></a>
													</div>
													<h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Beauty Fridge&trade;</h4>
													<hr>
													<div class="row row-to-center center-margin bottom-padding">
															<div class="col right-padding">
																	<h5 class="color-gray sans-primary-medium ">Price: $59.99</h5>
															</div>
													</div>
													<!-- end price row -->
													<div class="row row-to-center u-pad--vert center-margin">
															<div class="col right-padding">
																	<a href="NFRIG<%= Model.Extension %>" title="See details for <%= fridge %>" class="btn--product btn--learn h3 white-text">Learn More</a>
															</div>
															<div class="col">
																	<a href="#order" title="Add <%= fridge %> to your shopping cart" data-code="NFRIGFS" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
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
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Brows<sup>&reg;</sup></h4>
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


	              <!-- flawless legs -->
	              <div class="option">
	                  <div class="option__wrap">
	                      <div class="relative center-margin option__img">
	                          <a href="LEGS<%= Model.Extension %>" title="See details for <%= flawlessLegs %>" class="option__overlay">
	                              <img src="/images/products/3.0000/flawless-legs-home.png" alt="<%= flawlessLegs %>"></a>
	                      </div>
	                      <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Legs<sup>&reg</sup></h4>
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
	                      <div class="row row-to-center u-pad--vert center-margin">
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

    <div class="featured bg-secondary width-at-100">
        <h4 class="sans-secondary-book center-text uppercase color-gray fn--expand top-margin @x2-mar">FLAWLESS<sup>&reg;</sup> has been featured in</h5>
        <div class="img center-margin no-bkg" style="--aspect-ratio:79/890; --aspect-ratio-width: 890px" data-src-img="/images/5.0000/featured-major.png?appV=<%= DtmContext.ApplicationVersion %>" data-src-attr='{ "alt" : "Featured with all these brands" }'>
					<noscript>
						<img class="center-margin" src="/images/5.0000/featured-major.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Featured with all these brands">
					</noscript>
				</div>
    </div>
    <!-- end featured media -->

    <div class="hide">
        <% Html.RenderPartial("OrderFormReviewTable"); %>
    </div>

</asp:Content>
