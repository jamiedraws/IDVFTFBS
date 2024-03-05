<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <%
var productName = SettingsManager.ContextSettings["Label.ProductName"];
var renderBikini = new DisplayProduct().CanDisplayByProductCode("BIKINI");
%>
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
      <h2 class="sans-secondary-book center-text uppercase color-gray fn--expand products__title">Sale Items</h2>
      <div class="options u-pad @x2-pad center-text c-brand--form no-margin"> 
        
        <!-- Facial Hair Remover + Brows - Mermaid -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="SLFACBRWDUO<%= Model.Extension %>" title="See details for" class="option__overlay"> <img src="/images/products/SLFACBRWDUO-1.jpg" alt="Facial Hair Remover + Brows - Mermaid"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Facial Hair Remover + Brows - Mermaid</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strike>$39.98</strike> <label class="sale-pink"> $29.99 </label><strong> (25% off)</strong></h5>
              </div>
              <div class="col" style="display:none;">
                <select id="SLFACBRWDUO">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="SLFACBRWDUO" data-select-id="SLFACBRWDUO" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Brows - Blush -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="SLFLBROW<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/flawless-brows.png" alt="SLFLBROW"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Brows - Blush<br/><br/></h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strike>$19.99</strike> <label class="sale-pink"> $13.99 </label><strong> (30% off)</strong></h5>
              </div>
              <div class="col" style="display:none;">
                <select id="SLFLBROW">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="SLFLBROW" data-select-id="SLFLBROW" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
        
        <!-- Body -->
        <div class="option">
          <div class="option__wrap">
            <div class="relative center-margin option__img"> <a href="SLFLBODYR<%= Model.Extension %>" title="See details" class="option__overlay"> <img src="/images/products/3.0000/flawless-body.png" alt="Body"></a> </div>
            <h4 class="color-gray sans-primary-bold top-padding @x2-pad">Body Hair Remover</h4>
            <hr>
            <div class="row row-to-center center-margin bottom-padding">
              <div class="col right-padding">
                <h5 class="color-gray sans-primary-medium"><strike>$29.99</strike><label class="sale-pink"> $19.99 </label><strong> (33% off)</strong></h5>
              </div>
              <div class="col" style="display:none;">
                <select id="SLFLBODYR">
                  <option value="1">1</option>
                  <option value="2">2</option>
                </select>
              </div>
            </div>
            <!-- end price row -->
            <div class="row row-to-center u-pad--vert center-margin"> 
              <div class="margin-top"> <a href="#order" title="Add to your shopping cart" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status"   data-code="SLFLBODYR" data-select-id="SLFLBODYR" data-code-toggle="true" class="btn--product h3 white-text">Add To Cart</a> </div>
            </div>
            <!-- end button row --> 
          </div>
        </div>
        <!-- end option --> 
      </div>    
    </div>
  </div>

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
