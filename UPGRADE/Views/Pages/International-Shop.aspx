<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/UPGRADE/Site1/index.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/index.css" rel="stylesheet" />
    <style>
        /* hide one trust policy link from this page */
        #ot-sdk-btn {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
var productName = SettingsManager.ContextSettings["Label.ProductName"];
string[,] countries;
    countries = new string[,] {
    {"UK",          "https://www.finishingtouchflawless.co.uk/"},
    {"Germany",     "https://flawless-beauty.de/"},
    {"Australia",   "https://finishingtouchflawless.com.au/"},
    {"Canada",      "https://www.flawlessbeauty.ca/"},
    {"Mexico",      "http://www.flawlessmexico.com.mx/"},
    {"France",      "https://www.finishingtouchflawless.fr/"},
    {"Europe",      "https://www.finishingtouchflawless.eu/"}
  };
%>

<main aria-labelledby="main-title" class="view content content--sub-page content--intershop section">
    <div id="main" class="view__anchor"></div>
    <picture class="content__full-image">
        <source srcset="/images/UPGRADE/pages/international/background.webp" type="image/webp">
        <img src="/images/UPGRADE/pages/international/background.jpg" loading="lazy" alt="Flawless product line" width="1280" height="922">
    </picture>
    <article class="view__in section__in content__in">
        <div class="content__text">
            <h1 id="main-title" class="content__title">International Shopping</h1>
            <p>Shop these authorized <%= productName %> distributors to ensure you are buying authentic <%= productName %> Products</p>
            <div class="content__group">
                <%
                string countryName = "";
                string countryLink = "";
                string countryImage = "";
                for (int i = 0; i < countries.GetLength(0); i++) {
                    countryName = countries[i, 0];
                    countryLink = countries[i, 1];
                    countryImage = countryName.ToLower();
                    if (countryName == "Europe") {
                        countryName = "Rest of Europe";
                    }
                    if (countryLink != "" || countryLink != null) {
                %>
                <a class="content__link" href="<%= countryLink %>" title="Shop <%= productName %> products in <%= countryName %>, opens in a new tab" target="_blank">
                    <img loading="lazy" src="/images/UPGRADE/flags/<%= countryImage %>.svg" width="138" height="92" alt="<%= countryName %>">
                    <span><%= countryName %></span>
                </a>
                <%
                    }
                }
                %>
                <div class="content__link" style="visibility: hidden;">&nbsp;</div>
            </div>
        </div>
    </article>
</main>

</asp:Content>