<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/BlogLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>

<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="IDVFTFBS.BlogPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    // Create excerpt HTML template
    var excerptList = string.Empty;
    var excerptTemplate = @"
        <a 
            class=""excerpt excerpt--span-picture-with-copy-tile excerpt--reveal-copy-on-view"" 
            href=""{0}"" 
            id=""excerpt-item-{1}""
            aria-label=""{2}"" 
            target=""_self""
            >
            <picture 
                data-src-img=""{3}""
                data-attr='{{ ""alt"" : """" }}'
                class=""contain contain--excerpt-thumb""
            ></picture>
            <div class=""excerpt__copy"">
                <div class=""excerpt__title"">{2}</div>
                <div class=""excerpt__desc"">{4}</div>
                <div class=""excerpt__link"">
                    <svg class=""icon""><use href=""#icon-chevron""/></svg>
                    <span>Read More</span>
                </div>
            </div>
        </a>
    ";

    var blogPostsEngine = new BlogPostsEngine();
    var blogPosts = blogPostsEngine.GetBlogPostsByTagSlug("articles");

    // Get blog posts
    foreach (var blogPost in blogPosts)
    {
        var id = string.Format("post-id-{0}", blogPosts.IndexOf(blogPost));

        // Fetch unique post thumbnail or default thumbnail
        var thumbnail = blogPostsEngine.GetThumbnail(blogPost);

        // Get permalink by external tag or default permalink
        var url = blogPostsEngine.GetPermalinkByExternalTagOrDefault(blogPost);

        // set target to open in a new tab if the permalink is external
        if (blogPostsEngine.IsExternal(blogPost))
        {
            excerptTemplate = excerptTemplate.Replace("_self", "_blank");
        }

        // Render content using excerpt template
        excerptList += string.Format(
            excerptTemplate,
            url,
            id,
            blogPost.Title,
            thumbnail,
            blogPost.ShortDescription);
    }
%>

<div class="view section">
    <div class="view__anchor" id="main"></div>
    <div class="view__in">
        <div class="hero-banner">
            <h1>In The News</h1>
        </div>
        <div class="excerpt excerpt--list">
            <%= excerptList %>
        </div>
    </div>
</div>

</asp:Content>