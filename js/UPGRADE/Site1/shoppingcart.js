const toArray = function (collection) {
    let ar = [];
    if (collection !== null && typeof collection !== "undefined") {
        ar = ar.slice.call(collection);
    }
    return ar;
};

const getItemByCode = function (code) {
    const items = _dtmShoppingCart.Items();

    return (
        items.filter(function (item) {
            return item.id === code;
        })[0] || {}
    );
};

const setUpCustomerCartStatusElement = function () {
    if (!supportsHTMLTemplateRenderingEngine()) return;

    const fragment = window.HTMLTemplateRenderingEngine.renderViewByTemplate(
        document.getElementById("CustomerCartStatusTemplate"),
        {
            Status: ""
        }
    );

    if (!fragment) return;

    document.body.appendChild(fragment);

    customerCartStatusElement = getCustomerCartStatus();
};

$(document).ready(function () {
    setUpCustomerCartStatusElement();
    setUpShoppingCart();
});

$(window).load(function () {
    if ($("#oosRadioProduct").is(":checked")) {
        $("#sold-out").hide();
        $(".sold-out-button").show();
    } else {
        $("#sold-out").show();
        $(".sold-out-button").hide();
    }
    updateOosLabel();
});

registerEvent("CartChange", function () {
    updateSubTotal();
});

const lookupItemQuantity = function (quantityId, defaultQuantity) {
    const item = getItemByCode(quantityId);
    return item.qty ? item.qty : defaultQuantity;
};

function updateButtonQuantity(element) {
    let quantityId = element.dataset["quantityId"],
        quantityModifier = element.dataset["qtyModifier"],
        qtyEle = document.getElementById(quantityId),
        newQuantity = parseInt(qtyEle.value);

    switch (quantityModifier) {
        case "plus":
            newQuantity++;
            break;
        case "minus":
            newQuantity--;
            break;
        default:
            break;
    }

    return updateInputQuantity(qtyEle, newQuantity);
}

function updateInputQuantity(qtyEle, newQuantity) {
    const minQuantity = parseInt(qtyEle.dataset["minQty"]);
    const maxQuantity = parseInt(qtyEle.dataset["maxQty"]);

    switch (true) {
        case newQuantity <= minQuantity:
            newQuantity = 1;
            break;
        case newQuantity > maxQuantity:
            newQuantity = maxQuantity;
            outputResponseToCartToast("Max quantity has been reached.");
            break;
    }

    if (isNaN(newQuantity)) {
        newQuantity = lookupItemQuantity(qtyEle.dataset.itemCode, 1);
    }

    qtyEle.value = newQuantity;

    return newQuantity;
}

function updateSelectQuantity(quantityId, newQuantity) {
    let pdp = document.getElementById(quantityId);
    var mainQuantityId = quantityId.split("_PDP")[0];
    let select = $("#" + mainQuantityId + "_Select");

    if (quantityId.indexOf("_PDP") > -1) {
        document.getElementById(quantityId).value = newQuantity;
        select = $("#" + mainQuantityId + "_Select");
    } else if (pdp) {
        pdp.value = newQuantity;
    }

    if (select.length > 0 && !isNaN(newQuantity)) {
        select.val(newQuantity);
        select.change();
    }
}

const supportsHTMLTemplateRenderingEngine = function () {
    return "HTMLTemplateRenderingEngine" in window;
};

const supportsCartToast = function () {
    return "cartToast" in window;
};

const getCustomerCartStatus = function () {
    return document.getElementById("customer-cart-status");
};

let customerCartStatusElement = getCustomerCartStatus();

const outputResponseToCartToast = function (response) {
    try {
        window.cartToast.post(response);
        window.cartToast.show();

        setTimeout(function () {
            window.cartToast.hide();
        }, 3000);
    } catch (e) {
        console.log(response);
        console.debug(e.message);
    }
};

const outputResponseToHTMLTemplate = function (response) {
    try {
        window.HTMLTemplateRenderingEngine.renderViewByElement(
            customerCartStatusElement,
            {
                Status: response
            }
        );
    } catch (e) {
        console.log(response);
        console.debug(e.message);
    }
};

const outputResponse = function (response) {
    if (supportsHTMLTemplateRenderingEngine() && customerCartStatusElement) {
        outputResponseToHTMLTemplate(response);

        return;
    }

    if (supportsCartToast()) {
        outputResponseToCartToast(response);

        return;
    }

    console.log(response);

    return;
};

function updateProductQuantity(element) {
    let productCode = $(element).attr("data-products");
    let currentQuantity = getItemQuantity(productCode);
    let maxQuantity = parseInt($(element).attr("data-max-qty"));
    let newQuantity =
        currentQuantity + parseInt($("#" + productCode + "Qty_Select").val());

    if (!customerCartStatusElement) {
        customerCartStatusElement = getCustomerCartStatus();
    }

    if (currentQuantity === 0) {
        handleCartChange(productCode, newQuantity);

        outputResponse("Added to Cart");
    } else {
        if (
            (newQuantity > currentQuantity || newQuantity < currentQuantity) &&
            newQuantity <= maxQuantity
        ) {
            handleCartChange(productCode, newQuantity);
            outputResponse("Item quantity updated!");
        } else {
            outputResponseToCartToast(
                "Item has a max quantity of " + maxQuantity
            );
        }
    }
}

function getItemQuantity(productCode) {
    let itemQuantity = 0;
    let cartItems = getItems();
    let cartItemCount = cartItems.length;

    if (cartItemCount > 0) {
        for (let i = 0; i < cartItemCount; i++) {
            if (cartItems[i].id === productCode) {
                if (itemQuantity === 0) {
                    itemQuantity = cartItems[i].qty;
                }
            }
        }
    }

    return itemQuantity;
}

function validateInput(element) {
    let value = $(element).val();
    let maxQauntity = parseInt($(element).attr("max"));
    let minQuantity = parseInt($(element).attr("min"));
    let valueInt = parseInt(value);
    let newValue = 0;

    if (valueInt > maxQauntity) {
        newValue = maxQauntity;
    } else if (isNaN(valueInt) || valueInt <= 0) {
        newValue = minQuantity;
    } else {
        newValue = valueInt;
    }

    $(element).val(newValue);
}

function removeCartItem(productCode, index, url) {
    handleCartChange(productCode, 0);
    $("#" + productCode + "Qty").val("1");
    let html = '<div class="vse_' + productCode + ' cart__content"></div>';
    $("#itemIndex" + index).after(html);
    $("#itemIndex" + index).remove();
    let tableItems = 0;

    $("div[id^=itemIndex]").each(function (index, value) {
        tableItems++;
    });

    if (tableItems === 0) {
        showEmptyCartMessage(url);
    } else {
        outputResponseToCartToast("Item removed!");
    }
}

function showEmptyCartMessage(url) {
    let html =
        '<div class="account__space account__copy">\n<h2 class="account__header">Details</h2>\n<p>Your cart is currently empty.</p>\n<a href="' +
        url +
        '" class="button button--second" data-track="dtm-link2">Continue Shopping</a>\n</div>';
    $("#cartContainer").html(html);
}

function updateSubTotal() {
    //Figure out why label.subtotal isn't working
    let subTotal = $("label.subtotal").text();
    $("#summarySubTotal").text(subTotal);
}

function onActionQuantityChange(e) {
    let code = document.getElementById("ActionCode" + e.detail).value,
        qty = parseInt(
            document.getElementById("ActionQuantity" + e.detail).value
        );

    updateQtyState(code, qty);
}

function updateRushQtySelect() {
    if (!document.getElementById("insureCheckbox").checked) {
        document.getElementById("RUSHQty_Select").value = 0;
    } else {
        document.getElementById("RUSHQty_Select").value = 1;
    }
}

function updateQtyState(code, qty) {
    let pdp = document.getElementById(code + "Qty_PDP");
    const plp = document.getElementById(code + "Qty");
    let rushQty = document.getElementById("RUSHQty_Select");

    if (qty === 0 && !rushQty) {
        qty = 1;
        if (document.getElementById(code + "Qty_Select") != null) {
            document.getElementById(code + "Qty_Select").value = 1;
        }
    }

    if (rushQty) {
        updateRushQtySelect();
    }

    if (plp) {
        plp.value = qty;
    }

    if (pdp) {
        pdp.value = qty;
    }
}

function customLoadItemState(productCode, qty) {
    if (productCode != "SHIP") {
        updateQtyState(productCode, qty);
    }
}

function updateOosLabel() {
    $(".product-variant__radio").on("click", function () {
        if ($("#oosRadioProduct").is(":checked")) {
            $("#sold-out").hide();
            $(".sold-out-button").show();
        } else {
            $("#sold-out").show();
            $(".sold-out-button").hide();
        }
    });
}

function setUpShoppingCart() {
    const radios = document.querySelectorAll(".form__radio");
    const buttons = document.querySelectorAll(".form__button:not(#emailSubscribeButton)");
    const inputs = document.querySelectorAll(".form__input");

    toArray(radios).forEach(function (radio) {
        radio.addEventListener("click", function () {
            getButton(this);
        });
    });

    toArray(buttons).forEach(function (button) {
        button.addEventListener("click", function () {
            const newQuantity = updateButtonQuantity(this);
            updateSelectQuantity(this.dataset.quantityId, newQuantity);
        });
    });

    toArray(inputs).forEach(function (input) {
        input.addEventListener("blur", function () {
            updateInputQuantity(this, this.value);
            updateSelectQuantity(this.id, this.value);
        });
    });
}
