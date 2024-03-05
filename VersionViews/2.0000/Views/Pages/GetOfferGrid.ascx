<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<style>
    /*	Offer Object
        @Desc: Controls the grid of the offer area
    * --------------------------------------------------------------------- */
    .offer {}

    .offer__list {
        list-style: none;
        display: table;
    }

    .offer__price {
		    min-width: 100px;
		}

    .offer--stack .offer__item:last-child {
        padding-bottom: 0;
    }

    .offer--stack .item__label {
        margin: 1rem auto 0;
    }

    .offer__row {
        padding: 2rem 0;
        border-bottom: 1px solid #9a9a9a;
    }

    .offer__row > .col {
        padding: 0 2rem;
    }

    .offer__row + .offer__row {
        border-bottom: none;
    }

    .offer__bottom > .col {
        padding: 0 3rem;
    }

    .offer__row,
    .offer__list {
        margin: auto;
    }


    /*	Price Object
        @Desc: Controls the format of the price point
    * --------------------------------------------------------------------- */
    .offer__price {
        font: 2rem/1 'Avenir Roman', Helvetica, sans-serif;
        padding: 0 1.5rem;
    }

    .price__currency,
    .price__dollar,
    .price__cent {
        display: inline-block;
        vertical-align: top;
    }

    .price__currency {
        font-size: 1em;
    }

    .price__dollar {
        font-size: 2.25em;
        margin-left: -0.2em;
        margin-top: -0.05em;
        margin-right: 0.05em;
        letter-spacing: -0.15em;
    }

    .price__cent {
        font-size: 0.9em;
    }

    .price--expand .price__dollar {
        letter-spacing: -0.05em;
        margin-right: -0.05em;
    }

    .offer__bottom .offer__price {
        padding: 0.5rem 0;
    }


    /*	Item Object
        @Desc: Controls the appearance of the offer item
    * --------------------------------------------------------------------- */
    .offer__item {
        display: inline-block;
        vertical-align: top;
        text-align: center;
    }

    .dtm__in--dv .offer--grid .offer__item {
        display: table-cell;
    }

    .offer--grid .offer__item {
        width: 25%;
    }

    .offer--stack .offer__item {
        padding-top: 0;
        padding-bottom: 3rem;
    }

    .item__img {
        display: block;
        margin: auto;
    }

    .item__req,
    .item__desc {
        font-size: 1.3rem;
    }

    .offer--grid .item__label {
        margin-right: 3rem;
    }

    .offer__bottom .offer__item {
        text-align: left;
    }

    .offer__bottom .item__label {
        display: block;
        position: relative;
    }

    .dtm__in--dv .item__desc--abs {
        position: absolute;
        bottom: 0;
        text-align: center;
    }

    .offer__brows {
    	border-bottom: 1px solid #9a9a9a;
    	padding: 2rem 0 0;
    }

    .option__brows {
    	max-width: 500px;
    }

    @media all and (min-width: 640px) {
    	.dtm__in--dv .offer__row > .col:first-of-type {
        border-right: 1px solid #9a9a9a;
    	}
    }

    @media all and ( max-width: 640px ) {
        .dtm__in--mv .offer--grid .offer__item {
            width: 50%;
        }

        .dtm__in--mv .offer--grid .item__label {
            margin: auto;
        }
        .dtm__in--mv .item__img {
            max-height: 15rem;
        }
        .dtm__in--mv .offer__row > .col:first-of-type {
	        border-bottom: 1px solid #9a9a9a;
	        padding-bottom: 2rem;
	    	}
	    	.dtm__in--mv .offer__row > .col {
	        text-align: center;
	        margin-bottom: 3rem;
	    	}
	    	.dtm__in--mv .offer__col {
       		width: 50%;
    		}
    		.dtm .steps .offer {
    			padding: 10px 4px;
    		}
    }


    /*	Banner
        @Desc: Controls the appearance of the banner
    * --------------------------------------------------------------------- */
    .dtm__in--dv .stock-banner {
        margin-top: -3rem;
        margin-bottom: 1rem;
        display: block;
    }
</style>


<img class="stock-banner @mobile-only-hide" src="/images/desktop/stock-up-banner.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Stock Up">


<!-- // BEGIN #productSelection -->
<fieldset class="steps c-brand--form__fieldset" id="productSelection">

    <div class="c-brand--form__legend width-at-100" tabindex="0">
        <h3 class="c-brand--form__headline">
            <b class="uppercase">STEP 1:</b>
            Select Your Offer
        </h3>
    </div>

    <div class="offer u-pad--vert">

        <!-- // Top Set -->
        <div class="row offer__row offer__top">

            <!-- // Flawless Offers -->
            <div class="col width-at-66 mv-block">

                <div class="row row-to-center center-margin">
                    <div class="col fn--left">
                        <p><strong>How many FLAWLESS&trade; offers would you like?</strong><br>(1 unit per offer)</p>
                    </div>
                    <div class="col">
                        <div class="offer__price u-pad--horz">
                            <span class="price__currency">$</span>
                            <span class="price__dollar">19</span>
                            <span class="price__cent">99</span>
                        </div>
                    </div>
                    <div class="col">
                        <img src="/images/offers/free-shipping.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Free Shipping">
                    </div>
                </div>

                <ul class="offer__list offer--grid">

                	 <!-- // Item -->
                    <li class="offer__item">
                        <img class="item__img" src="/images/offers/color-teal.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Offer Available in Seaglass">
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-padding">
                                <select id="ActionQuantity0" name="ActionQuantity0" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode0" name="ActionCode0" type="hidden" value="SEA">
                            </span>
                        </label>
                        <span class="item__desc">Sea Glass</span>
                    </li>

                    <!-- // Item -->
                    <li class="offer__item">
                        <img class="item__img" src="/images/offers/White.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Offer Available in White">
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-padding">
                                <select id="ActionQuantity1" name="ActionQuantity1" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode1" name="ActionCode1" type="hidden" value="WHITE">
                            </span>
                        </label>
                        <span class="item__desc">White</span>
                    </li>

                    <!-- // Item -->
                    <li class="offer__item">
                        <img class="item__img" src="/images/offers/blush.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Offer Available in Blush">
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-padding">
                                <select id="ActionQuantity2" name="ActionQuantity2" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode2" name="ActionCode2" type="hidden" value="BLUSH">
                            </span>
                        </label>
                        <span class="item__desc">Blush</span>
                    </li>

                    <!-- // Item -->
                    <li class="offer__item">
                        <img class="item__img" src="/images/offers/Lavender.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Offer Available in Lavender">
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-padding">
                                <select id="ActionQuantity3" name="ActionQuantity3" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode3" name="ActionCode3" type="hidden" value="LAVEN">
                            </span>
                        </label>
                        <span class="item__desc">Lavender</span>
                    </li>




                </ul>

            </div>

            <!-- // Replacement Packs -->
            <div class="col width-at-33 fn--left mv-block">

                <p><strong>How many FLAWLESS&trade; Replacements Packs would you like?</strong></p>

                <ul class="offer__list offer--stack">

                    <!-- // Item -->
                    <li class="offer__item">
                        <div class="row-to-center">
                            <div class="col">
                                <img class="item__img" src="/images/offers/offer-packs-2.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Available in 2 Pack(s)">
                            </div>
                            <div class="col">
                                <div class="offer__price">
                                    <span class="price__currency">$</span>
                                    <span class="price__dollar">12</span>
                                    <span class="price__cent">99</span>
                                </div>
                            </div>
                        </div>
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-right-padding">
                                <select id="ActionQuantity5" name="ActionQuantity5" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode5" name="ActionCode5" type="hidden" value="R2">
                            </span>
                            <span class="col">
                                <span class="item__desc">2 Pack(s)</span>
                            </span>
                        </label>
                    </li>

                    <!-- // Item -->
                    <li class="offer__item">
                        <div class="row-to-center">
                            <div class="col">
                                <img class="item__img" src="/images/offers/offer-packs-4.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Available in 4 Pack(s)">
                            </div>
                            <div class="col">
                                <div class="offer__price u-pad--horz">
                                    <span class="price__currency">$</span>
                                    <span class="price__dollar">19</span>
                                    <span class="price__cent">99</span>
                                </div>
                            </div>
                            <div class="col">
                                <img src="/images/offers/free-shipping.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Free Shipping">
                            </div>
                        </div>
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-right-padding">
                                <select id="ActionQuantity6" name="ActionQuantity6" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode6" name="ActionCode6" type="hidden" value="R4">
                            </span>
                            <span class="col">
                                <span class="item__desc">4 Pack(s)</span>
                            </span>
                        </label>
                    </li>

                </ul>

            </div>

        </div>

        <div class="width-at-100 offer__brows">
        	<div class="center-margin option__brows">
        		<div class="row-to-top">
        			<div class="col top-padding">
        				<p><strong>How many FLAWLESS Brows&trade; units would you like?</strong></p>
        			</div>
        			<div class="offer__price left-padding price--expand">
                  <span class="price__currency">$</span>
                  <span class="price__dollar">19</span>
                  <span class="price__cent">99</span>
              </div>
        		</div>
        		<div class="row-to-top">
        			<div class="col">
        				<label class="row-to-center">
        					<span class="col">
		                <span class="item__req" data-required>Qty</span>
		              </span>
		              <span class="col left-right-padding">
		              	<input id="ActionCode9" name="ActionCode9" type="hidden" value="BROW">
									  <select id="ActionQuantity9" name="ActionQuantity9">
					            <option>0</option>
									    <option>1</option>
									    <option>2</option>
									  </select>
		              </span>
		              <span class="col">
		              	1 unit per offer
		              </span>
        				</label>
        			</div>
        			<div class="col">
        				<img src="/images/offers/2.0000/brows.png?appV=<%= DtmContext.ApplicationVersion %>" alt="no replacement heads available">
        			</div>
        		</div>
        	</div>
        </div>

        <!-- // Bottom Set -->
        <div class="offer__row offer__bottom row-to-center">

            <div class="col mv-block">

                <!-- // Item -->
                <div class="offer__list row-to-center width-at-100">
                    <div class="col @xs-u-vw offer__item width-at-40">
                        <p><strong>How many FLAWLESS&trade; Legs units would you like?</strong></p>
                        <div class="offer__price price--expand">
                            <span class="price__currency">$</span>
                            <span class="price__dollar">59</span>
                            <span class="price__cent">98</span>
                        </div>
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-right-padding">
                                <select id="ActionQuantity7" name="ActionQuantity7" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode7" name="ActionCode7" type="hidden" value="LEG">
                            </span>
                            <span class="col">
                                <span class="item__desc">1 unit per offer</span>
                            </span>
                        </label>
                    </div>
                    <div class="col @xs-u-vw width-at-60">
                        <img src="/images/offers/legs.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Available per unit">
                    </div>
                </div>

            </div>

            <div class="col mv-block">

                <!-- // Item -->
                <div class="offer__list row-to-center">
                    <div class="col @xs-u-vw offer__item">
                        <p><strong>How many FLAWLESS&trade; Legs Replacement Heads would you like?</strong></p>
                        <div class="offer__price price--expand">
                            <span class="price__currency">$</span>
                            <span class="price__dollar">24</span>
                            <span class="price__cent">99</span>
                        </div>
                        <label class="item__label row-to-center">
                            <span class="col">
                                <span class="item__req" data-required>Qty</span>
                            </span>
                            <span class="col left-right-padding">
                                <select id="ActionQuantity8" name="ActionQuantity8" class="c-brand--form__select o-box o-shadow u-vw fx--animate">
                                    <option>0</option>
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <input id="ActionCode8" name="ActionCode8" type="hidden" value="LEGREP">
                            </span>
                            <span class="col">
                                <span class="item__desc item__desc--abs">1 Piece Disk<br>That Includes All<br>4 Heads Built-In!</span>
                            </span>
                        </label>
                    </div>
                    <div class="col @xs-u-vw">
                        <img src="/images/offers/2.0000/replacement-heads.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Available per unit">
                    </div>
                </div>

            </div>

        </div>

</fieldset>
<!-- // END #productSelection -->