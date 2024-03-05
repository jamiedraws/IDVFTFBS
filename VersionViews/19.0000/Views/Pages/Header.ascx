<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
    var productName = SettingsManager.ContextSettings["Label.ProductName"];

    var cov = string.Format("/{0}/{1}/", DtmContext.OfferCode, DtmContext.Version);
    var storyLink = cov + "Index" + Model.Extension + "#story";
    var newsLink = cov + "News" + Model.Extension;
    if (DtmContext.PageCode == "Index") {
        storyLink = "#story";
    }

    if(DtmContext.PageCode == "News"){
        newsLink = "#main";
    }


%>

<style>
.dtm .dtm__in.scroll-lock {
  overflow: hidden;
  max-height: 100vh;
}
.dtm .l-header__in,
.dtm .l-outer__in,
.dtm .l-footer__in {
  max-width: 1200px;
}
.dtm .l-header {
  background: white;
  font-family: 'Sofia Pro Semi Bold', sans-serif;
  border-bottom: 1px solid #fde1e5;
}
.dtm .header--fixed .l-header {
  position: fixed;
  border-color: #333333;
  transition: border-color 0.5s;
}
.dtm .l-header__in {
  display: flex;
  justify-content: space-between;
  margin: 0 auto;
}
.header__menu {
  text-transform: uppercase;
  color: #333333;
  font-size: 16px;
  display: flex;
}
@media screen and (orientation: landscape) {
  .dtm__in--mv .header__menu {
    font-size: 1.4rem;
  }
}
.menu {
  display: flex;
}
.menu,
.menu > a,
.menu--dd__link,
.menu--dd__link button {
  height: 100%;
}
.menu--dd__link {
  position: relative;
}
.menu > a,
.header__search-inner,
.header__cart {
  display: flex;
  align-items: center;
}
.header__search-inner {
  height: 100%;
}
.menu > a,
.menu--dd__link button,
.menu--dd__menu a,
.header__search,
.header__cart {
  position: relative;
  text-transform: inherit;
  -webkit-appearance: none;
  padding: 1rem 1.5rem;
  text-decoration: none;
  border: none;
  background: none;
}
/* styles on hover */
.menu > a:hover,
.menu--dd__link:hover button,
.header__search:hover,
.header__cart:hover {
  background: #fde1e5;
  /*transition: background 0.3s;*/
  color: black;
}
/* make sure the dropdown menu is hidden */
.menu--dd__menu {
  min-width: 310px;
}
.menu--dd__menu,
.search-bar {
  display: none;
  position: absolute;
  background: #fde1e5;
}
.menu--dd__menu a {
  display: block;
  border: 1px solid #fde1e5;
}
.menu--dd__menu a:hover {
  background: white;
  border-color: #ccc;
  transition: background 0.3s, border-color 0.3s;
}
/* show the dropdown menu on hover */
.menu--dd__link:hover .menu--dd__menu,
.header__search:hover .search-bar {
  display: block;
}
/* additional search styles */
.search-bar {
  padding: 1rem;
  right: 0;
}
.search-bar .has-search-icon::after {
  display: none;
}
.search-bar .has-search-icon input {
  text-indent: 0px;
}
/* additional cart styles */
.cartTotalQtyNumbersOnly {
  min-width: 30px;
  min-height: 30px;
  border-radius: 100%;
  border: 2px solid #fd889a;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 0.5rem 0;
}
.dtm__in--dv .cartTotalQtyNumbersOnly {
  margin-top: -0.5rem;
}
.cartTotalQtyNumbersOnly:empty {
  display: none;
}
.header__hamburger,
.header__menu--mobile a {
  display: none;
}
.burger {
  display: inline-block;
  cursor: pointer;
  padding: 1.3rem;
}

.burger__bar {
  width: 35px;
  height: 5px;
  background-color: #333;
  margin: 6px 0;
  transition: 0.4s;
}

.change .bar1 {
  -webkit-transform: rotate(-45deg) translate(-9px, 6px);
  transform: rotate(-45deg) translate(-9px, 6px);
}

.change .bar2 {
  opacity: 0;
}

.change .bar3 {
  -webkit-transform: rotate(45deg) translate(-8px, -8px);
  transform: rotate(45deg) translate(-8px, -8px);
}
/* media queries */
@media all and (max-width: 900px) and (min-width: 565px) {
  .dtm .l-header__in {
    flex-wrap: wrap;
  }
  .header__logo,
  .header__menu {
    margin: 0 auto;
  }
}
@media all and (min-width: 565px) {
  .header__search .img,
  .header__cart .img {
    margin-top: -1rem;
  }
}
@media all and (-ms-high-contrast:none) {
     *::-ms-backdrop,
     .header__search .img,
     .header__cart .img {
       margin-top: 0;
     }
}
@media all and (max-width: 565px) {
  .dtm .l-header__in {
    justify-content: space-between;
  }
  .header__hamburger,
  .header__logo {
    display: flex;
    position: relative;
    z-index: 10;
    align-items: center;
  }
  .header__logo,
  .header__logo * {
    max-width: 35vw;
  }
  .header__menu .menu {
    display: none;
  }
  .mobile-menu__bkg {
    position: absolute;
    z-index: 2;
    background: rgba(253, 136, 154, 0.95);
    width: 100vw;
    height: 100vh;
    transform: rotate(0deg);
    right: 0;
    top: -100vh;
    transform-origin: bottom right;
    transition: transform 0.4s, width 0.4s;
  }
  .mobile-menu__bkg--products {
    background: rgba(255, 255, 255, 0.95);
    z-index: 4;
  }
  .mobile-menu__bkg.slide-open {
    transform: rotate(-90deg);
    width: 135vh;
  }
  .header__menu--mobile a {
    opacity: 0;
    display: block;
    position: absolute;
    top: -100vw; right: -100vw;
    text-align: right;
  }
  .header__menu--open a {
    z-index: 3;
    font-size: 7vw;
    text-decoration: none;
    text-transform: uppercase;
    opacity: 1;
    right: 4vw;
  }
  .header__menu--open > a:first-of-type {
    top: 15vh;
    transition: opacity 1s;
  }
  .header__menu--open > a:nth-of-type(2) {
    top: 25vh;
    transition: opacity 1.2s;
    min-width: 42vw;
  }
  .header__menu--open > a:nth-of-type(3) {
    top: 35vh;
    transition: opacity 1.4s;
  }
  .header__menu--open > a:nth-of-type(4) {
    top: 45vh;
    transition: opacity 1.5s;
  }
  .mobile-menu__products--open > a {
    z-index: 5;
    right: 4vw;
    font-size: 4vw;
    min-width: 57vw;
    text-align: right;
  }
  .mobile-menu__products--open > a:first-of-type {
    top: 10vh;
    transition: opacity 1s;
  }
.mobile-menu__products--open > a:nth-of-type(2) {
    top: 15vh;
    transition: opacity 1.2s;
}

.mobile-menu__products--open > a:nth-of-type(3) {
    top: 20vh;
    transition: opacity 1.4s;
}
.mobile-menu__products--open > a:nth-of-type(4) {
    top: 25vh;
    transition: opacity 1.6s;
}
.mobile-menu__products--open > a:nth-of-type(5) {
    top: 30vh;
    transition: opacity 1.8s;
}
.mobile-menu__products--open > a:nth-of-type(6) {
    top: 35vh;
    transition: opacity 2s;
}
.mobile-menu__products--open > a:nth-of-type(7) {
    top: 40vh;
    transition: opacity 2.2s;
}
.mobile-menu__products--open > a:nth-of-type(8) {
    top: 45vh;
    transition: opacity 2.4s;
}
.mobile-menu__products--open > a:nth-of-type(9) {
    top: 50vh;
    transition: opacity 2.6s;
}
.mobile-menu__products--open > a:nth-of-type(10) {
    top: 55vh;
    transition: opacity 3s;
}
.mobile-menu__products--open > a:nth-of-type(11) {
    top: 60vh;
    transition: opacity 3.4s;
}
.mobile-menu__products--open > a:nth-of-type(12) {
    top: 65vh;
    transition: opacity 3.8s;
}
.mobile-menu__products--open > a:nth-of-type(13) {
    top:70vh;
    transition: opacity 4.2s;
}
.mobile-menu__products--open > a:nth-of-type(14) {
    top: 75vh;
    transition: opacity 4.6s;
}
.mobile-menu__products--open > a:nth-of-type(15) {
    top: 80vh;
    transition: opacity 5.4s;
}
.mobile-menu__products--open > a:nth-of-type(16) {
    top: 85vh;
    transition: opacity 5.8s;
}
  .mobile-menu a {
    position: relative;
    z-index: 3;
  }
}

/* force position to not calculate width and break out of container */
#mobileMenu {
    position: fixed;
    top: 0;
    right: 0;
}

/* new at home logo */
.header__logo {
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.dtm .at-home-logo {
  max-width: 80px;
}

@media screen and (max-width: 565px) {
  .dtm .at-home-logo {
    max-width: 10vw;
  }
}
@media (max-height: 880px) {
    .menu--dd__menu {
        overflow: scroll;
        max-height: 75vh;
    }
}
</style>

<style id="localization-rules">
    .localization > * {
      display: inline-block;
    }

    .localization__link {
        padding: 5px;
        display: inline-block;
    }

    @media all and (min-width: 566px) {
        .localization {
            font-size: 1.4rem;
        }

        .header__menu--mobile > .localization {
            display: none;
        }

        .header__topbar > .localization {
            text-align: center;
            padding: 0;
        }

        .header__topbar .localization > *:not(:last-child)::after {
          content: "|";
        }
    }

    @media all and (min-width: 901px) {
        .header__topbar > .localization {
            text-align: right;
        }
    }

    @media all and (max-width: 565px) {
        .dtm .header__topbar {
            display: none;
        }

        .header__menu--open .localization {
            position: absolute;
            right: 4vw;
            top: 55vh;
            width: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
        }

        .header__menu--open .localization__link {
            position: relative;
            right: 0;
            top: 0;
            display: inline-block;
            font-size: inherit;
        }
    }
</style>

<header class="l-header l-outer header">
  <% if (DtmContext.Page.IsStartPageType) { %>
  <div class="l-outer__in header__topbar">
    <% Html.RenderPartial("LanguageRedirectLinks"); %>
  </div>
    <% } %>
  <div class="l-header__in">
    <div class="header__hamburger">
      <div class="burger" onclick="openMobileMenu(this)">
        <div class="burger__bar bar1"></div>
        <div class="burger__bar bar2"></div>
        <div class="burger__bar bar3"></div>
      </div>
    </div>
    <div id="mobileMenu" class="header__menu--mobile">
      <div id="mobileMenuBkg" class="mobile-menu__bkg"></div>
      <a href="javascript:void(0);" onclick="openSubMobileMenu();">Products</a>
      <a href="<%= storyLink %>">Our Story</a>
      <a href="<%= cov %>ProductRegistration<%= Model.Extension %>">Register</a>
      <a href="javascript:void(0);" onclick="openSubMobileMenu1();">Videos</a>
      <div id="mobileMenuBkgProducts" class="mobile-menu__bkg mobile-menu__bkg--products"></div>
      <div id="mobileMenuProducts" class="mobile-menu__products">
        <a href="<%= cov %>PEDI<%= Model.Extension %>">Flawless Pedi</a>
        <a href="<%= cov %>NAILS<%= Model.Extension %>">Flawless Salon Nails</a>
        <a href="<%= cov %>SPA<%= Model.Extension %>">Flawless Cleanse Spa</a>
        <a href="<%= cov %>PBLUE<%= Model.Extension %>">Flawless </a>
        <a href="<%= cov %>BROWPB<%= Model.Extension %>">Flawless Brows </a>
        <a href="<%= cov %>CLEANSE<%= Model.Extension %>">Flawless Cleanse</a>
        <a href="<%= cov %>NU<%= Model.Extension %>">Flawless Nu Razor</a>
        <a href="<%= cov %>GLO<%= Model.Extension %>">Flawless Dermaplane Glo</a>
        <a href="<%= cov %>ICE<%= Model.Extension %>">Flawless Ice Roller</a>
        <a href="<%= cov %>NFRIG<%= Model.Extension %>">Beauty Fridge</a>
        <a href="<%= cov %>CONTOUR<%= Model.Extension %>">Flawless Contour</a>
        <a href="<%= cov %>LEGS<%= Model.Extension %>">Flawless Legs</a>
        <a href="<%= cov %>MASK<%= Model.Extension %>">Flawless Silk Mask</a>
        <a href="<%= cov %>REPLACEMENT<%= Model.Extension %>">Replacement Heads</a>
        <a href="<%= cov %>ADAPT<%= Model.Extension %>">Adaptor</a>
      </div>
      <div id="mobileMenuVideos" class="mobile-menu__products">
        <a href="<%= cov %>Videos<%= Model.Extension %>">Commercials</a>
        <a href="<%= cov %>HowTo<%= Model.Extension %>">How To Videos</a>
      </div>
        <%Html.RenderPartial("LanguageRedirectLinks"); %>
    </div>
    <div class="header__logo u-pad--vert">
      <a href="<%= cov %>Index" class="img block no-bkg" style="--aspect-ratio:46/242; --aspect-ratio-width: 242px; width: 242px;">
        <img src="/images/5.0000/logo.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Finishing Touch&reg; Flawless&reg;">
      </a>
      <img src="/images/at-home-solution-logo.png" alt="At-Home Solution" class="at-home-logo">
    </div>
    <div class="header__menu">
      <nav class="menu menu--dd">
        <div class="menu--dd__link">
          <button>Products</button>
          <div class="menu--dd__menu">
        <a href="<%= cov %>PEDI<%= Model.Extension %>">Flawless Pedi</a>
        <a href="<%= cov %>NAILS<%= Model.Extension %>">Flawless Salon Nails</a>
        <a href="<%= cov %>SPA<%= Model.Extension %>">Flawless Cleanse Spa</a>
        <a href="<%= cov %>PBLUE<%= Model.Extension %>">Flawless </a>
        <a href="<%= cov %>BROWPB<%= Model.Extension %>">Flawless Brows </a>
        <a href="<%= cov %>CLEANSE<%= Model.Extension %>">Flawless Cleanse</a>
        <a href="<%= cov %>NU<%= Model.Extension %>">Flawless Nu Razor</a>
        <a href="<%= cov %>GLO<%= Model.Extension %>">Flawless Dermaplane Glo</a>
        <a href="<%= cov %>ICE<%= Model.Extension %>">Flawless Ice Roller</a>
        <a href="<%= cov %>NFRIG<%= Model.Extension %>">Beauty Fridge</a>
        <a href="<%= cov %>CONTOUR<%= Model.Extension %>">Flawless Contour</a>
        <a href="<%= cov %>LEGS<%= Model.Extension %>">Flawless Legs</a>
        <a href="<%= cov %>MASK<%= Model.Extension %>">Flawless Silk Mask</a>
        <a href="<%= cov %>REPLACEMENT<%= Model.Extension %>">Replacement Heads</a>
        <a href="<%= cov %>ADAPT<%= Model.Extension %>">Adaptor</a>
          </div>
        </div>
        <div class="menu--dd__link">
          <button>Videos</button>
          <div class="menu--dd__menu">
            <a href="<%= cov %>Videos<%= Model.Extension %>">Commercials</a>
            <a href="<%= cov %>HowTo<%= Model.Extension %>">How To Videos</a>
          </div>
        </div>
        <a href="<%= cov %>ProductRegistration<%= Model.Extension %>">Product Registration</a>
        <a href="<%= storyLink %>">Our Story</a>
        <a href="<%= newsLink %>">In The News</a>
            

      </nav><!-- end menu -->
      <div id="searchIcon" class="header__search">
        <div class="header__search-inner">
          <div class="img no-bkg" style="--aspect-ratio:1/1; --aspect-ratio-width: 25px; width: 25px;">
            <img src="/images/3.0000/search-icon.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Search the site">
          </div>
        </div>
        <div class="search-bar">
          <% if ( DtmContext.Page.IsStartPageType ) { Html.RenderPartial("Search", Model); } %>
        </div>
      </div><!-- end .header__search -->
      <a class="header__cart" href="<%= cov %>ShoppingCart<%= DtmContext.ApplicationExtension %>#review" title="View your shopping cart">
        <div class="img no-bkg" style="--aspect-ratio:1/1; --aspect-ratio-width: 30px; width: 30px;">
          <img src="/images/icon-cart.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Shopping Cart">
        </div>
        <span class="cartTotalQtyNumbersOnly"></span>
      </a><!-- end .header__cart --> 
    </div><!-- end .header__menu -->
  </div>
</header>

<script>
  const nav = document.querySelector('.l-header');
  const navTop = nav.offsetTop;

  function stickyNavigation() {
    if (window.scrollY > navTop) {
      document.body.classList.add('header--fixed');
    } else {
      document.body.classList.remove('header--fixed');
    }
  }

  window.addEventListener('scroll', stickyNavigation);

  function openMobileMenu(x) {
    x.classList.toggle("change");
    // start showing the menu items
    document.getElementById("mobileMenu").classList.toggle("header__menu--open");
    // animate in the background shape
    document.getElementById("mobileMenuBkg").classList.toggle("slide-open");
    // toggle scrolling on the body
    document.body.classList.toggle("scroll-lock");
    if (document.getElementById("mobileMenuProducts").classList.contains("mobile-menu__products--open")) {
      document.getElementById("mobileMenuProducts").classList.toggle("mobile-menu__products--open");
      document.getElementById("mobileMenuBkgProducts").classList.toggle("slide-open");
    }
    if (document.getElementById("mobileMenuVideos").classList.contains("mobile-menu__products--open")) {
      document.getElementById("mobileMenuVideos").classList.toggle("mobile-menu__products--open");
      document.getElementById("mobileMenuBkgProducts").classList.toggle("slide-open");
    }
  }

  function openSubMobileMenu() {
     document.getElementById("mobileMenuBkgProducts").classList.toggle("slide-open");
     document.getElementById("mobileMenuProducts").classList.toggle("mobile-menu__products--open");
  }

  function openSubMobileMenu1() {
     document.getElementById("mobileMenuBkgProducts").classList.toggle("slide-open");
     document.getElementById("mobileMenuVideos").classList.toggle("mobile-menu__products--open");
  }

  function mobileSearch() {
    document.getElementById('textS').focus();
  }

  document.getElementById('searchIcon').addEventListener('click', mobileSearch)
</script>

