<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style id="CSS.ProductRegistration">
.dtm--productregistration .dtm__in main div,
.dtm--productregistration .page__copy iframe {
    display: block;
    width: 100%;
    margin: 0;
    padding: 0;
    max-width: none;
}
.dtm--productregistration .page__content {
	border-top: 1px solid #888;
	/*border-bottom: 1px solid #888;*/
}
.dtm--productregistration .page__copy iframe {
    min-height: 1500px;
}
</style>


    <%= Html.Partial("GetDynamicPage", Model, new ViewDataDictionary {
        { "title", Model.UpsellTitle },
        { "image", Model.UpsellImageFileName },
        { "desc", Model.UpsellText },
        { "cta", Model.CallToAction }
    }) %>

    <div class="u-pad center-text">
        <p class="u-mar--vert">For media relations, please contact <a href="mailto:mediarelations@flawlessbeauty.com">mediarelations@flawlessbeauty.com</a></p>
        <p class="u-mar--vert">View our <a href="https://churchdwight.com/privacy-policy.aspx">Privacy Notice</a></p>
    </div>

</asp:Content>