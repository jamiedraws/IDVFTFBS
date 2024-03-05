<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/UPGRADE/Site1/index.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
var sitemap = ViewData["Sitemap"] as Sitemap ?? new Sitemap();
var labelId = "sitemap";

var shopEntries = sitemap.SitemapList.GetItemsByIdRange(new List<string> { 
    "products", 
    "deals",
    "where-to-buy",

});
var infoEntries = sitemap.SitemapList.GetItemsByIdRange(new List<string> {
    "about",
    "articles",
    "videos",
    "how-to-videos"
});
var websiteEntries = sitemap.SitemapList.GetItemsByIdRange(new List<string> {
    "account",
    "customer-service",
    "create-pro-account",
    "product-registration",
    "shipping-returns",
    "privacy-policy",
});

bool isStoreOpen = IDVFTFBS.Classes.SiteStatus.IsStoreOpen;
%>

<main aria-labelledby="main-title" class="view content content--sitemap section">
    <div id="main" class="view__anchor"></div>
    <div class="view__in section__in">
        <div class="section__block content__text">
            <h1 id="main-title" class="content__title">Sitemap</h1>

            <p><p>Thank you for choosing Finishing Touch Flawless. We are dedicated to your satisfaction and for your &trade; convenience, we have provided this Site Map. If you should have any questions or comments, please feel free to visit our <a href="Customer-Service<%= Model.Extension %>" title="Customer Care">Customer Care Page</a>. Thank You!</p></p>
            
            <div class="content__group">
                <section aria-labelledby="shop-title" class="content__text">
                    <h2 id="shop-title">Products</h2>
                    <ul class="list">
                        <li><a id="sitemap-hair-removal" href="/products/hair-removal">Hair Removal</a></li>
                        <li><a id="sitemap-skin-devices" href="/products/skin-devices">Skin Devices</a></li>
                        <li><a id="sitemap-nail-devices" href="/products/nail-devices">Nail Devices</a></li>
                        <% if (isStoreOpen) { %>
                        <li><a id="sitemap-accessories" href="/products/accessories">Accessories</a></li>
                        <li><a id="sitemap-bundles" href="/products/bundle-and-save/">Bundles</a></li>
                        <% } %>
                        <li><a id="sitemap-replacement-heads" href="Replacement<%= Model.Extension %>">Replacement Heads</a></li>
                    </ul>
                </section>
                <section aria-labelledby="info-title" class="content__text">
                    <h2 id="info-title">Info</h2>
                    <ul class="list">
                        <%
                        foreach (var entry in infoEntries)
                        {
                            var attributeList = string.Format(@"id=""{0}-{1}"" href=""{2}""", labelId, entry.Id, entry.Page);

                            if (entry.IsExternal)
                            {
                                attributeList = string.Format(@"{0} target=""_blank""", attributeList);
                            }
                            %>
                            <li>
                                <a <%= attributeList %>><%= entry.Name %></a>
                            </li>
                            <%
                        }
                        %>
                    </ul>
                </section>
                <section aria-labelledby="website-title" class="content__text">
                    <h2 id="website-title">Website</h2>
                    <ul class="list">
                        <%
                        foreach (var entry in websiteEntries)
                        {
                            var attributeList = string.Format(@"id=""{0}-{1}"" href=""{2}""", labelId, entry.Id, entry.Page);

                            if (entry.IsExternal)
                            {
                                attributeList = string.Format(@"{0} target=""_blank""", attributeList);
                            }
                            %>
                            <li>
                                <a <%= attributeList %>><%= entry.Name %></a>
                            </li>
                            <%
                        }
                        %>
                        <li>
                            <a href="javascript:void(0);" class="optanon-toggle-display">Do Not Sell My Personal Information</a>
                        </li>
                    </ul>
                </section>
            </div>

        </div>
    </div>
</main>

</asp:Content>