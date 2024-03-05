<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>
<%@ Import Namespace="IDVFTFBS.Extensions" %>
<%@ Import Namespace="IDVFTFBS.Utils" %>
<%@ Import Namespace="IDVFTFBS.CategoryRouter" %>
<%@ Import Namespace="IDVFTFBS.PromoCodeHelper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%
	ResourceWriter resourceWriter = new ResourceWriter();

	Response.Write(resourceWriter.WriteStylePreload("css/UPGRADE/Site1/product-detail-page.css"));
	Response.Write(resourceWriter.WriteLink("css/UPGRADE/Site1/product-detail-page.css"));	
%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
	PromoCodeViewer freeRepHeadPromo = new PromoCodeViewer("FREEREPHEADPROMO");	
%>
<div class="view content section">
	<div class="content__text">
		<main aria-labelledby="main-title" class="view logo-title-hero logo-title-hero--page-banner">
			<div id="main" class="view__anchor"></div>
			<div class="logo-title-hero__group">
				<h1 id="main-title" class="logo-title-hero__title">Replacement Heads</h1>
			</div>
			<% if (freeRepHeadPromo.IsActive) { %>
			<b class="logo-title-hero__box"><span>BUY 1 GET 1 ON ALL REPLACEMENT HEADS!</span> <small>*BOGO deal is for 2 of the same style replacement head.</small></b>
			<% } %>
		</main>

<%
	CategoryProductRouterEngine categoryProductRouterEngine = ViewData["CategoryProductRouterEngine"] as CategoryProductRouterEngine ?? new CategoryProductRouterEngine();

	Func<string, string> buildProductImageByProductCode = ((string productCode) =>
    {
		string html = @"<img src=""/images/UPGRADE/products/default.svg"" alt="""" width=""100"" height=""100""/>";

		if (string.IsNullOrWhiteSpace(productCode))
        {
			return html;
        }

		ProductImages relatedProductImages = new ProductImages(productCode, "images/UPGRADE/products/" + productCode);
		string relatedProductImage = relatedProductImages.GetFirstFallbackImage();

		bool hasRelatedProductImage = !string.IsNullOrEmpty(relatedProductImage);

		return hasRelatedProductImage 
			? relatedProductImages.BuildHTMLPictureElement(relatedProductImage, true) 
			: html;
    });

	bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;
	List<string> exclusionProductCodes = IDVFTFBS.Classes.SiteStatus.ExclusionProductCodes;

    List<CampaignProductView> replacementProducts = DtmContext.CampaignProducts.Where(cp => cp.CategoryIndexer.Has("REPLACEMENTHEADS") && cp.IsProductLive() && !exclusionProductCodes.Contains(cp.ProductCode)).OrderBy(cp => cp.CategoryIndexer["REPLACEMENTHEADS"]).ToList();

	replacementProducts.ForEach(relatedProduct =>
    {
		string landmarkId = string.Format("product-{0}", relatedProduct.ProductCode);
		string landmarkLabelId = string.Format("{0}-title", landmarkId);
		%>
		<section aria-labelledby="<%= landmarkLabelId %>" class="view product product--detail section">
			<div id="<%= landmarkId %>" class="view__anchor"></div>
			<div class="view__in section__in">
				<div class="product__group">
					<div class="product__media">
					<%
						CampaignProductView mainProduct = DtmContext.CampaignProducts.FirstOrDefault(cp => string.Equals(relatedProduct.PropertyIndexer["IsOfferedBy", string.Empty], cp.ProductCode));	
						string mainProductCode = mainProduct != null ? mainProduct.PropertyIndexer["UrlSlug", mainProduct.ProductCode] : relatedProduct.ProductCode;

						CategoryProductRouter mainProductRouter = categoryProductRouterEngine.GetCategoryProductByCampaignProductView(mainProduct);
						bool containsRoute = !string.IsNullOrEmpty(mainProductRouter.RouteToProductDetailPage);

						string mainProductImage = buildProductImageByProductCode(mainProductCode);

						if (containsRoute)
						{
							%>
							<a href="<%= mainProductRouter.RouteToProductDetailPage %>?cver=<%= DtmContext.VersionId %>" class="product__image"><%= mainProductImage %></a>
							<%
						}

						if (!containsRoute)
						{
							%>
							<div class="product__image"><%= mainProductImage %></div>
							<%
						}
					%>
					</div>
					<div class="product__info">
						<div class="product product--related">
							<div class="product__group"> 
								<div class="product__media">
									<div class="product__image">
										<%= buildProductImageByProductCode(relatedProduct.ProductCode) %>
									</div>
								</div>
								<div class="product__info">
									<div class="product__block">
										<h2 id="<%= landmarkLabelId %>"><%= relatedProduct.GetProductName() %></h2>
										<p><%= relatedProduct.DisplayText %></p>
									</div>
									<% if (isStoreOpen) { %>
									<div class="product__price"><%= relatedProduct.FormatPriceHTML() %></div>
									<% } %>
									<%
										string outOfStockText = relatedProduct.PropertyIndexer["OOSCustomerMessage", string.Empty];
										bool isOOS = relatedProduct.IsProductOutOfStock();

										string backInStockText = relatedProduct.PropertyIndexer["BackInStockMessage", string.Empty];

										if (!string.IsNullOrWhiteSpace(relatedProduct.AdditionalProductCode) && isOOS)
										{
											%>
											<b class="product__sku">Sku Number: <%= relatedProduct.AdditionalProductCode %></b>
											<%
										}

										if (!string.IsNullOrWhiteSpace(outOfStockText) && isOOS)
										{
											%>
											<strong class="product__oos"><%= outOfStockText %></strong>
											<%
                                        }
										
										if (!string.IsNullOrWhiteSpace(backInStockText) && !isOOS)
										{
											%>
											<strong class="product__message"><%= backInStockText %></strong>
											<%
                                        }
									%>
									<div class="product__cart">
									<%
										Html.RenderPartial("AddToCartWithQuantity", new ViewDataDictionary
										{
											{ "Product", relatedProduct },
											{ "IsPDP", true }
										});
									%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<%
    });
%>
</div>
</div>

</asp:Content>