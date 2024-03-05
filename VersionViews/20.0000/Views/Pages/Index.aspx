<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <%
      var productName = SettingsManager.ContextSettings["Label.ProductName"];
      var flawless = "Facial Hair Remover";
      var NuRazor = "Nu Razor&trade; Hair Remover";
      var flawlessLegs = "Legs";
      var rechargeable = " Rechargeable";
      var UA = "Underarm Hair Remover";
      var SHR = "Stray Hair Remover";
      var contour = "Flawless Contour&trade; Facial Roller";
      var glo = "Flawless Derma GLO&trade; Lighted Facial Exfoliator";
      var fridge = "Beauty Fridge";
      var cleanse = "Cleanse";
      var ice = "Ice Roller";
      var spa = "Cleanse Spa";
      var blue = "Facial Hair Remover";
      var browParisonBlue = "Brows";
      var nails = "Salon Nails";
      var pedi = "Pedi";
      var mask = "Silk Mask";
      var steamer = "Facial Steamer";
      var bikini = "Bikini";
      var mitt = "Pure Clean Mitts";

      var renderBikini = new DisplayProduct().CanDisplayByProductCode("BIKINI");
%>
  <div>
    <div class="hero no-padding relative"> 
      <!-- // hero -->
      <ul class="js-eflex--fade" data-eflex-delay="7000" data-eflex-slider-type="fade" data-eflex-nav="true">
        <li> <a href="MITT<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/slides/mitt-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/slides/mitt-mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/slides/mitt-slide.jpg?appv=<%= DtmContext.ApplicationVersion %>" alt="Cleansing and makeup removal mitts"> </picture>
          </a> </li>
        <li> <a href="BUNFACE<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/20.0000/bunface-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/20.0000/bunface-slide-mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/20.0000/bunface-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="The gold standard in hair removal"> </picture>
          </a> </li>
        <li> <a href="BUNNAIL<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/20.0000/bunnail-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/20.0000/bunnail-slide-mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/20.0000/bunnail-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Pinpoint Precision to Shape and Maintain Brows"> </picture>
          </a> </li>
        <!--<li> <a href="NAILS<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/16.0000/glam-salon-nails.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/16.0000/glam-salon-nails--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/16.0000/glam-salon-nails.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Salon Nails"> </picture>
          </a> </li>
        <li> <a href="PEDI<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/17.0000/glam-pedi.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/17.0000/glam-pedi--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/17.0000/glam-pedi.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= ice %>"> </picture>
          </a> </li>-->
        <% if (renderBikini) { %>
        <li> <a href="BIKINI<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/20.0000/bikini-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/20.0000/bikini-slide-mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/20.0000/bikini-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %> Bikini"> </picture>
          </a> </li>
        <% } %>
        <li>
          <picture>
            <source media="(min-width: 701px)" srcset="/images/15.0000/flawless-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/15.0000/flawless-slide--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/15.0000/flawless-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= flawless %>"> </picture>
        </li>
        <!--<li>
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
</li>-->
      </ul>
    </div>
  </div>
  <div class="cos-bag color-gray sans-secondary-book center-text u-pad--vert @x3-pad">
    <div class="padding">
      <h2 class="h2"><span class="color-pink--new sans-primary-ultra" style="line-height: 1;">FREE SHIPPING &amp; FREE COSMETIC BAG</span> <br />
        on orders $29.99 and up!</h2>
    </div>
    <div class="padding"><img src="/images/cosmetic-bag.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Costmetic Bag" /></div>
  </div>
  <div class="pink-hz center-margin" style="max-width: 1120px;">
    <hr style="background: #fde1e5;">
  </div>
  <%-- Html.RenderPartial("FreeMask"); --%>
  <div id="order" class="products__top width-at-100 white-background u-pad--vert @x3-pad">
    <div class="l-outer__in center-margin c-brand">
      <h2 class="sans-secondary-book center-text uppercase color-gray fn--expand products__title">Top Selling Products </h2>
      <div class="options u-pad @x2-pad center-text c-brand--form no-margin"> 
        
        <!-- Flawless  -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="PBLUE<%= Model.Extension %>" title="See details for <%= blue %>" class="option__overlay"> <img src="/images/products/flawless-blue.png" alt="<%= blue %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Facial Hair Remover</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
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
              <!--<div class="col right-padding">
<a href="PBLUE<%= Model.Extension %>" title="See details for <%= blue %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" title="Add <%= blue %> to your shopping cart" data-code="PBLUE" data-select-id="PBLUE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option -->

        <!-- Flawless Mitt -->
        <div class="option">
          <div class="option__wrap">
			  <div class="relative center-margin option__img"> <a href="MITT<%= Model.Extension %>" title="See details for <%= mitt %>" class="option__overlay"> <img src="/images/products/mitt.jpg" alt="<%= mitt %>"></a> </div>
			  
			  
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad"><%= mitt %> (7 Mitts)</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
              </div>
              <div class="col">
                <select id="MITT">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <div class="margin-top"> <a href="#order" title="Add <%= mitt %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="MITT" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Flawless Pedi -->
        <div class="option">
          <div class="option__wrap">
			  <div class="relative center-margin option__img"> <a href="PEDI<%= Model.Extension %>" title="See details for <%= pedi %>" class="option__overlay"> <img src="/images/products/PEDI-1.jpg" alt="<%= pedi %>"></a> </div>
			  
			  
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Pedi</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
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
              <!--<div class="col right-padding">
<a href="PEDI<%= Model.Extension %>" title="See details for <%= pedi %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" title="Add <%= pedi %> to your shopping cart" data-code="PEDI" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Flawless Salon Nails -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="NAILS<%= Model.Extension %>" title="See details for <%= nails %>" class="option__overlay"> <img src="/images/products/NAILS-1.jpg" alt="<%= nails %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Salon Nails<br><br></h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
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
              <!--<div class="col right-padding">
<a href="NAILS<%= Model.Extension %>" title="See details for <%= nails %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= nails %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="NAILS" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Flawless Brows  -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="BROWPB<%= Model.Extension %>" title="See details for <%= browParisonBlue %>" class="option__overlay"> <img src="/images/products/BROWPB-1.jpg" alt="<%= browParisonBlue %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Brows<br>
              <br>
            </h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
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
              <!--<div class="col right-padding">
<a href="BROWPB<%= Model.Extension %>" title="See details for <%= browParisonBlue %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= browParisonBlue %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="BROWPB" data-select-id="BROWPB" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless dermaplane glo  -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="GLO<%= Model.Extension %>" title="See details for <%= glo %>" class="option__overlay"> <img src="/images/products/dermaplane-glo.png" alt="<%= glo %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Flawless Dermaplane GLO&trade; Lighted Facial Exfoliator</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
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
              <!--<div class="col right-padding">
<a href="GLO<%= Model.Extension %>" title="See details for <%= glo %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= glo %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="GLO" data-select-id="GLO" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option -->
        
        <% if (renderBikini) { %>
        <!-- flawless bikini -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="BIKINI<%= Model.Extension %>" title="See details for <%= bikini %>" class="option__overlay"> <img src="/images/products/flawless-bikini-main.jpg" alt="<%= bikini %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Bikini</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
              </div>
              <div class="col">
                <select id="BIKINI">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="BIKINI<%= Model.Extension %>" title="See details for <%= bikini %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= bikini %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="BIKINI" data-select-id="BIKINI" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option -->
        <% } %>
        
        <!-- flawless legs -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="LEGS<%= Model.Extension %>" title="See details for <%= flawlessLegs %>" class="option__overlay"> <img src="/images/products/3.0000/flawless-legs-home-NOPROMO.png" alt="<%= flawlessLegs %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Legs</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$59.98</h5>
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
              <!--<div class="col right-padding">
<a href="LEGS<%= Model.Extension %>" title="See details for <%= flawlessLegs %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= flawlessLegs %> to your shopping cart"data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="LEG" data-select-id="LEGS" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- NuRazor -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="NU<%= Model.Extension %>" title="See details for <%= NuRazor %>" class="option__overlay"> <img src="/images/products/NuRazor.png" alt="<%= NuRazor %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Nu Razor&trade; Hair Remover</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium ">$39.99</h5>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="NU<%= Model.Extension %>" title="See details for <%= NuRazor %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= NuRazor %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="NU" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless facial steamer -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="STEAM<%= Model.Extension %>" title="See details for <%= steamer %>" class="option__overlay"> <img src="/images/products/STEAM-1.jpg" alt="<%= steamer %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Facial Steamer</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$49.88</h5>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="STEAM<%= Model.Extension %>" title="See details for <%= steamer %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= steamer %> to your shopping cart"data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="STEAMER" data-select-id="STEAMER" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
              <%--                            <div class="col">
<a href="https://www.walmart.com/ip/Finishing-Touch-Flawless-Facial-Steamer/340717004" title="Order from Walmart" class="btn--product h3 white-text">Buy Now</a>
</div>--%>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless cleanse -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="CLEANSE<%= Model.Extension %>" title="See details for <%= cleanse %>" class="option__overlay"> <img src="/images/products/CLEANSE-1.jpg" alt="<%= cleanse %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Cleanse</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$39.99</h5>
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
              <!--<div class="col right-padding">
<a href="CLEANSE<%= Model.Extension %>" title="See details for <%= cleanse %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= cleanse %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="CLEANSE" data-select-id="CLEANSE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless contour  -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="CONTOUR<%= Model.Extension %>" title="See details for <%= contour %>" class="option__overlay"> <img src="/images/products/contour.jpg" alt="<%= contour %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Flawless Contour&trade; Facial Roller</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="CONTOUR<%= Model.Extension %>" title="See details for <%= contour %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= contour %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="CONTOUR" data-select-id="CONTOUR" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
            <!-- Under Arm -->
        <div class="option">
          <div class="option__wrap">
			  <div class="relative center-margin option__img"> <a href="UA<%= Model.Extension %>" title="See details for Underarm Hair Remover" class="option__overlay"> <img src="/images/products/UA-1.jpg" alt="<%= UA %>"></a> </div>
			  
			  
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Underarm Hair Remover</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$29.99</h5>
              </div>
              <div class="col">
                <select id="UA">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="UA<%= Model.Extension %>" title="See details for underarm" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" title="Add <%= UA %> to your shopping cart" data-code="UA" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
            <!-- Stray Hair Remover -->
        <div class="option">
          <div class="option__wrap">
			  <div class="relative center-margin option__img"> <a href="SHR<%= Model.Extension %>" title="See details for <%= SHR %>" class="option__overlay"> <img src="/images/products/SHR.jpg" alt="<%= SHR %>"></a> </div>
			  
			  
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Stray Hair Remover</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$19.99</h5>
              </div>
              <div class="col">
                <select id="SHR">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="SHR<%= Model.Extension %>" title="See details for " class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" title="Add <%= SHR %> to your shopping cart" data-code="SHR" data-select-id="v" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        

        <!-- Cleanse Spa -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="SPA<%= Model.Extension %>" title="See details for <%= spa %>" class="option__overlay"> <img src="/images/products/SPA-1.jpg" alt="<%= spa %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Cleanse Spa</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$29.99</h5>
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
              <!--<div class="col right-padding">
<a href="SPA<%= Model.Extension %>" title="See details for <%= spa %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= spa %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="SPA" data-select-id="SPA" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless Ice Roller -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="ICE<%= Model.Extension %>" title="See details for <%= ice %>" class="option__overlay"> <img src="/images/products/ICE-1.jpg" alt="<%= ice %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Ice Roller</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$9.99</h5>
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
              <!--<div class="col right-padding">
<a href="ICE<%= Model.Extension %>" title="See details for <%= ice %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= ice %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="ICE" data-select-id="ICE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless fridge -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="NFRIG<%= Model.Extension %>" title="See details for <%= fridge %>" class="option__overlay"> <img src="/images/products/NFRIG-1.jpg" alt="<%= fridge %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Beauty Fridge</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium ">$59.99</h5>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <!--<div class="col right-padding">
<a href="NFRIG<%= Model.Extension %>" title="See details for <%= fridge %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= fridge %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="NFRIGFS" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
                <%--                            <a href="javascript:void(0)" title="Add <%= fridge %> to your shopping cart"  class="btn--product h3 white-text">Out of Stock</a>--%>
              </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless Silk Mask -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="MASK<%= Model.Extension %>" title="See details for <%= mask %>" class="option__overlay"> <img src="/images/products/flawless-silk-mask.png" alt="<%= mask %>"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Silk Mask</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium">$12.99</h5>
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
              <!--<div class="col right-padding">
<a href="MASK<%= Model.Extension %>" title="See details for <%= mask %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>--> 
              <!--								<div class="hearts"><img src="/images/2.0000/hearts.png" alt="5 Star Review"></div>
-->
              <div class="margin-top"> <a href="#order" title="Add <%= mask %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="MASK1299" data-select-id="MASK" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- flawless Silk Mask - 4 Pack -->
        <%--                <div class="option">
<div class="option__wrap">
<div class="relative center-margin option__img">
<a href="MASK4<%= Model.Extension %>" title="See details for <%= mask %>" class="option__overlay">
<img src="/images/products/masks.jpg" alt="<%= mask %>"></a>
</div>
<h4 class="color-gray sans-primary-bold top-padding @x2-pad">FLAWLESS Silk Mask<sup>&reg</sup> - Set of 4</h4>
<hr>
<div class="row row-to-center center-margin bottom-padding">
<div class="col right-padding">
<h5 class="color-gray sans-primary-medium">Price: $29.99</h5>
</div>
<div class="col">
<select id="MASK4">
<option value="1">1</option>
<option value="2">2</option>
</select>
</div>
</div>
<!-- end price row -->
<div class="row row-to-center u-pad--vert center-margin">
<div class="col right-padding">
<a href="MASK4<%= Model.Extension %>" title="See details for <%= mask %>" class="btn--product btn--learn h3 white-text">Learn More</a>
</div>
<div class="col">
<a href="#order" title="Add <%= mask %> to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code="MASK4" data-select-id="MASK4" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a>
</div>
</div>
<!-- end button row -->
</div>
</div>--%>
        <!-- end option --> 
        
      </div>
    </div>
  </div>
  <!-- end top products -->
  
  <div class="featured bg-secondary width-at-100">
    <h4 class="sans-secondary-book center-text uppercase color-gray fn--expand top-margin @x2-mar">
    FLAWLESS<sup>&reg;</sup> has been featured in
    </h5>
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
