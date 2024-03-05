<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.CategoryRouter" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>

<%
    // instance provided by the controller
    var categoryProductRouterEngine = ViewData["CategoryProductRouterEngine"] as CategoryProductRouterEngine ?? new CategoryProductRouterEngine();

    // the current category product
    var categoryProduct = ViewData["CategoryProduct"] as CategoryProductRouter ?? new CategoryProductRouter();

    var categoryCode = ViewData["Category"] as string ?? string.Empty;

    // represents the unique index to increment through other related category product entries
    var index = ViewData["Index"] as int? ?? 0;

    // the current campaign product
    var product = categoryProduct.CampaignProduct;

    if (product != null)
    {
        // the name of the product
        var name = product.GetProductTitle();

        // the images associated with the current product
        var productSlug = product.PropertyIndexer["UrlSlug"];

        var productImages = ViewData["ProductImages"] as ProductImages ?? new ProductImages(productSlug, "images/UPGRADE/products/" + productSlug);

        if (string.IsNullOrWhiteSpace(productSlug)) {
            // get images based on product code if no url slug is available
            var productCode = product.ProductCode;
            productImages = ViewData["ProductImages"] as ProductImages ?? new ProductImages(productCode, "images/UPGRADE/products/" + productCode);
            // also because these are products not intended to be shown in category listings, get a more descriptive name
            name = product.GetProductName();
        }

        // represents the BazaarVoice product id
        var bazaarVoiceId = product.PropertyIndexer["BazaarVoiceID"];

        // determines if there is a BazaarVoice product id
        var hasBazaarVoice = !string.IsNullOrWhiteSpace(bazaarVoiceId);

        // image and name overrides (using for replacement heads to show under "new")
        var categoryListingNameOverride = product.PropertyIndexer["CategoryListingNameOverride"];

        var routeToProductDetailPage = categoryProduct.RouteToProductDetailPage;

        if (routeToProductDetailPage.Contains("#"))
        {
            var productDetailPageUri = new Uri(DtmContext.Domain.FullDomainCustomPath(routeToProductDetailPage));

            routeToProductDetailPage = routeToProductDetailPage.Replace(productDetailPageUri.Fragment, string.Format("?cver={0}{1}", DtmContext.VersionId, productDetailPageUri.Fragment));
        } 
        else
        {
            routeToProductDetailPage = string.Format("{0}?cver={1}", routeToProductDetailPage, DtmContext.VersionId);
        }

        bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;
%> 

<div class="category-product category-product--listing element-controller" data-variant-product-permalink="<%= categoryProduct.RouteToProductDetailPage %>">
    <a href="<%= routeToProductDetailPage %>" class="category-product__picture product" data-variant-product-group="image" data-variant-product-router>
        <span class="contain contain--square product__image product__image-container" data-variant-product-type="image">
			<%
				string firstImage = productImages.GetFirstFallbackImage();

                bool hasImage = !string.IsNullOrEmpty(firstImage);

                if (!hasImage)
                {
                    %>
                    <img src="/images/UPGRADE/products/default.svg" alt="" width="500" height="500" loading="lazy" />
                    <%
                }

                if (hasImage)
                {
                    Response.Write(productImages.BuildHTMLPictureElement(firstImage, true));
                }

                if (product.IsProductNew() && product.DisplayNewTag())
                {
                    %>
                    <span class="product__new"><b>New</b></span>
                    <%
                }
			%>
        </span>
    </a>
    <div class="category-product__title" data-variant-product-type="name"><%= name %></div>

    <hr />

    <% if (hasBazaarVoice) {
            var bvRedirectUrl = string.Format("{0}#reviews", DtmContext.Domain.FullDomainCustomPath(categoryProduct.RouteToProductDetailPage));    
        %>
        <div class="contain contain--bazaarvoice-inline-rating">
            <div data-variant-product-type="bazaarvoice-inline-rating" class="contain contain--bazaarvoice-inline-rating">
                <div data-bv-show="inline_rating" data-bv-redirect-url="<%= bvRedirectUrl %>" data-bv-product-id="<%= bazaarVoiceId %>"></div>
            </div>
        </div>
    <% } %>

    <% if (isStoreOpen) { %>
    <div class="category-product__price" data-variant-product-type="price"><%= product.FormatPriceHTML() %></div>
    <% } %>
    
    <div class="product-price-info">
        <b class="product-price-info__callout" data-variant-product-type="product-price-info"></b>
    </div>

    <div class="category-product__cart">
        <%
            var productOptions = product.GetVariantProducts();

			productOptions.Insert(0, product);

			string productCodesOrder = product.PropertyIndexer["AddToCartOrderByProductCodes", string.Empty];
			List<string> productOptionsOrder = productCodesOrder.Split(new [] {"|"}, StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()).ToList();

			productOptions = productOptions.OrderBy(x => productOptionsOrder.IndexOf(x.ProductCode)).ToList();

            var productOption = productOptions.FirstOrDefault();

            if (productOption != null)
            {
                Html.RenderPartial("AddToCartWithQuantity", new ViewDataDictionary
                {
                    { "Product", productOption },
                    { "Index", index },
                    { "IsPDP", false }
                });
            }
        %>
    </div>
</div>
<%
    }
%>