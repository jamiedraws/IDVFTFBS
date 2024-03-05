<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<style>
.dtm .c-brand--form__field img {
    width: 40px;
}
.labelColon {
    display: none;
}
@media all and ( min-width : 769px ) {
    .snippet--od--sm {
        display: none;
    }
}

@media all and ( max-width : 768px ) {
    .snippet--od--lg {
        display: none;
    }
}
</style>
<%-- Html.RenderSnippet("FORMTOP"); --%>
<div id="form" class="form-wrapper inner u-vw--100 u-pad c-brand--form">
<!-- <div class="form-wrapper inner"> -->
    <% using (Html.BeginForm())
       { %>
    <!-- <div id="form" class="o-grid--block u-vw--100 u-pad c-brand--form"> -->
        <%=Html.ModeSwitchLinkOrder() %>


    <div class="center-text">
        <h2 class="uppercase form__title">Shopping Cart</h2>
        <p class="form__text">Fill out the information below to complete your order</p>
    </div>

        <div>
            <span style="color: #FF0000; font-weight: bold">
                <%=Html.ValidationSummary("The following errors have occurred:")%>
            </span>
        </div>


        <%--Html.RenderSnippet("PRODUCTSELECTION");--%>

        <%  Html.RenderPartial("OrderFormReviewTable"); %>

        <div class="o-grid u-vw--100">

                <div class="c-brand--form__col--left o-grid__col @sm-u-vw--50 @mv-u-mar--vert">

                    <%-- // BEGIN #paymentForm --%>
                    <fieldset id="paymentForm" class="c-brand--form__fieldset">

                        <div class="c-brand--form__legend u-vw--100">
                            <h3 class="c-brand--form__headline fn--ucase"><strong class="fn--strong">Step 2: </strong>Enter your credit card information</h3>
                        </div>


                        <!--<hr class="c-hr u-mar--horz">-->

                        <ul class="c-brand--form__list u-pad">

                            <li class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label class="c-brand--form__label c-brand--form__cc-icons @sm-o-grid--none o-grid__col @xs-u-vw--30 fn--right"></label>
                                <div id="cc" class="c-brand--form__field o-grid__col @xs-u-bs--reset @xs-u-vw--100">
                                    <img src="<%= ( Model.IsMobile ? "/shared/mobile/images/cc.png" : "/shared/images/cc.png" ) %>" alt="These credit cards are accepted.">
                                </div>
                            </li>

                            <li id="CardTypeCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label for="CardType" data-required class="c-brand--form__label @sm-o-grid--none o-grid__col @xs-u-vw--30 fn--right">Type</label>
                                <%= Html.DropDownList("CardType", new[]
                                    {
                                      new SelectListItem { Text = "Visa", Value = "V"},
                                      new SelectListItem { Text = "Mastercard", Value = "M"},
                                      new SelectListItem { Text = "Discover", Value = "D"},
                                      new SelectListItem { Text = "American Express", Value= "AX"}
                                  }, new { @class = "fld c-brand--form__select o-box o-shadow u-vw--100 u-anim" })
                                %>
                            </li>

                            <li id="CardNumberCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="CardNumberLabel" for="CardNumber" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Card Number</label>
                                <input id="CardNumber" name="CardNumber" type="tel" value="<%= ViewData["CardNumber"] %>" placeholder="#################" aria-labelledby="CardNumberLabel" aria-required="true" class="fld c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="CardExpirationCt" class="o-grid--vert--center u-vw--100 c-brand--form__item">
                                <label for="CardExpirationMonth" data-required class="@sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right c-brand--form__label">Expiration Date</label>
                                <div class="c-brand--form__field o-grid @xs-u-vw--100 u-bs--reset">
                                    <div class="o-grid__col u-vw--50 u-pad--right">
                                        <%= Html.CardExpirationMonth("CardExpirationMonth", new { @class = "c-brand--form__select o-box o-shadow u-vw--100 u-anim" }) %>
                                    </div>
                                    <div class="o-grid__col u-vw--50 u-pad--left">
                                        <%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @class = "fld c-brand--form__select o-box o-shadow u-vw--100 u-anim" }) %>
                                    </div>
                                </div>
                            </li>

                            <li id="CardCvv2Ct" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="CardCvv2Label" for="CardCvv2" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">CVV2</label>
                                <div class="c-brand--form__field o-grid @xs-u-vw--100 u-bs--reset">
                                    <div class="o-grid__col u-vw--50 u-bs--reset u-pad--right">
                                        <input id="CardCvv2" name="CardCvv2" type="tel" value="<%= ViewData["CardCvv2"] %>" maxlength="5" placeholder="CVV2" aria-labelledby="CardCvv2Label" aria-required="true" class="fld c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 u-anim">
                                    </div>
                                    <div class="o-grid__col u-vw--50 u-bs--reset u-pad--left">
                                        <a id="cvv2" class="c-brand--form__hint o-grid__col @xs-u-vw--100 u-pad u-push--left has-fancybox fancybox.ajax" href="/shared/cvv.html">What is CVV2?</a>
                                    </div>

                                </div>
                            </li>

                        </ul>
                    </fieldset>
                    <%-- // END #paymentForm --%>

                    <fieldset id="promoCode" class="c-brand--form__fieldset">

    <div class="c-brand--form__legend u-vw--100">
                            <h3 class="c-brand--form__headline fn--ucase bold">Add Promo Code<span class="right">+</span></h3>
                        </div>

    <div class="hide promo success-message-container" id="promo">

	<div class="inner">

    <label class="promo__label" for="promoCode">
        <strong>PROMO CODE:</strong>
    </label>

    <div class="row-to-center u-vw--100">


        <!-- // Promo Text Field -->
        <div class="col @mv-u-vw--50 @dv-u-pad--right @mv-u-pad--reset">
            <input type="text" class="ddlPromo u-vw--100 c-brand--form__input o-box o-shadow fx--animate" name="promoCode" id="promoCode">
        </div>


        <!-- // Promo Button -->
        <div class="col @mv-u-vw--50 u-mar--top">
            <input type="button" class="confirm-button ddlPromoButton u-vw--100" value="Apply Code" value="Apply Code">
        </div>

    </div>


    <!-- // Promo Validation Message -->
    <div class="promo__message hide center-text top-margin">
        <div class="container bg--white u-vw--100 no-margin">
            <p id="promoTxt" class="message__in column-block no-margin">Thank you! Your promo code was applied.</p>
        </div>
    </div>
	</div>

</div>
    </fieldset>

                    <fieldset class="snippet--od snippet--od--lg">
                        <div class="snippet--od o-box u-vw--100 u-mar--center" tabindex="0">
                                <% Html.RenderSnippet("OFFERDETAILS"); %>
                            </div>
                    </fieldset>
                </div><!-- end .col -->

                <div class="c-brand--form__col--right o-grid__col @sm-u-vw--50 @mv-u-mar--vert">

                    <%-- // BEGIN #billingInformation --%>
                    <fieldset id="billingInformation" class="c-brand--form__fieldset">

                        <div class="c-brand--form__legend u-vw--100">
                            <h3 class="c-brand--form__headline fn--ucase"><strong class="fn--strong">Step 3: </strong>Enter your billing information</h3>
                        </div>

                        <ul class="c-brand--form__list u-pad">

                            <li id="BillingFullNameCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingFullNameLabel" for="BillingFullName" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Full Name</label>
                                <input id="BillingFullName" maxlength="50" name="BillingFullName" type="text" value="<%= ViewData["BillingFullName"] %>" placeholder="*Full Name:" aria-labelledby="BillingFullNameLabel" aria-required="true" class="fld c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>


                            <li id="BillingStreetCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingStreetLabel" for="BillingStreet" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Address</label>
                                <div class="o-grid__col @xs-u-bs--reset @xs-u-vw--70 fld">
                                    <input id="BillingStreet" name="BillingStreet" type="text" value="<%= ViewData["BillingStreet"] %>" maxlength="50" placeholder="Street Address" aria-labelledby="BillingStreetLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                                </div>
                            </li>

                            <li id="BillingStreet2Ct" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingStreet2Label" for="BillingStreet2" class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Address 2</label>
                                <input id="BillingStreet2" name="BillingStreet2" type="text" value="<%= ViewData["BillingStreet2"] %>" maxlength="50" placeholder="Suite / Apt" aria-labelledby="BillingStreet2Label" aria-required="false" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="BillingCityCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingCityLabel" for="BillingCity" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">City</label>
                                <input id="BillingCity" name="BillingCity" type="text" value="<%= ViewData["BillingCity"] %>" maxlength="50" placeholder="City" aria-labelledby="BillingCityLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="BillingCountryCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingCountryLabel" for="BillingCountry" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Country</label>

                                <%=Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName"), new { @class = "fld cartParam shipOptions c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 u-anim" })%>

                            </li>

                            <li id="BillingStateCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingStateLabel" for="BillingState" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">State</label>
                                <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName"), "Choose State", new { @class = "fld shipOptions c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 u-anim" }) %>
                            </li>

                            <li id="BillingZipCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="BillingZipLabel" for="BillingZip" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Zip</label>
                                <input id="BillingZip" name="BillingZip" type="tel" value="<%= ViewData["BillingZip"] %>" maxlength="50" placeholder="Zip Code" aria-labelledby="BillingZipLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="PhoneCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="PhoneLabel" for="Phone" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Phone</label>
                                <input id="Phone" name="Phone" type="tel" value="<%= ViewData["Phone"] %>" maxlength="50" placeholder="###-###-####" aria-labelledby="PhoneLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="EmailCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="EmailLabel" for="Email" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Email</label>
                                <input id="Email" name="Email" type="email" value="<%= ViewData["Email"] %>" maxlength="50" placeholder="email@website.com" aria-labelledby="EmailLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                        </ul>

                    </fieldset>
                    <%-- // END #billingInformation --%>




                    <%-- // BEGIN #ShippingIsSame --%>
                    <label id="ShippingIsSame" for="ShippingIsDifferentThanBilling" class="o-grid--vert--center">
                        <div class="o-grid__col u-vw--10 u-pad"><%=Html.CheckBoxFor(m => m.ShippingIsDifferentThanBilling, new { @class = "shipOptions c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 u-anim" })%></div>
                        <p class="o-grid__col u-pad">Check if your shipping address is different than your billing address</p>
                    </label>
                    <%-- // END #ShippingIsSame --%>



                    <%-- // BEGIN #shippingInformation --%>
                    <fieldset id="shippingInformation" class="c-brand--form__fieldset">

                        <div class="c-brand--form__legend u-vw--100">
                            <h3 class="c-brand--form__headline fn--ucase"><strong class="fn--strong">Step 4: </strong>Enter your shipping information</h3>
                        </div>

                        <ul class="c-brand--form__list u-pad">

                            <li id="ShippingFullNameCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="ShippingFullNameLabel" for="ShippingFullName" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Full Name</label>
                                <input id="ShippingFullName" name="ShippingFullName" type="text" value="<%= ViewData["ShippingFullName"] %>" maxlength="50" placeholder="*Full Name:" aria-labelledby="ShippingFullNameLabel" aria-required="true" class="fld c-brand--form__input o-grid__col o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="ShippingStreetCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="ShippingStreetLabel" for="ShippingStreet" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Address</label>
                                <input id="ShippingStreet" name="ShippingStreet" type="text" value="<%= ViewData["ShippingStreet"] %>" maxlength="50" placeholder="Street Address" aria-labelledby="ShippingStreetLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="ShippingStreetCt2" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="ShippingStreet2Label" for="ShippingStreet2" class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Address</label>
                                <input id="ShippingStreet2" name="ShippingStreet2" type="text" value="<%= ViewData["ShippingStreet2"] %>" maxlength="50" placeholder="Suite / Apt" aria-labelledby="ShippingStreet2Label" aria-required="false" class="c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="ShippingCityCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="ShippingCityLabel" for="ShippingCity" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">City</label>
                                <input id="ShippingCity" name="ShippingCity" type="text" value="<%= ViewData["ShippingCity"] %>" maxlength="50" placeholder="City" aria-labelledby="ShippingCityLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                            <li id="ShippingCountryCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label for="ShippingCountry" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Country</label>
                                <%=Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", new { @class = "fld shipOptions c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 u-anim" }))%>
                            </li>

                            <li id="ShippingStateCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label for="ShippingState" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">State</label>
                                <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName"), "Choose State", new { @class = "fld shipOptions c-brand--form__select o-grid--col o-box o-shadow @xs-u-vw--100 u-anim" })%>
                            </li>

                            <li id="ShippingZipCt" class="c-brand--form__item o-grid--vert--center u-vw--100">
                                <label id="ShippingZipLabel" for="ShippingZip" data-required class="c-brand--form__label @sm-o-grid--none  o-grid__col @xs-u-vw--30 fn--right">Zip</label>
                                <input id="ShippingZip" name="ShippingZip"  type="tel" value="<%= ViewData["ShippingZip"] %>" maxlength="10" placeholder="Zip Code" aria-labelledby="ShippingZipLabel" aria-required="true" class="fld c-brand--form__input o-box o-shadow @xs-u-vw--100 u-anim">
                            </li>

                        </ul>

                    </fieldset>
                    <%-- // END #shippingInformation --%>
                </div><!-- .col -->

            </div>

            <div class="o-grid--vert--center u-vw--100">
                <fieldset class="snippet--od snippet--od--sm">
                    <div class="snippet--od o-box u-vw--100 u-mar--center" tabindex="0">
                            <% Html.RenderSnippet("OFFERDETAILS"); %>
                        </div>
                </fieldset>

                <%-- // BEGIN #calltoAction --%>
                <fieldset id="calltoAction" class="c-brand--form__fieldset c-brand--form__fieldset--borderless center-margin">

                    <ul class="c-brand--form__list @mv-u-pad--vert">

                        <li class="c-brand--form__item o-grid--vert--center u-vw--100 u-mar--top">
                            <input type="submit" id="AcceptOfferButton" name="acceptOffer" class="u-mar--center u-pad btn orderbtn" alt="Process Order" value="Process Order" />
                        </li>

                        <li class="c-brand--form__item o-grid--vert--center u-vw--100 fn--center">
                            <p id="click">By clicking the Order Now button you are placing a live order and agreeing to the terms of our 60 day money back guarantee and our <a href="/shared/Customers/67/arbitration.html" class="has-fancybox fancybox.ajax" title="Read our arbitration agreement?">arbitration agreement</a>.</p>
                        </li>

                        <li class="c-brand--form__item o-grid--vert--center u-vw--100">
                            <p>
                                <% Html.RenderSiteControl("InsureShipCheckbox"); %>
                            </p>
                        </li>
                        <li class="c-brand--form__item o-grid--vert--center u-vw--100">
                            <p>
                                <img src="/shared/images/PositiveSSL_tl_trans.png?appV=<%= DtmContext.ApplicationVersion %>" alt="SSL" class="u-mar--center u-mar--horz" />
                            </p>
                        </li>

                    </ul>

                </fieldset>
                <%-- // END #calltoAction --%>

            </div>


        <% } %>
    </div>
    <!-- END id="form" -->
    <div class="clearer">
    </div>

    <script>
        /*
         Role: Hide the extra space beside the payment icons only when ExpressCheckout.js has been requested and the form has been redrawn.
         */
        (function () {
            const elementExists = function (element) {
                let result = false;
                if (element) {
                    let length = element.length;
                    if (length !== undefined) {
                        result = length;
                    } else {
                        result = document.body.contains(element);
                    }
                }
                return result;
            };

            const updatePaymentIconsLabel = function () {
                const label = document.querySelector(".c-brand--form__cc-icons");

                if (elementExists(label)) {
                    label.classList.add("hide");
                }
            };

            addEventListener("ECDrawFormComplete", updatePaymentIconsLabel);
        }());
    </script>

</asp:Content>
