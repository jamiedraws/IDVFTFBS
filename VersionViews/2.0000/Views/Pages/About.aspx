<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%= Html.Partial("GetDynamicPage", Model, new ViewDataDictionary {
        { "title", Model.UpsellTitle },
        { "image", Model.UpsellImageFileName },
        { "desc", Model.UpsellText },
        { "cta", Model.CallToAction }
    }) %>

</asp:Content>
                        