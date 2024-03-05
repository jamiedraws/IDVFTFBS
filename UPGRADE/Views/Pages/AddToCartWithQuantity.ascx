<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.CategoryRouter" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>

<%
    CampaignProductView product = ViewData["Product"] as CampaignProductView ?? null;

    bool isPDP = ViewData["IsPDP"] as bool? ?? true;
    string pageViewName = isPDP ? "PDP" : "PLP";

    string name = product.GetProductName();
    string id = product.ProductCode;
    bool isOOS = product.IsProductOutOfStock();
    bool isRemoved = string.Equals(product.PropertyIndexer["IsRemoved"] ?? string.Empty, "true", StringComparison.InvariantCultureIgnoreCase);

    string plpQtyId = string.Format("{0}Qty", product.ProductCode);
    string qtyId = string.Format("{0}{1}", plpQtyId, isPDP ? "_PDP" : string.Empty);
    string outOfStockId = isOOS ? "sold-out" : "";

    string attributeList = string.Format(@"
        id=""element-controller-{0}-{1}"" 
        class=""form form--icon-field-combobox form--label-combobox element-controller__element""",
        product.ProductCode, pageViewName);

    attributeList = string.Format(@"{0} data-element-controller-name=""{1}-{2}""", attributeList, product.ProductCode, pageViewName);

    string amazonUrl = product.PropertyIndexer["AmazonURL"] ?? product.PropertyIndexer["AmazonURLStage"];
    bool redirectToAmazon = !string.IsNullOrWhiteSpace(amazonUrl);

    string ultaUrl = product.PropertyIndexer["UltaURL"];
    bool redirectToUlta = !string.IsNullOrWhiteSpace(ultaUrl);

    bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;
    bool isAvailableForOrder = isStoreOpen && !isOOS && !isRemoved && !redirectToAmazon && !redirectToUlta;
%>

<div <%= attributeList %>>
    <%
        string colorVariantName = product.PropertyIndexer["Color", string.Empty];
        
        if (!string.IsNullOrWhiteSpace(colorVariantName) && isPDP)
        {
            string colorVariantNameAttribute = colorVariantName.Replace(" ", "-").ToLower();
            string colorVariantHTMLNodeName = "div";
            string colorVariantAttributeList = string.Format(@"data-variant-product-color-name=""{0}"" class=""form__label""", colorVariantNameAttribute);

            if (isAvailableForOrder)
            {
                colorVariantHTMLNodeName = "label";
                colorVariantAttributeList = string.Format(@"for=""{0}"" {1}", qtyId, colorVariantAttributeList);
            }

            string colorVariantHTMLText = string.Format(@"<{0} {1}>{2}</{0}>", colorVariantHTMLNodeName, colorVariantAttributeList, colorVariantName);
            
            Response.Write(colorVariantHTMLText);
        }
    %>

    <% if (isAvailableForOrder) { %>
    <div class="form__contain">
        <button type="button" aria-label="Remove 1 of <%= name %> from your cart" class="form__field form__button" data-qty-modifier="minus" data-quantity-id="<%= qtyId %>">
            <svg class="icon">
                <use href="#icon-minus"></use>
            </svg>
        </button>

        <%
            var qtyPattern = string.Format("[{0}-{1}]", product.MinQuantity, product.MaxQuantity);
        %>

        <input onchange="validateInput(this);" data-min-qty="<%= product.MinQuantity %>" data-max-qty="<%= product.MaxQuantity %>" class="cartParam dtm__restyle form__field form__input" type="tel" value="1" aria-label="Current quantity" id="<%= qtyId %>" data-item-code="<%= product.ProductCode %>" name="<%= qtyId %>" pattern="<%= qtyPattern %>" title="Up to <%= product.MaxQuantity %> are allowed">
        <button type="button" aria-label="Add 1 of <%= name %> to your cart" class="form__field form__button" data-qty-modifier="plus" data-quantity-id="<%= qtyId %>">
            <svg class="icon">
                <use href="#icon-plus"></use>
            </svg>
        </button>
    </div>

    <select id="<%=plpQtyId %>_Select" hidden>
        <option value="1" selected>1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    <% } %>

    <%
        if (redirectToAmazon) 
        {
            string amazonLinkText = "Buy On Amazon";
        %>
          <a href="<%= amazonUrl %>" class="button" id="<%= product.ProductCode %>_Redirect" target="_blank"><%= amazonLinkText %></a>
        <%
        }
        else if (redirectToUlta)
        {
            string ultaLinkText = "Buy On Ulta";
        %>
            <a href="<%= ultaUrl %>" class="button" id="<%= product.ProductCode %>_Redirect" target="_blank"><%= ultaLinkText %></a>
        <%
        }
        else if (isStoreOpen && isOOS)
        {
            string klaviyoFormId = product.PropertyIndexer["KlaviyoFormId", string.Empty];


            if (!string.IsNullOrWhiteSpace(klaviyoFormId))
            {
                %>
                <span class="product__oos-message">Temporarily Out Of Stock</span>
                <button type="button" class="button" aria-haspopup="true" data-klaviyo-form-id="<%= klaviyoFormId %>">
                    <span>Join the Waitlist</span>
                </button>
                <%
            } 
            else
            {
                %>
                <div class="button button--view-products">
                    <span>SOLD OUT</span>
                </div>
                <%
            }
        }
        else if (isStoreOpen && !isOOS && !isRemoved)
        {
            %>
            <a href="javascript:void(0);" data-modal-dialog-id="customer-cart-status" data-modal-dialog-actor="open" data-modal-dialog-type="document" data-modal-dialog-title="Customer Cart Status" data-code-toggle="true" data-max-qty="<%=product.MaxQuantity %>" data-products="<%=product.ProductCode%>" onclick="updateProductQuantity(this);" class="button" id="<%= outOfStockId %>">Add To Cart</a>
            <%
        }
    %>
</div>