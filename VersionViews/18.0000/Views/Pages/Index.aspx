<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var productName = SettingsManager.ContextSettings["Label.ProductName"];
        var flawless = "Flawless&reg;";
        var NuRazor = "Flawless&reg; Nu Razor&trade;";
        var flawlessLegs = "Flawless&reg; Legs&reg;";
        var rechargeable = flawless + " Rechargeable";
        var contour = "Flawless&reg; Contour&trade;";
        var glo = flawless + " Dermaplane&trade; Glo";
        var fridge = flawless + " Beauty Fridge&trade;";
        var cleanse = flawless + " Cleanse";
        var ice = flawless + " Ice Roller";
        var spa = flawless + " Cleanse Spa";
        var blue = flawless + " ";
        var browParisonBlue = flawless + " Brows";
        var nails = flawless + " Salon Nails";
        var pedi = flawless + " Pedi";
        var mask = flawless + " Silk Mask";
%>

    <div>
        <div class="hero no-padding relative">
            <!-- // hero -->
            <ul class="js-eflex--fade" data-eflex-delay="7000" data-eflex-slider-type="fade" data-eflex-nav="true">
                <li>
                    <a href="NAILS<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/16.0000/glam-salon-nails.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/16.0000/glam-salon-nails--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/16.0000/glam-salon-nails.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Salon Nails">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="SPA<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/16.0000/glam-cleanse-spa.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/16.0000/glam-cleanse-spa--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/16.0000/glam-cleanse-spa.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Cleanse Spa">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="NU<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/15.0000/glam-nurazor.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/15.0000/glam-nurazor--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/15.0000/glam--nurazor.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Nu Razor">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="PBLUE<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/16.0000/glam-face.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/16.0000/glam-face--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/16.0000/glam-face.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="The gold standard in hair removal">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="BROWPB<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/16.0000/glam-brows.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/16.0000/glam-brows--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/16.0000/glam-brows.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Pinpoint Precision to Shape and Maintain Brows">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="CONTOUR<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/15.0000/glam-contour.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/15.0000/glam-contour--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/15.0000/glam-contour.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Contour">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="NFRIG<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/15.0000/glam-fridge.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/15.0000/glam-fridge--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/15.0000/glam-fridge.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= fridge %>">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="LEGS<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/15.0000/glam-legs.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/15.0000/glam-legs--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/15.0000/glam-legs.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawlessLegs %>">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="ICE<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/15.0000/flawless-ice.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/15.0000/flawless-ice--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/15.0000/flawless-ice.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= ice %>">
                        </picture>
                    </a>
                </li>
                <li>
                    <a href="PEDI<%= Model.Extension %>">
                        <picture>
                            <source media="(min-width: 701px)" srcset="/images/17.0000/glam-pedi.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <source media="(max-width: 701px)" srcset="/images/17.0000/glam-pedi--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
                            <img src="/images/17.0000/glam-pedi.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= ice %>">
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
                   <!-- Flawless Pedi -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="PEDI<%= Model.Extension %>" title="See details for <%= pedi %>" class="option__overlay">
                                <img src="/images/products/flawless-pedi.png" alt="<%= pedi %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Pedi</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                            </div>
                            <div class="col">
                                <select id="PEDI">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="PEDI<%= Model.Extension %>" title="See details for <%= pedi %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= pedi %> to your shopping cart" data-code="PEDI" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->             
                <!-- Flawless Salon Nails -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="NAILS<%= Model.Extension %>" title="See details for <%= nails %>" class="option__overlay">
                                <img src="/images/products/flawless-nails.png" alt="<%= nails %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS  Salon Nails</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                            </div>
                            <div class="col">
                                <select id="NAILS">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="NAILS<%= Model.Extension %>" title="See details for <%= nails %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= nails %> to your shopping cart" data-code="NAILS" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->
                <!-- Cleanse Spa -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="SPA<%= Model.Extension %>" title="See details for <%= spa %>" class="option__overlay">
                                <img src="/images/products/Cleanse-spa.jpg" alt="<%= spa %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Cleanse Spa</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $29.99</h5>
                            </div>
<%--                            <div class="col">
                                <select id="SPA">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>--%>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="SPA<%= Model.Extension %>" title="See details for <%= spa %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= spa %> to your shopping cart" data-code="SPA" data-select-id="SPA" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->  
                
                
                
                <!-- Flawless  -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="PBLUE<%= Model.Extension %>" title="See details for <%= blue %>" class="option__overlay">
                                <img src="/images/products/flawless-blue.png" alt="<%= blue %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS </h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                            </div>
                            <div class="col">
                                <select id="PBLUE">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="PBLUE<%= Model.Extension %>" title="See details for <%= blue %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= blue %> to your shopping cart" data-code="PBLUE" data-select-id="PBLUE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->
                
                
                
                <!-- Flawless Brows  -->
                <div class="option">
                    <div class="option__wrap"> 
                        <div class="relative center-margin option__img">
                            <a href="BROWPB<%= Model.Extension %>" title="See details for <%= browParisonBlue %>" class="option__overlay">
                                <img src="/images/products/flawless-brows-blue.png" alt="<%= browParisonBlue %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Brows </h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $19.99</h5>
                            </div>
                            <div class="col">
                                <select id="BROWPB">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="BROWPB<%= Model.Extension %>" title="See details for <%= browParisonBlue %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= browParisonBlue %> to your shopping cart" data-code="BROWPB" data-select-id="BROWPB" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->

               
                
                <!-- flawless cleanse -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="CLEANSE<%= Model.Extension %>" title="See details for <%= cleanse %>" class="option__overlay">
                                <img src="/images/products/flawless-cleanse.jpg" alt="<%= cleanse %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Cleanse</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $39.99</h5>
                            </div>
                            <div class="col">
                                <select id="CLEANSE">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="CLEANSE<%= Model.Extension %>" title="See details for <%= cleanse %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= cleanse %> to your shopping cart" data-code="CLEANSE" data-select-id="CLEANSE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->
                
                
                
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
                
                
                
                <!-- flawless Ice Roller -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="ICE<%= Model.Extension %>" title="See details for <%= ice %>" class="option__overlay">
                                <img src="/images/products/flawless-ice.jpg" alt="<%= ice %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Ice Roller</h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $9.99</h5>
                            </div>
                            <div class="col">
                                <select id="ICE">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="ICE<%= Model.Extension %>" title="See details for <%= ice %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= ice %> to your shopping cart" data-code="ICE" data-select-id="ICE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                            </div>
                        </div>
                        <!-- end button row -->
                    </div>
                </div>
                <!-- end option -->
                
                
                
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
<%--                            <a href="javascript:void(0)" title="Add <%= fridge %> to your shopping cart"  class="btn--product h3 white-text">Out of Stock</a>--%>

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
                
                <!-- flawless Silk Mask -->
                <div class="option">
                    <div class="option__wrap">
                        <div class="relative center-margin option__img">
                            <a href="MASK<%= Model.Extension %>" title="See details for <%= mask %>" class="option__overlay">
                                <img src="/images/products/flawless-silk-mask.png" alt="<%= mask %>"></a>
                        </div>
                        <h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Silk Mask<sup>&reg</sup></h4>
                        <hr>
                        <div class="row row-to-center center-margin bottom-padding">
                            <div class="col right-padding">
                                <h5 class="color-gray sans-primary-medium">Price: $9.99</h5>
                            </div>
                            <div class="col">
                                <select id="MASK">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </div>
                        </div>
                        <!-- end price row -->
                        <div class="row row-to-center u-pad--vert center-margin">
                            <div class="col right-padding">
                                <a href="MASK<%= Model.Extension %>" title="See details for <%= mask %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                            </div>
                            <div class="col">
                                <a href="#order" title="Add <%= mask %> to your shopping cart" data-code="MASK" data-select-id="MASK" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
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

            <div class="img center-margin no-bkg" style="--aspect-ratio: 79/890; --aspect-ratio-width: 890px" data-src-img="/images/5.0000/featured-major.png?appV=<%= DtmContext.ApplicationVersion %>" data-src-attr='{ "alt" : "Featured with all these brands" }'>
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
