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
  
});

const supportsHTMLTemplateRenderingEngine = function () {
    return "HTMLTemplateRenderingEngine" in window;
};


const getCustomerCartStatus = function () {
    return document.getElementById("customer-cart-status");
};

let customerCartStatusElement = getCustomerCartStatus();

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

    console.log(response);

    return;
};

window.onload = function () {
    $('[data-modal-dialog-id="customer-cart-status"]').click(function () {

        let productCode = typeof $(this).attr('data-code') !== 'undefined' ? $(this).attr('data-code') : '';

        //regular data-code logic to handle open/close of pop up 
        //if item is in cart , turn pop up off . if it is not in cart turn pop up on 
        if (productCode != '') {
            if (getItems()[productCode]) {
                $(this).attr('data-modal-dialog-actor', 'close');
            } else {
                $(this).attr('data-modal-dialog-actor', 'open');
            }
        } else {
            let groupName = typeof $(this).attr('data-group-name') !== 'undefined' ? $(this).attr('data-group-name') : '';

            if (groupName != '') {

            }
        }

    });
}

