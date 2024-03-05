<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    var sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;
%>

<main aria-labelledby="main-title" class="view content content--sub-page section">
    <div id="main" class="view__anchor"></div>
    <article class="content__text">
        <% 
            var title = Model.UpsellTitle ?? string.Empty;
            var text = Model.UpsellText ?? string.Empty;
            var hasTitle = !String.IsNullOrEmpty(title);
            var hasText = !String.IsNullOrEmpty(text);

            if (hasTitle)
            {
                %>
                <div class="content__header">
                    <h1 id="main-title" class="content__title"><%= title %></h1>
                </div>
                <%
            } else
            {
                Html.RenderSnippet("SUBPAGE-TITLE-" + DtmContext.PageCode);
            }
            %>
            <div class="view__in section__in">
                <div class="content__text">
            <%
            if (hasText)
            {
                var testimonials = sitemap.GetItemById("testimonials").Page;
                var privacy = sitemap.GetItemById("privacy-policy").Page;

                text = text.Replace("/Testimonials", testimonials)
                        .Replace("/index#reviews", testimonials)
                        .Replace(@"href=""Privacy-Policy""", string.Format(@"href=""{0}"" target=""_blank""", privacy));

                Response.Write(text);
            } else
            {
                Html.RenderSubPageContent(DtmContext.PageCode);
            }
            %>
                </div>
            </div>
    </article>
</main>

<% if (!IDVFTFBS.Classes.SiteStatus.IsStoreOpen) { %>
<style>
    #shipping-title, #shipping-title ~ p {
        display: none;
    }
</style>

<script>
    (() => {
        const rewriteTextById = (id, text) => {
            const element = document.getElementById(id);
            if (!element) return;

            element.textContent = text ?? "";
        }

        const rewritePageTitle = (text) => {
            if (!text || text === "") return;

            const title = document.querySelector("title");
            if (!title) return;

            title.textContent = text;
        }

        if (window.location.pathname.match(/Shipping-Returns/i)) {
            rewritePageTitle("Return Policy | Finishing Touch Flawless™");
            rewriteTextById("main-title", "Guarantee & Return Policies");
        }
    })();
</script>
<% } %>

</asp:Content>