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

var renderBikini = new DisplayProduct().CanDisplayByProductCode("BIKINI");
%>
  <!--<div>
    <div class="hero no-padding relative"> 
      <ul class="js-eflex--fade" data-eflex-delay="7000" data-eflex-slider-type="fade" data-eflex-nav="true">
        <li> <a href="BUNFACE<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/20.0000/bunface-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/20.0000/bunface-slide--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/20.0000/bunface-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="The gold standard in hair removal"> </picture>
          </a> </li>
        <li> <a href="BUNNAIL<%= Model.Extension %>">
          <picture>
            <source media="(min-width: 701px)" srcset="/images/20.0000/bunnail-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <source media="(max-width: 701px)" srcset="/images/20.0000/bunnail-slide--mobile.jpg?appV=<%= DtmContext.ApplicationVersion %>">
            <img src="/images/20.0000/bunnail-slide.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="Pinpoint Precision to Shape and Maintain Brows"> </picture>
          </a> </li>
        <li> <a href="NAILS<%= Model.Extension %>">
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
          </a> </li>
      </ul>
    </div>
  </div>-->
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
      <h2 class="sans-secondary-book center-text uppercase color-gray fn--expand products__title">Bundle &amp; Save</h2>
      <div class="options u-pad @x2-pad center-text c-brand--form no-margin">

        <!-- Face Be Clean Bundle -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNMITTS<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNMITTS.jpg" alt="Face Be Clean Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Face Be Clean Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$52</strong> (Save 13%)</h5>
              </div>
              <div class="col">
                <select id="BUNCLEANMITTBUNDLE">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <div class="margin-top"> <a href="#order"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   title="Add to your shopping cart" data-code="BUNMITTS" data-select-id="BUNCLEANMITTBUNDLE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Fabulous Face Bundle -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNFACE<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNFACE-1.jpg" alt="Fabulous Face Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Fabulous Face Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$35</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNFACE">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"  data-code="BUNFACE" data-select-id="BUNFACE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- POLISH + PURIFY BUNDLE -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNNAIL<%= Model.Extension %>" title="See details for" class="option__overlay"> <img src="/images/products/BUNNAIL-1.jpg" alt="Polish + Purify Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Polish + Purify Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$35</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNNAIL">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNNAIL" data-select-id="BUNNAIL" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- HAIR BE GONE BUNDLE -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNFACE2<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNFACE2-1.jpg" alt="Hair Be Gone Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Hair Be Gone Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$35</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNFACE2">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNFACE2" data-select-id="BUNFACE2" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- TEXTURE + TONE BUNDLE -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNCLSE<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNCLSE.jpg" alt="Texture + Tone Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Texture + Tone Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$96</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNCLSE">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNCLSE" data-select-id="BUNCLSE" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- FOREVER SUMMER BUNDLE -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNFACE3<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNFACE3-1.jpg" alt="Forever Summer Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Forever Summer Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$70</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNFACE3">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNFACE3" data-select-id="BUNFACE3" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option -->
        
        <!-- BEAUTY LOVER BUNDLE -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="/BUNCLSE2<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/BUNCLSE2-1.jpg" alt="Beauty Lover Bundle"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Beauty Lover Bundle</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strong>$61</strong> (Save 12%)</h5>
              </div>
              <div class="col">
                <select id="BUNCLSE2">
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
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart"  data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="BUNCLSE2" data-select-id="BUNCLSE2" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
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
