<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/BlogArticle.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<%@ Import Namespace="Dtm.Framework.Base.TokenEngines" %>
<%@ Import Namespace="IDVFTFBS.BlogPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% 
    // the instance provided by the controller
    var blogPostsEngine = ViewData["BlogPostsEngine"] as BlogPostsEngine ?? new BlogPostsEngine();

    // the current blog post, provided by the controller
    var blogPost = ViewData["BlogPost"] as BlogPostView ?? new BlogPostView();

    // the current blog roll category slug, provided by the controller
    var categorySlug = ViewData["BlogCategorySlug"] as string ?? blogPost.Categories.FirstOrDefault() ?? string.Empty;

    // the current blog roll category title, provided by the controller
    var categoryTitle = ViewData["BlogCategoryName"] as string ?? categorySlug.Replace("-", " ");

    // the current blog roll tag slug, provided by the controller
    var tagSlug = ViewData["BlogTagSlug"] as string ?? blogPost.Tags.FirstOrDefault() ?? string.Empty;
%>

<main aria-labelledby="main-title" class="article article--contain article--post">
    <div class="article__title section__block hero-banner">
        <% 
            var hasCategory = !string.IsNullOrEmpty(categoryTitle);
        %>
        <% if (hasCategory) { %>
            <strong class="article__category"><%= categoryTitle %></strong>
        <% } %>
        <h1 id="main-title"><%= blogPost.Title %></h1>
    </div>

    <article class="article__copy section__block">
        <%
            var pubDate = blogPost.ChangeDate.ToString("dddd, MMMM dd, yyyy");  
            var dateTime = blogPost.ChangeDate.ToString("o");
            var author = blogPost.Author ?? string.Empty;
        %>
        <div class="article__date-address">
            <time dattime="<%= dateTime %>"><%= pubDate %></time>
            <address><%= author %></address>
        </div>
        <div class="article__copy">
            <%
                var article = string.Empty;

                if (blogPostsEngine.IsExternal(blogPost))
                {
                    var thumbnail = blogPostsEngine.GetThumbnail(blogPost);
                    var description = blogPost.Description ?? string.Empty;

                    article = string.Format(@"
                        <picture 
                            class=""contain contain--excerpt-thumb"" 
                            data-src-img=""{0}""
                            data-attr='{{ ""alt"" : """" }}'></picture>
                    ", thumbnail);

                    if (description.StartsWith("https://") || description.StartsWith("http://"))
                    {
                        article = string.Format(@"
                        <a 
                            id=""external-excerpt-thumbnail""
                            target=""_blank""
                            href=""{0}""
                            class=""article__link"">{1}</a>
                        ", description, article);
                    }

                } else
                {
                    var toke = new TokenEngine();

                    article = toke.Process(blogPost.Description, baseClientViewData: Model).Content;
                }
            %>
            <%= article %>
        </div>
    </article>

    <%
        var prevPost = blogPostsEngine.GetPreviousPost(blogPost, categorySlug, tagSlug);
        var nextPost = blogPostsEngine.GetNextPost(blogPost, categorySlug, tagSlug);
    %>

    <nav aria-label="View other articles" class="article article--nav">
        <% if (blogPostsEngine.BlogPostExists(prevPost)) { %>
        <a href="<%= prevPost.UrlSlug %>" class="article__prev">
            <svg class="icon icon--chevron">
                <use href="#icon-chevron"></use>
            </svg>
            <span>Previous</span>
        </a>
        <% } %>
        <% if (blogPostsEngine.BlogPostExists(nextPost)) { %>
        <a href="<%= nextPost.UrlSlug %>" class="article__next">
            <svg class="icon icon--chevron">
                <use href="#icon-chevron"></use>
            </svg>
            <span>Next</span>
        </a>
        <% } %>
    </nav>
</main>

</asp:Content>