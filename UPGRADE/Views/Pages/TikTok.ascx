<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<%
    var accountId = (ViewData["AccountId"] as string) ?? string.Empty;
    var fireMode = (ViewData["FIREMODE"] as string) ?? string.Empty;
    var isMicroSite = string.Equals(fireMode, "Microsite", StringComparison.InvariantCultureIgnoreCase);
    var isShoppingCart = string.Equals(fireMode, "ShoppingCart", StringComparison.InvariantCultureIgnoreCase);
    var isCheckoutPage = string.Equals(DtmContext.PageCode, "checkout", StringComparison.InvariantCultureIgnoreCase)
        || string.Equals(DtmContext.PageCode, "shoppingcart", StringComparison.InvariantCultureIgnoreCase);
    var pageUri = Request.Url.AbsoluteUri.ToLower();
    var isProductDetailPage = pageUri.Contains("product") || pageUri.Contains("detail");
    var pageControlKey = ((ViewData["ControlId"] as string) ?? string.Empty) + "_" + accountId;
    var completeStatuses = new[] { 2, 3, 11, 12 };
    var hasFiredSale = DtmContext.FiredConversionCodes.Any(p => p.Equals(pageControlKey, StringComparison.InvariantCultureIgnoreCase));
    var firePixelSale = DtmContext.Order != null && !DtmContext.Order.IsPotentiallyFraudulent && !hasFiredSale
      && (completeStatuses.Contains(DtmContext.Order.OrderStatusId) || (DtmContext.Order.CardType != null && DtmContext.Order.CardType.ToUpper().Equals("PAYPALEC")))
      && !DtmContext.Page.IsStartPageType;
    var defaultProductGroupContentId = DtmContext.CampaignCode + DtmContext.Version.ToString("F0");
    var defaultValue = "0.00";
    var tikTokProducts = new List<TikTokProduct>();

    if (DtmContext.CampaignProducts != null)
    {
        defaultValue = DtmContext.CampaignProducts
           .Where(cp => cp.ProductTypeId == 1)
           .Select(cp => cp.Price)
           .FirstOrDefault()
           .ToString("#.00");

        foreach (var campaignProduct in DtmContext.CampaignProducts)
        {
            tikTokProducts.Add(new TikTokProduct { ProductCode =  campaignProduct.ProductCode, ProductPrice = campaignProduct.Price});
        }
    }
    var tikTokProductsJson = JsonConvert.SerializeObject(tikTokProducts);
    if (firePixelSale)
    {
        DtmContext.FiredConversionCodes.Add(pageControlKey);
    }
%>

<!-- Begin Impression -->

<script>
    !function (w, d, t) {
        w.TiktokAnalyticsObject = t;
        var ttq = w[t] = w[t] || [];
        ttq.methods = ["page", "track", "identify", "instances", "debug", "on", "off", "once", "ready", "alias", "group", "enableCookie", "disableCookie"], ttq.setAndDefer = function (t, e) {
            t[e] = function () {
                t.push([e].concat(Array.prototype.slice.call(arguments, 0)))
            }
        };
        for (var i = 0; i < ttq.methods.length; i++) ttq.setAndDefer(ttq, ttq.methods[i]);
        ttq.instance = function (t) {
            for (var e = ttq._i[t] || [], n = 0; n < ttq.methods.length; n++) ttq.setAndDefer(e, ttq.methods[n]);
            return e
        }, ttq.load = function (e, n) {
            var i = "https://analytics.tiktok.com/i18n/pixel/events.js";
            ttq._i = ttq._i || {}, ttq._i[e] = [], ttq._i[e]._u = i, ttq._t = ttq._t || {}, ttq._t[e] = +new Date, ttq._o = ttq._o || {}, ttq._o[e] = n || {};
            var o = document.createElement("script");
            o.type = "text/javascript", o.async = !0, o.src = i + "?sdkid=" + e + "&lib=" + t;
            var a = document.getElementsByTagName("script")[0];
            a.parentNode.insertBefore(o, a)
        };

        ttq.load('<%=accountId%>');
        ttq.page();

    function postAdvancedMatching(email, phone) {
        if (email !== '' && phone !== '') {
            ttq.identify({
                            email: email,
                            phone_number: phone
                    });
                }
        }

        function getFormattedParameters() {
            let emailElement = document.getElementById("Email"),
                phoneElement = document.getElementById("Phone");

            let advancedMatching = { formattedEmail: "", formattedPhone: "" };

            if (emailElement && validateEmail(emailElement.value)) {
                advancedMatching.formattedEmail = emailElement.toLowerCase();
            }
            if (phoneElement && validatePhone(phoneElement.value)) {
                advancedMatching.formattedPhone = "+1" + phoneElement.value.replace(/[^0-9\\.]+/g, '');
            }

            return advancedMatching;
        }

        function validateEmail(email) {
            if (isEmpty(email)) {
                return false;
            }
            let reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            return reg.test(email);
        }

        function validatePhone(phone) {
            if (isEmpty(phone)) {
                return false;
            }

            return phone.length >= 10;
        }

        function isEmpty(value) {
            if (value == null) return true;
            let str = value.replace(/^\s\s*/, "").replace(/\s\s*$/, "");
            return str.length == 0;
        }


    <%
    if (DtmContext.Page.IsStartPageType)
    {

        %>
        let _currentCart = {};

        function addToCart(cart) {
            var contents = [];
            var total = 0;
            for (var i = 0; i < cart.items.length; i++) {
                var item = cart.items[i];
                if ((!_currentCart[item.code] || _currentCart[item.code] != item.qty) && item.price >= 0) {
                    contents.push({
                        content_type: 'product',
                        content_id: item.code,
                        price: item.price,
                        quantity: item.qty
                    });
                    total += (item.price * item.qty);
                }

                _currentCart[item.code] = item.qty;
            }

            if (contents.length > 0) {
                ttq.instance('<%=accountId%>').track('AddToCart', {
                    contents: contents,
                    value: total.toFixed(2),
                    currency: 'USD'
                });
            }
        }

        function initiateCheckout() {
            let parameters = getFormattedParameters();
            postAdvancedMatching(parameters.email, parameters.phone);

            ttq.instance('<%=accountId%>').track('InitiateCheckout', {
                content_type: 'product_group',
                content_id: '<%=defaultProductGroupContentId%>'
            });
        }


        <%  if (isMicroSite)
    { %>

        ttq.instance('<%=accountId%>').track('ViewContent', {
            content_type: 'product_group',
                    content_id: '<%=defaultProductGroupContentId%>'
                });


        let _hasInteracted = false;
        addEventListener('CartChange', function (e) {
            if (_hasInteracted) {
                addToCart(e.detail);
            }
        });

        function createObserver() {
            let observer;

            let options = {
                root: null
            };

            observer = new IntersectionObserver(handleIntersect, options);

            let prodSelection = document.getElementById("productSelection");

            if (prodSelection) {
                observer.observe(prodSelection);
            }
            
        }

        function setInteracted(fireCart) {
            _hasInteracted = true;
            if (fireCart) {
                var code = document.getElementById("ActionCode0").value;
                ttq.instance('<%=accountId%>').track('AddToCart', {
                    content_type: 'product',
                    content_id: code,
                    value: <%=defaultValue%>,
                    currency: 'USD'
                });
            }
        }

        function handleIntersect(entries, observer) {
            for (var i = 0; i < entries.length; i++) {
                let entry = entries[i]
                if (entry.isIntersecting) {
                    setInteracted(false);
                    observer.unobserve(entry.target);
                }
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            if (document.getElementById("BillingFullName")) {
                document.getElementById("BillingFullName").addEventListener("change", initiateCheckout);
            }
            if (document.getElementById("BillingFirstName")) {
                document.getElementById("BillingFirstName").addEventListener("change", initiateCheckout);
            }

            var orderNowBtns = document.querySelectorAll("[href='#order']");
            for (var i = 0; i < orderNowBtns.length; i++) {
                orderNowBtns[i].addEventListener('click', function () { setInteracted(true); });
            }
            createObserver();
        });
        <%      }
    else if (isShoppingCart)
    {

        if (isProductDetailPage) 
        {
            %>
        ttq.instance('<%=accountId%>').track('ViewContent', {
            content_type: 'product_group',
                  content_id: '<%=defaultProductGroupContentId%>'
              });

            <%
        }

        if (isCheckoutPage)
        {%>

        initiateCheckout();

        <%}%>

        var tiktokProducts = <%=tikTokProductsJson%>;


        document.querySelector("body").addEventListener('click', function (e) {
            var buttonElement = e.target.closest("a[data-products]");
            if (buttonElement) {
                let cartProductCode = e.srcElement.getAttribute("data-products");
                let quantityElement = document.getElementById(cartProductCode + "Qty"<% if (isProductDetailPage) {%>+ "_PDP"<%} %>);
                let itemQuantity = parseInt(quantityElement.value);
                let itemMaxQuantity = parseInt(quantityElement.getAttribute("data-max-qty"));
                let item = { code: cartProductCode, price: getItemPrice(cartProductCode), qty: itemQuantity };

                if (canTriggerAddToCart(item, itemQuantity, itemMaxQuantity)) {
                    let parameters = getFormattedParameters();
                    postAdvancedMatching(parameters.email, parameters.phone);
                    addToCartCheckout(item);
                }
            }
        });

        function canTriggerAddToCart(tiktokItem, itemAddQuantity, itemMaxQuantity) {
            let cantriggerAddToCart = false;
            let items = getItems();
            let itemsCount = items.length;

            if (items.length === 0) {
                cantriggerAddToCart = true;
            }
            else {
                for (let i = 0; i < itemsCount; i++) {
                    if (!cantriggerAddToCart && tiktokItem.code === items[i].id && (items[i].qty + itemAddQuantity) <= itemMaxQuantity) {
                        cantriggerAddToCart = true;
                    }
                    else if (!cantriggerAddToCart && !items[tiktokItem.code]) {
                        cantriggerAddToCart = true;
                    }
                }
            }

            return cantriggerAddToCart;
        }

        function getItemPrice(productCode) {
            let productsCount = tiktokProducts.length;
            let price = 0.00;

            for (let i = 0; i < productsCount; i++) {
                if (tiktokProducts.length > 0 && tiktokProducts[i].ProductCode === productCode) {
                    price = tiktokProducts[i].ProductPrice;
                    break;
                }
            }

            return price;
        }

        function addToCartCheckout(item) {
            var contents = [];
            contents.push({
                content_type: 'product',
                content_id: item.code,
                price: item.price,
                quantity: item.qty
            });
            var total = (item.price * item.qty);

            if (contents.length > 0) {
                ttq.instance('<%=accountId%>').track('AddToCart', {
                    contents: contents,
                    value: total.toFixed(2),
                    currency: 'USD'
                });
            }
        }

        <%}

    }

    if (firePixelSale)
    {
        var orderTotal = DtmContext.Order.OrderItems.Sum(oi => (oi.Price + oi.Shipping) * oi.Quantity).ToString("N2");
        var phone = DtmContext.Order.Phone ?? string.Empty;
        var email = DtmContext.Order.Email.ToLower();
%>
        var phoneNumber = "<%=Regex.Replace(phone, "[^0-9]+", string.Empty)%>";
        var formattedPhoneNumber = (phoneNumber === "")
            ? phoneNumber
            : ('+1' + phoneNumber);

        postAdvancedMatching('<%=email%>', formattedPhoneNumber);
        ttq.instance('<%=accountId%>').track('CompletePayment',
            {
                content_type: 'product_group',
                content_id: '<%=defaultProductGroupContentId%>',
                value: '<%=orderTotal%>',
                currency: 'USD'
            });
<%
    }
%>


    }(window, document, 'ttq');

</script>

<!-- End Impression -->
