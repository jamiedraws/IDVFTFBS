<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>
<%
    var isStartPage = DtmContext.Page.IsStartPageType;
    var isShoppingCart = string.Equals(DtmContext.PageCode, "shoppingcart", StringComparison.OrdinalIgnoreCase);
    var isCheckout = string.Equals(DtmContext.PageCode, "checkout", StringComparison.OrdinalIgnoreCase);
    var bazaarVoiceEnvironment = DtmContext.IsStage ? "staging" : "production";
    var fireConversion = true;
%>

<% if (isStartPage) { %>
<script src="/shared/js/jquery.min.js"></script>
<% } %>


<script async src="https://apps.bazaarvoice.com/deployments/flawlesscleanse/main_site/<%=bazaarVoiceEnvironment %>/en_US/bv.js"></script>

<%
    if (!string.Equals(DtmContext.PageCode, "confirmation", StringComparison.InvariantCultureIgnoreCase))
    {
%>
<script type="text/javascript" src="/shared/js/common.js"></script>
<%
    }
%>




<% if (DtmContext.Page.PageCode == "Index")
    { %>
<script async src="https://www.tiktok.com/embed.js"></script>
<% } %>

<% if (isStartPage)
    {
        var sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
        var cart = sitemap.GetItemById("cart");
%>
<script type="text/templates" id="CustomerCartStatusTemplate">
            <section id="customer-cart-status" data-modal-dialog-container data-modal-dialog-title="Customer Cart Status" aria-labelledby="customer-cart-status-title" class="view customer-cart-status section">
                <div class="view__in customer-cart-status__in section__in">
                    <div class="customer-cart-status__group">
                        <div id="customer-cart-status-title" class="customer-cart-status__response">{{Status}}</div>
                        <div data-template-test class="customer-cart-status__action">
                            <button type="button" data-modal-dialog-actor="close" data-modal-dialog-id="customer-cart-status" class="button customer-cart-status__button">
                                <span>Continue Shopping</span>
                            </button>
                        </div>
                        <div class="customer-cart-status__action">
                            <a href="<%= cart.Page %>" class="button customer-cart-status__button">
                                <span>Checkout</span>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
</script>

<% Html.RenderPartial("FrameworkJs");

    if (isShoppingCart || isCheckout)
    {%>
<script>
    $(window).on("load", function () {
        $('.ddlPromoButton').on('keyup keypress', function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode === 13) {
                e.preventDefault();
                return false;
            }
        });
    });

    //disable enter key on loginForm submitButtons
    $('#loginForm').on("keydown", ":input:not(:submit)", function (event) {
        if (event.key == "Enter") {
            event.preventDefault();
        }
    });


    $('#AcceptOfferButton').bind("click", validateForm);

    /*
    registerEvent('CartChange', function (event) {
            var validationText = $(".validation-summary-errors").text();
            if (typeof (event.detail.promoCodeTarget) === 'string' || validationText != "" || $("#promoCode").val() == "") {
                $("#promoCode").val("");
            } else {
                window.cartToast.post("Promo code has been applied");
                window.cartToast.show();
                setTimeout(function () { window.cartToast.hide(); }, 3000);
            }
    });
    */

    //Logic to handle prepopulation of addresses for Current Customers
    $('[data-prepopulate-address]').on('change', function () {

        let dropDown = $(this);
        let dValue = dropDown.val();
        let type = $(this).data('prepopulate-address');

        if (dValue != "") {
            let option = $('option[value=' + dValue + ']');
            if (typeof option !== "undefined") {
                $('#' + type + 'FirstName').val(option.attr('data-firstName'));
                $('#' + type + 'LastName').val(option.attr('data-lastName'));
                $('#' + type + 'Street').val(option.attr('data-street'));
                $('#' + type + 'Street2').val(option.attr('data-street2'));
                $('#' + type + 'City').val(option.attr('data-city'));
                $('#' + type + 'State').val(option.attr('data-state'));
                $('#' + type + 'Zip').val(option.attr('data-zip'));
            }
        }

    });

    $('#ShippingIsDifferentThanBilling').on('click', function () {
        $('[data-prepopulate-address]').change();
    });

    if ("_dtm" in window && "expressCheckout" in _dtm) {
        _dtm.expressCheckout = function () { };
    }
</script>

<%}
    else
    { %>
<div class="hide">
    <%= Html.Partial("OrderFormReviewTable") %>
</div>
<% } %>

<% }
    else if (string.Equals(DtmContext.Page.PageCode, "confirmation", StringComparison.InvariantCultureIgnoreCase))
    {
        
%>
<!--load transaction event and parameters-->
<script type="text/javascript">

    (function (w) {

        function trackPixelEvent(label, detail) {
            var xhttp = new XMLHttpRequest();
            xhttp.open("Post", "/shared/services/pixelservice.ashx?at=track");
            xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhttp.send("event=" + label+"&details=" + detail);
        }

        function fireConversion(BV) {
            let firePixel;
            try {
                var response = JSON.parse(this.responseText);

                firePixel = response.FirePixel;
            } catch (e) {
                firePixel = true;
            }

            trackPixelEvent("BVPixelVerified", "FirePixel " + firePixel);

            if (firePixel) {
                BV.pixel.trackTransaction({
                    "currency": "USD",
                    "orderId": "<%=DtmContext.Order.OrderID%>",
                    "total": "<%=DtmContext.Order.SubTotal.ToString("0.00")%>",
                    "discount": "<%= Math.Abs(DtmContext.Order.OrderItems.Where(oi=> oi.Price < 0).Sum(oi=> oi.Price * oi.Quantity)).ToString("0.00")%>",
                    "items": [

<%
    foreach (var item in DtmContext.Order.OrderItems.Where(oi => oi.Price > 0))
    {
        // the images associated with the current campaign product
        var productImages = new ProductImages(item.CachedProductInfo.ProductCode);
        var defaultImage = productImages.SetFirstImageOrDefault("/images/UPGRADE/products/default.svg");

%>
                        {
                            "name": "<%= item.CachedProductInfo.ProductName %>",
                            "price": "<%= item.Price.ToString("0.00") %>",
                            "quantity": "<%= item.Quantity%>",
                            "productId": "<%= item.CachedProductInfo.PropertyIndexer["BazaarVoiceID"] ?? string.Empty%>",
                            "imageURL": "<%= DtmContext.Domain.FullDomainCustomPath(defaultImage) %>"
                        }
        <%if (item != DtmContext.Order.OrderItems.Where(oi => oi.Price > 0).LastOrDefault())
    { %>,<%}%>
<%
    }
%>
                    ],
                    "email": "<%= DtmContext.Order.Email%>",
                    "locale": "en_US"
                });
            }
        }

        w.bvCallback = function (BV) {
            var xhttp = new XMLHttpRequest();
            xhttp.addEventListener("loadend", fireConversion.bind(xhttp, BV));
            xhttp.open("Post", "/shared/services/VerifyPixelFire.ashx");
            xhttp.setRequestHeader("Content-Type", "application/json");
            xhttp.send(JSON.stringify({
                label: 'BazaarVoiceConversion',
            }));

            trackPixelEvent("BVPixelTriggered");
        };

    })(window);




</script>

<% 
    } %>

<div class="l-controls left-absolute top-absolute @print-only-hide">
    <% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
    <% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
    <% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
    <style>
        .hud {
            display: none;
        }
    </style>
</div>

<script>
    //updateAddToCartSection();

    function updateAddToCartSection() {
        $('.product-variant__radio').click(function () {
            var newAddToCartSection = $("#" + this.value + "_AddToCartSection");
            var str = $(this.name).selector;
            var groupSectionValue = str.substring(
                str.indexOf("-") + 1,
                str.lastIndexOf("-")
            );
            var addToCartGroupSection = $("." + groupSectionValue + "_AddToCartSectionGroup");

            addToCartGroupSection.hide();
            newAddToCartSection.show();
        });
    }

    const setBraintreeHostedFieldsStyles = function () {
        return {
            'font-size': '1em',
            'font-family': 'Helvetica, Arial, sans-serif',
            'font-weight': 'normal',
            'line-height': 'normal',
            'color': '#333',
        };
    };
</script>
<script>
    window.addEventListener("klaviyoForms", function (e) {
        console.log("klaviyo test", e);

        if (e && e.detail && e.detail.type == 'submit') {
            var formEvent = e.detail;
            if (formEvent.formId == 'T9QMVM' || formEvent.formId == 'TXkScX') {
                var promo = document.getElementById("promoCode");
                var btn = document.getElementById("emailSubscribeButton");
                if (promo && btn) {
                    promo.value = "WELCOME10";
                    btn.click();
                } else {
                    handleCartChange("WELCOME10", 1);
                }

            }
        }
    });
</script>
