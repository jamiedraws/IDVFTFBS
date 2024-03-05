<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/UPGRADE/Site1/index.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--sub-page content--product-registration section">
    <div id="main" class="view__anchor"></div>
    <article class="content__text">
        <div class="content__header">
            <h1 id="main-title" class="content__title">Product Registration</h1>
        </div>
        <div class="view__in section__in">
            <div class="section__block content__text">
                <%= Html.Partial("GetDynamicPage", Model, new ViewDataDictionary {
                    { "image", Model.UpsellImageFileName },
                    { "desc", Model.UpsellText },
                    { "cta", Model.CallToAction }
                }) %>
            
                <p>For media relations, please contact <a href="mailto:mediarelations@flawlessbeauty.com">mediarelations@flawlessbeauty.com</a></p>
                <p class="u-mar--vert">View our <a href="https://churchdwight.com/privacy-policy.aspx">Privacy Notice</a></p>            </div>
        </div>
    </article>
</main>

</asp:Content>