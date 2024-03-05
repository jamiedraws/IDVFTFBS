<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
    var query = Request["query"] ?? string.Empty;
    var filteredList = new List<Dtm.Framework.Base.Models.CampaignProductView>() { };
    if (query != string.Empty)
    {
        var regexMatchList = DtmContext.CampaignProducts.Where(cp => cp.CategoryIndexer.Has("SEARCH") &&
                    Regex.IsMatch(cp.ProductName ?? string.Empty, query, RegexOptions.IgnoreCase)
                    || Regex.IsMatch(cp.DisplayText ?? string.Empty, query, RegexOptions.IgnoreCase)
                    || Regex.IsMatch(cp.ShortName ?? string.Empty, query, RegexOptions.IgnoreCase)).ToList();

        filteredList = regexMatchList.Where(p => (p.ProductType != "Option" && p.ProductType != "Shipping" && p.ProductType != "None" && p.CategoryIndexer.Has("SEARCH"))).ToList();
    }

    var productFolder = "images/products/";
    var products = TempData["Products"] as List<Dtm.Framework.Base.Models.CampaignProductView>;

    if (products == null)
    {
        products = filteredList ;
    }

    products = products.Where(p => new DisplayProduct().CanDisplayByProduct(p)).ToList();
    %>
    <div class="form-wrapper inner u-vw--100 u-pad c-brand--form">
        <div class="center-text">
            <h2 class="uppercase form__title">Search Results</h2>
            <% if (products == null || !products.Any()) { %>
                <p class="form__text">No search results found for "<%=query %>". Please check your spelling and try again.</p>
            <% } else { %>
                <p class="form__text">Showing results for "<%= query %>".</p>
            <% } %>
        </div>

        <% if (products != null) { %>
            <div class="options u-pad @x2-pad center-text c-brand--form no-margin">
                    <% foreach (var p in  products) {
                        var productLink = p.PropertyIndexer["SearchUrl"] ?? String.Empty;
                        var productImage = 
                            p.PropertyIndexer["SearchImage"] ?? 
                            p.PropertyIndexer["ProductImage"] ?? 
                            String.Empty;
                        var soldOut = p.PropertyIndexer["SoldOut", string.Empty];
                        if ( !String.IsNullOrEmpty(productLink) ) {
                            productLink = productLink.Replace("[#ext#]", DtmContext.ApplicationExtension);
                        }

                        if ( !String.IsNullOrEmpty(productImage) ) {
                            productImage = productImage + "?appV=" + DtmContext.ApplicationVersion;
                        }
                    %>

                        <div class="option">
                            <div class="option__wrap">
                                <div class="relative center-margin option__img">
                                    <% if ( !String.IsNullOrEmpty(productLink) ) { %>
                                        <a href="<%= productLink %>" title="See details for <%= p.ProductName %>" class="option__overlay">
                                            <img src="<%= productImage %>" alt="<%= p.ProductName %>">
                                        </a>
                                    <% } else { %>
                                        <img src="<%= productImage %>" alt="<%= p.ProductName %>">
                                    <% } %>
                                </div>
                                <h4 class="color-gray option__title sans-primary-bold top-padding @x2-pad"><%= p.ProductName %></h4>
                                <hr>
                                <div class="row row-to-center center-margin bottom-padding">
                                    <div class="col right-padding">
                                        <h5 class="color-gray sans-primary-medium ">Price: <%= p.Price.ToString("C") %></h5>
                                    </div>
                                    <div class="col">
                                        <select id="select_<%=p.ProductCode%>" > 
                                            <% for (var i = 1; i <= p.MaxQuantity; i++) { %>
                                            <option value="<%= i %>"><%= i %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <!-- end price row -->
                                <div class="row row-to-center center-margin u-pad--vert center-margin">
                                    <div class="col right-padding">
                                        <a href="<%= productLink %>" title="See details for <%= p.ShortName %>" class="btn--product btn--learn h3 white-text">Learn More</a>
                                    </div>
                                    <div class="col">
                                        <%if (soldOut.ToLower() == "true")
                                    { %>
                                        <a href="#order" class="btn--product btn--sold-out sans-primary-medium top-margin">Sold Out</a>
                                <%} else { %> 
                                        <a href="#order" title="Add <%= p.ShortName %> to your shopping cart" data-select-id="select_<%=p.ProductCode%>" data-code="<%= p.ProductCode %>" data-code-toggle="true" class="btn--product h3 sans-primary-medium">Add To Cart</a>
                                   <% }%>
                                   </div>
                                </div>
                                <!-- end button row -->
                            </div>
                        </div>
                        <!-- end option -->
    
                    <% } %>
            </div>
        <% } %>
    </div>
    <div style="display:none;">
    <%Html.RenderPartial("OrderFormReviewTable"); %>
</div>

</asp:Content>
