<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<script runat="server">
    public class VimeoCaption
    {
        public string Id { get; set; }
        public string Caption { get; set; }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/UPGRADE/Site1/index.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--videos section">
    <div id="main" class="view__anchor"></div>
    <article class="content__text">
        <div class="logo-title-hero logo-title-hero--page-banner">
            <div class="logo-title-hero__group">
                <h1 id="main-title" class="logo-title-hero__title">How To Use Flawless<sup>&trade;</sup></h1>
            </div>
        </div>
        <%
            List<VimeoCaption> vimeoCaptions = new List<VimeoCaption>
            {
                new VimeoCaption
                {
                    Id = "289087471",
                    Caption = "Brows"
                },
                new VimeoCaption
                {
                    Id = "293563430",
                    Caption = "Brows Tips &amp; Tricks"
                },
                new VimeoCaption
                {
                    Id = "379052230",
                    Caption = "NuRazor"
                },
                new VimeoCaption
                {
                    Id = "379059764",
                    Caption = "Cleaning NuRazor"
                },
                new VimeoCaption
                {
                    Id = "356457855",
                    Caption = "Dermaplane Glo"
                },
                new VimeoCaption
                {
                    Id = "289089064",
                    Caption = "Legs"
                },
                new VimeoCaption
                {
                    Id = "314107625",
                    Caption = "Body"
                },
                new VimeoCaption
                {
                    Id = "453352395",
                    Caption = "Beauty Fridge"
                },
                new VimeoCaption
                {
                    Id = "718489220",
                    Caption = "Pure Clean Mitt"
                },
                new VimeoCaption
                {
                    Id = "743226386",
                    Caption = "Underarm Hair Remover"
                },
                new VimeoCaption
                {
                    Id = "743220791",
                    Caption = "Stray Hair Remover"
                },
                new VimeoCaption
                {
                    Id = "879922910",
                    Caption = "Ice Roller"
                }
            };
        %>
        <div class="view__in section__in">
            <div class="section__block">
                <div class="vimeo-gallery">
                    <div class="vimeo-gallery__group">
                        <%
                            vimeoCaptions.ForEach(vimeoCaption =>
                            {
                                int index = vimeoCaptions.IndexOf(vimeoCaption);
                                string id = string.Format("pdp-video-{0}", index);
                                string label = string.Format("Product video {0}", index);
                                %>
                                <div class="vimeo-gallery__item">
                                    <button type="button" aria-label="<%= label %>" class="contain contain--video" data-modal-dialog-id="<%= id %>" data-modal-dialog-actor="open" data-modal-dialog-iframe="https://player.vimeo.com/video/<%= vimeoCaption.Id %>" data-modal-dialog-title="Video" data-modal-dialog-template-modifier="video" data-src-img="/images/UPGRADE/products/default.svg" data-attr='{ "width":"1200", "height":"675", "loading":"lazy", "alt": ""}'>
                                    </button>
                                    <div class="vimeo-gallery__title"><%= vimeoCaption.Caption %></div>
                                </div>                        
                                <%
                            });  
                        %>
                    </div>
                </div>
            </div>
        </div>
    </article>
</main>

</asp:Content>