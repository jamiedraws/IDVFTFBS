<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/CatalogLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
var brandName = "Finishing Touch Flawless<span class='tm'>&trade;</span>";
%>

<% Html.RenderPartial("CSS.Module.ARP", Model); %>
<style>
[style^="--aspect-ratio"],
[style^="--aspect-ratio"]::before,
[style^="--aspect-ratio"]::after {
    background: transparent;
}
</style>

<h1 class="catalog-title">Explore the world of <%= brandName %> beauty products</h1>

<div
    class="accordion accordion--default"
    data-accordion-toggle
    data-accordion-many-containers
>

    <div class="product" id="face">

        <picture class="product__image" data-src-img="/images/catalog/product-1.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %></h2>
            <div class="product__callout">BEST OF BEAUTY ALLURE 2021 AWARD WINNER</div>
            <p>
                <%= brandName %> is the revolutionary facial hair removal device that erases hair instantly and painlessly without the irritation that comes with plucking, waxing or depilatories. <%= brandName %> is designed to look like a lipstick. You can be "flawless" anywhere, anytime.
            </p>
            <div aria-labelledby="face-title"
            id="face-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>NEW double halo head for faster hair removal</li>
                        <li>NEW and improved floating head contours over the curves of your face</li>
                        <li>18 karat gold-plated head is hypoallergenic &amp; dermatologist approved; gentle on all skin types &amp; tones</li>
                        <li>No redness, irritation or down time &ndash; instant & painless!</li>
                        <li>Built-in LED so you never miss a hair</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/572751943?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Face", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="face-section"
                id="face-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-1.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
                
    </div>

    <div class="product" id="bikini">

        <picture class="product__image" data-src-img="/images/catalog/product-2.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Bikini</h2>
            <p>
                <%= brandName %> Bikini is discreet, portable, and removes unwanted hair from the bikini area INSTANTLY and PAIN FREE. No more nicks, cuts, irritation, razor bumps or ingrown hairs. This beauty tool fits in your purse, beach bag, or suitcase and is conveniently sized to fit in compact spaces like vanity drawers. 
            </p>
            <div aria-labelledby="bikini-title"
            id="bikini-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>Effortlessly and Painlessly remove unwanted hair from bikini area</li>
                        <li>Portable & Discreet so you can carry on-the-go</li>
                        <li>No Nicks, Cuts, Bumps, Razor Burn or Irritation</li>
                        <li>No Downtime or Recovery like waxing or lasering</li>
                        <li>Battery Operated</li>
                    </ul>
                </div>
                <!-- <div data-src-iframe="https://player.vimeo.com/video/651655661?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Bikini", "allow" : "fullscreen" }' class="product__video contain contain--video"></div> -->
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="bikini-section"
                id="bikini-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-2.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product" id="brows">

        <picture class="product__image" data-src-img="/images/catalog/product-3.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Brows</h2>
            <p>
                <%= brandName %> Brows gently erases hair from the surface of the skin with pinpoint precision. Now you can shape and maintain beautiful brows without destroying the root, or promoting premature aging like waxing, plucking and threading.
            </p>
            <div aria-labelledby="brows-title"
            id="brows-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>New & Improved pinpoint precision head can erase a single hair or many</li>
                        <li>Shape and maintain brows in between salon visits in the comfort of your own home</li>
                        <li>18K Gold Plated head erases brow hair from the surface of the skin</li>
                        <li>NO redness, irritation, or downtime</li>
                        <li>Dermatologist Approved, hypoallergenic</li>
                        <li>Built-in LED light so you never miss a hair</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/572751691?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Brows", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="brows-section"
                id="brows-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-3.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product" id="nails">

        <picture class="product__image" data-src-img="/images/catalog/product-4.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Salon Nails</h2>
            <p>
                A complete, easy-to-use mani-pedi nail care solution for use in the safety & comfort of your own home. Chipped nails are now perfectly shaped and filed. Damaged nails are rejuvenated and gel residue easily removed. Dull, drab nails are buffed for an instant natural shine.
            </p>
            <!-- spacer to push down click button -->
            
            <div aria-labelledby="salon-nails-title"
            id="salon-nails-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>Salon-quality tools for all your mani-pedi needs</li>
                        <li>Shape & file, grind & smooth, buff & shine and clean-up your nails like a pro!</li>
                        <li>Forward & reverse, Hi/Lo speeds for fast and easy use</li>
                        <li>LED light for a clear view of the nails</li>
                        <li>Get beautiful nails in the safety & comfort of your own home</li>
                        <li>Rechargeable</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/572755450?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Salon Nails", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="salon-nails-section"
                id="salon-nails-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-4.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product product--pedi" id="pedi">

        <picture class="product__image" data-src-img="/images/catalog/product-5.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Pedi</h2>
            <p>
                <%= brandName %> Pedi is a rechargeable device does all the work &ndash; removing and smoothing unsightly calluses, cracked dry skin, and rough areas instantly and painlessly.
            </p>
            <p class="product__spacer">&nbsp;</p>
            <div aria-labelledby="pedi-title"
            id="pedi-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>Easy reach design for a more natural back-and-forth motion</li>
                        <li>Removes tough calluses, cracked dry skin, and rough areas safely</li>
                        <li>Easy to use on heels, toes, sides, and balls of feet</li>
                        <li>Two speeds and two heads, coarse and fine, for every treatment needed</li>
                        <li>With a built-in LED light so you never miss a spot</li>
                        <li>Gives your feet a youthful, beautiful appearance</li>
                        <li>At-home, salon-quality pedicure device</li>
                        <li>Rechargeable</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/572756240?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Pedi", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="pedi-section"
                id="pedi-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-5.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product" id="cleanse">

        <picture class="product__image" data-src-img="/images/catalog/product-6.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Cleanse</h2>
            <p>
                <%= brandName %> Cleanse has hundreds of ultra-hygienic, soft silicone fingers for a non-abrasive, deep clean and massage using the power of sonic vibration. Effortlessly loosen, lift and remove dirt, oil, and make-up for clean, flawless looking skin.
            </p>
            
            <div aria-labelledby="cleanse-title"
            id="cleanse-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>No replacement heads needed</li>
                        <li>Ultra-hygienic, 100% soft silicone fingers</li>
                        <li>Sonic Vibration to loosen, lift and remove dirt, oil, and make-up</li>
                        <li>4 Modes of Cleanse & Massage &ndash; from gentle to deep</li>
                        <li>Designed to help stimulate circulation and promote collagen production</li>
                        <li>Dermatologist Approved</li>
                        <li>Waterproof (use it in the shower!), recharging cradle included</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/512710856?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Flawless Cleanse", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="cleanse-section"
                id="cleanse-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-6.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product" id="spa">

        <picture class="product__image" data-src-img="/images/catalog/product-7.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Cleanse Spa</h2>
            <p>
                <%= brandName %> Cleanse Spa turns your ordinary shower routine into an extraordinary, full-body, rejuvenating spa experience. <%= brandName %> Cleanse Spa will leave your skin clean, massaged, and exfoliated for the ultimate spa-like experience, all in the comfort of your own home!
            </p>
            <div aria-labelledby="spa-title"
            id="spa-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>3 multi-purpose cleansing heads for a full body, head-to-toe rejuvenating spa-like experience</li>
                        <li>Extra long handle makes hard-to-reach areas easy!</li>
                        <li>Convenient stainless steel shower hook, so it&rsquo;s ready when you are</li>
                        <li>All in the comfort of your own home</li>
                        <li>Water-resistant</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/471439185?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Cleanse Spa", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="spa-section"
                id="spa-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-7.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product product--no-extra" id="dermaplane">

        <picture class="product__image" data-src-img="/images/catalog/product-8.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Dermaplane</h2>
            <p>
                <%= brandName %> Dermaplane exfoliates and removes facial hair to improve surface of skin, and enable flawless application of makeup and topical creams. Helps skin appear healthier, brighter and have a smoother look and feel.
            </p>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-8.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product" id="dermaplane-glo">

        <picture class="product__image" data-src-img="/images/catalog/product-9.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Dermaplane Glo</h2>
            <p>
                <%= brandName %> is designed like the professional-grade devices used by estheticians and board-certified dermatologists. Dermaplaning can smooth the appearance of fine lines and improve the application of makeup and creams. 
            </p>
            
            <div aria-labelledby="glo-title"
            id="glo-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>Exfoliates dry, dead skin and removes peach fuzz</li>
                        <li>Professional-style dermaplaning in your own home</li>
                        <li>Instantly reveals smoother, more radiant, younger-looking skin</li>
                        <li>Elegant contour design with professional-grade Japanese stainless steel blade</li>
                        <li>Specially designed safety guard helps prevent nicks and cuts</li>
                        <li>Built-in LED light &ndash; never miss a spot</li>
                    </ul>
                </div>
                <div data-src-iframe="https://player.vimeo.com/video/342073183?autopause=1" data-attr='{ "width" : "487", "height" : "274", "title" : "Dermaplane Glo", "allow" : "fullscreen" }' class="product__video contain contain--video"></div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="glo-section"
                id="glo-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-9.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

    <div class="product product--no-extra" id="ice">

        <picture class="product__image" data-src-img="/images/catalog/product-10.jpg">
            <img src="/shared/images/blank.png" width="189" height="268" alt="">
        </picture>
        <div class="product__copy">
            <h2 class="product__title"><%= brandName %> Ice</h2>
            <p>
                <%= brandName %> Ice Roller can help reduce the appearance of pores and can help lead your skin to a refreshed, youthful, glowing complexion. With the combined benefits of the facial massaging roller and ice therapy, you can achieve flawless skin in minutes in the comfort of your own home. 
            </p>
            <div aria-labelledby="ice-title"
            id="ice-section"
            class="accordion__section">
                <div class="product__features">
                    <h3 class="product__subtitle">Features &amp; Benefits</h3>
                    <ul class="product__list list list--bullets">
                        <li>Beautifully constructed, lightweight and ergonomic grip handle allows for a firm hold while rolling the face and neck</li>
                        <li>Gel rolling head that when frozen, can be used to reduce puffiness, irritation, and redness on the skin</li>
                        <li>Use in the morning to help wake up and tighten skin before makeup application</li>
                        <li>Use at the end of your nighttime skincare routine can lead to better absorption of serums and moisturizers by locking it into the pores and pulling them deeper into the skin</li>
                        <li>To massage and help to reduce inflammation on other areas of the body that may be experiencing angry skin or puffiness</li>
                    </ul>
                </div>
            </div>
            <button
                class="accordion__button product__view-btn"
                aria-controls="ice-section"
                id="ice-title"
            >
                <span class="accordion__view-more">Click To View More Info</span>
                <span class="accordion__view-less">Click To View Less Info</span>
            </button>
        </div>

        <picture class="product__use" data-src-img="/images/catalog/use-10.jpg">
            <img src="/shared/images/blank.png" width="251" height="251" alt="">
        </picture>
            
    </div>

</div><!-- end accordion -->

</asp:Content>
