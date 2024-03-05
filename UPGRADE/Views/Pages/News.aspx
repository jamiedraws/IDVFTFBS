<%@ Page Language="C#" MasterPageFile="~/UPGRADE/Views/Layouts/BlogLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Models.Ecommerce.Repositories" %>
<%@ Import Namespace="IDVFTFBS.BlogPosts" %>
<%@ Import Namespace="IDVFTFBS.Utils" %>
<%@ Import Namespace="HtmlAgilityPack" %>

<asp:Content ID="PageMetadata" ContentPlaceHolderID="PageMetadata" runat="server">

<%
    // the product name
    var productName = SettingsManager.ContextSettings["Label.ProductName"];

    // the current blog category post, provided by the controller
    var category = ViewData["BlogCategory"] as BlogPostView ?? new BlogPostView();

    // the current category name, provided by the controller
    var categoryTitle = ViewData["BlogCategoryName"] as string ?? ViewData["BlogTagName"] as string ?? Model.PageTitle;

    // parse and strip html tags from the category description
    var htmlDoc = new HtmlDocument();
    htmlDoc.LoadHtml(category.ShortDescription ?? String.Empty);

    // default category description
    var defaultDescription = "";

    // the current blog category description
    var categoryDescription = !string.IsNullOrWhiteSpace(category.ShortDescription) 
        ? htmlDoc.DocumentNode.InnerText 
        : defaultDescription;

    // the current blog category image 
    var categoryImage = category.ImageThumbnailPath ?? "";

    // the current blog post permalink route, provided by the controller
    var blogPermalinkRoute = ViewData["BlogPermalinkRoute"] as string;

    // the main blog roll category route, provided by the controller
    var blogCategoryRoute = ViewData["BlogCategoryRoute"] as string;

    // the main blog roll tag route, provided by the controller
    var blogTagRoute = ViewData["BlogTagRoute"] as string;

    var blogUrl = blogPermalinkRoute
        ?? blogCategoryRoute
        ?? blogTagRoute
        ?? string.Empty;

    var categoryMetaTitle = string.Format("{0} | {1}", categoryTitle, productName);    
%>

<title><%= categoryMetaTitle %></title>

<%= Html.Partial("MetaFavicon", new ViewDataDictionary
{
    { "Title", categoryMetaTitle },
    { "Description", categoryDescription },
    { "Url", blogUrl },
    { "Image", categoryImage } 
}) %>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/css/UPGRADE/Site1/blog-category.css" rel="preload" as="style" />
    <link href="/css/UPGRADE/Site1/blog-category.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="PosterImage" ContentPlaceHolderID="PosterImage" runat="server">
<section aria-labelledby="main-title" class="view content content--press section">
    <div id="in-the-press" class="view__anchor"></div>
    <div class="content__header">
        <div class="section__block">
            <h2 id="main-title" class="content__title">In the Press</h2>
        </div>
    </div>
    <div class="slide slide--press slide--carousel">
        <div class="slide__into" tabindex="0" id="press-page-carousel">
            <div id="press-banner-1" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/nails.jpg" alt="Flawless Nail" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;Here's a best-selling, ergonomic nail tool from Finishing Touch that's equipped with a built-in LED light and six attachments to remove cuticles, enhance nail shine, and more.&rdquo;</span>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/bazaar.svg" alt="Harpers BAZAAR" width="125" height="41">
                                </picture>
                                <a href="https://www.harpersbazaar.com/beauty/nails/g38987483/best-nail-drills/" class="content__link" target="_blank" title="Read the full article at Harpers Bazaar, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-2" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/cleanse.jpg" loading="lazy" alt="Flawless Cleanse" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;Not only does this silicone brush do an excellent job of cleansing and exfoliating your skin, but it also has a facial massage mode (which is great for reducing swelling, soothing puffiness, and enhancing your glow).&rdquo;</span>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/cosmopolitan.svg" loading="lazy" alt="COSMOPOLITAN" loading="lazy" width="176" height="41">
                                </picture>
                                <a href="https://www.cosmopolitan.com/style-beauty/beauty/g25473104/best-facial-cleaning-brush/" class="content__link" target="_blank" title="Read the full article at Cosmopolitan, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-3" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/ice.jpg" alt="Flawless Ice" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;This compact one from Finishing Touch packs nicely in a carry-on, and features a quick-freeze gel that takes no more than 15 minutes to cool.&rdquo;</span>
                            <cite>               
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/bazaar.svg" loading="lazy" alt="Harpers BAZAAR" width="125" height="41">
                                </picture>
                                <a href="https://www.harpersbazaar.com/beauty/skin-care/g39387475/best-ice-roller-for-face/" class="content__link" target="_blank" title="Read the full article at Harpers Bazaar, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-4" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/nu-razor.jpg" loading="lazy" alt="Flawless Nu Razor" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;Finishing Touch's Flawless Nu Razor sets itself apart from other electric razors with its unique blade design that has more than 200 points of contact and a pivoting, flat head that practically floats over skin for a close yet comfortable dry shave.&rdquo;</span>
                            <cite>    
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/allure.svg" alt="allure" loading="lazy" width="114" height="41">
                                </picture>
                                <a href="https://www.allure.com/story/best-razors-for-women" class="content__link" target="_blank" title="Read the full article at Allure, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-5" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/nu-razor.jpg" loading="lazy" alt="Flawless Nu Razor" width="325" height="197">
                    <figcaption class="content__text">
                        <span>Emma Roberts Is in Support of Naked Nails This Summer: &ldquo;I&rsquo;m Going Rogue&rdquo;</span>
                        <blockquote>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/marie-claire.svg" alt="marie-claire" loading="lazy" width="175" height="41">
                                </picture>
                                <a href="https://www.marieclaire.com/beauty/emma-roberts-bare-nails-beauty-routine/" class="content__link" target="_blank" title="Read the full article at Marie Claire, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-6" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/bikini.jpg" loading="lazy" alt="Flawless Bikini" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;Very ready and safe to use. Does EXACTLY WHAT IT'S SUPPOSED TO DO! Do NOT mistake this for a cheap knockoff! This is the real deal!&rdquo;</span>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/elle.svg" alt="ELLE" loading="lazy" width="112" height="41">
                                </picture>
                                <a href="https://www.elle.com/beauty/hair/g32671398/best-bikini-trimmer/" class="content__link" target="_blank" title="Read the full article at Elle, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <%--<div id="press-banner-7" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/face.jpg" loading="lazy" alt="Flawless Hair Remover" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;Shoppers love Finishing Touch's razors so much, one even called it a "magical beauty tool."&rdquo;</span>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/real-simple.svg" alt="Real Simple" loading="lazy" width="216" height="25">
                                </picture>
                                <a href="https://www.realsimple.com/beauty-fashion/skincare/finishing-touch-dermaplaning-tools-amazon" class="content__link" target="_blank" title="Read the full article at Real Simple, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-8" class="slide__item">
                <figure class="content__quote">
                    <img class="content__image" src="/images/UPGRADE/pages/press/face.jpg" loading="lazy" alt="Flawless Hair Remover" width="325" height="197">
                    <figcaption class="content__text">
                        <blockquote>
                            <span>&ldquo;If you&rsquo;re sick of paying for waxes or laser hair treatments, the Finishing Touch Flawless Facial Hair Remover is an affordable, efficient way to manage unwanted facial hair without irritation or painful razor snags.&rdquo;</span>
                            <cite>
                                <picture class="content__source">
                                    <img src="/images/UPGRADE/brands/byrdie.svg" alt="BYRDIE" loading="lazy" width="476" height="76">
                                </picture>
                                <a href="https://www.byrdie.com/finishing-touch-flawless-facial-hair-remover-review-5270608" class="content__link" target="_blank" title="Read the full article at Byrdie, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>
            <div id="press-banner-9" class="slide__item">
                <figure class="content__quote content__quote--award">
                    <div class="content__image">
                        <picture class="content__award">
                            <source srcset="/images/UPGRADE/pages/press/she-finds-2022.webp" type="image/webp">
                            <img src="/images/UPGRADE/pages/press/she-finds-2022.png" alt="Best New Beauty Awards 2022 - She Finds" loading="lazy" width="150" height="150">
                        </picture>
                        <img src="/images/UPGRADE/pages/press/bikini.jpg" loading="lazy" alt="Flawless Hair Remover" width="325" height="197">
                    </div>
                    <figcaption class="content__text">
                        <blockquote>
                            <span>Flawless Bikini won one of the Best New Beauty Tools of 2022!</span>
                            <cite>
                                <picture class="content__source">
                                    <source srcset="/images/UPGRADE/brands/she-finds.webp" type="image/webp">
                                    <img src="/images/UPGRADE/brands/she-finds.png" alt="She Finds" loading="lazy" width="158" height="60">
                                </picture>
                                <a href="https://www.shefinds.com/best-new-beauty-awards-2022/#tools-&-accessories" class="content__link" target="_blank" title="Read the full article at She Finds, opens in a new tab">Read Full Article</a>
                            </cite>
                        </blockquote>
                    </figcaption>
                </figure>
            </div>--%>
        </div>
        <div class="slide__nav">
            <button aria-label="Previous" class="slide__prev" type="button">
                <svg class="icon">
                    <use href="#icon-chevron"></use>
                </svg>
            </button>
            <button aria-label="Next" class="slide__next" type="button">
                <svg class="icon">
                    <use href="#icon-chevron"></use>
                </svg>
            </button>
        </div>
        <nav class="slide__thumbnails">
            <a href="#press-banner-1" class="slide__thumbnail" data-slide-index="0">01</a>
            <a href="#press-banner-2" class="slide__thumbnail" data-slide-index="1">02</a>
            <a href="#press-banner-3" class="slide__thumbnail" data-slide-index="2">03</a>
            <a href="#press-banner-4" class="slide__thumbnail" data-slide-index="3">04</a>
            <a href="#press-banner-5" class="slide__thumbnail" data-slide-index="4">05</a>
            <a href="#press-banner-6" class="slide__thumbnail" data-slide-index="5">06</a>
            <%--<a href="#press-banner-7" class="slide__thumbnail" data-slide-index="6">07</a>
            <a href="#press-banner-8" class="slide__thumbnail" data-slide-index="7">08</a>
            <a href="#press-banner-9" class="slide__thumbnail" data-slide-index="8">09</a>--%>
        </nav>
    </div>
    <div class="content__banner">
        <div class="section__in view__in">For press inquiries email us at: <a href="mailto:Flawless@hunterpr.com" id="press-email-address" title="Press Email Address">Flawless@hunterpr.com</a></div>
    </div>
</section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
    // the instance provided by the controller
    var blogPostsEngine = ViewData["BlogPostsEngine"] as BlogPostsEngine ?? new BlogPostsEngine();

    // the collection of blog posts related to the current category, provided by the controller
    var categoryPosts = ViewData["BlogPosts"] as List<BlogPostView> ?? blogPostsEngine.GetBlogPostsByTagSlug("articles");

    // the current blog category post, provided by the controller
    var category = ViewData["BlogCategory"] as BlogPostView ?? new BlogPostView();

    // the current category name, provided by the controller
    var categoryTitle = ViewData["BlogCategoryName"] as string ?? ViewData["BlogTagName"] as string ?? string.Empty;

    var isCategoryPage = blogPostsEngine.BlogPostExists(category);
%>

<main aria-labelledby="main-title" class="view content content--post-cards section">
    <div class="view__anchor" id="main"></div>
    <div class="view__in">
        <div class="content__header content__text">
            <h1 id="main-title" class="content__title"><%= categoryTitle %></h1>
        </div>
        <div class="section__block">
            <div class="content__group">
                <%
                    ImageEngine logos = new ImageEngine("brands", "images/UPGRADE/brands");

                    categoryPosts = categoryPosts
                        .OrderByDescending(cp => cp.Tags.Any(t => string.Equals(t, "EXTERNAL", StringComparison.InvariantCultureIgnoreCase)))
                        .ThenByDescending(cp => cp.ChangeDate).ToList();

                    foreach (var blogPost in categoryPosts)
                    {
                        string postCardClassList = "post-card content__figure";

                        // Fetch unique post thumbnail or default thumbnail
                        var thumbnail = blogPostsEngine.GetThumbnail(blogPost);

                        // Get permalink by external tag or default permalink
                        var url =  blogPostsEngine.GetPermalinkByExternalTagOrDefault(blogPost);

                        bool isExternal = blogPostsEngine.IsExternal(blogPost);

                        // set the link attribute list
                        var linkAttributeList = string.Format(@"href=""{0}""", url);

                        // set target to open in a new tab if the permalink is external
                        if (isExternal)
                        {
                            linkAttributeList = string.Format(@"{0} target=""_blank""", linkAttributeList);

                            string host = new Uri(url).Host;
                            string domain = host.Substring(host.LastIndexOf('.', host.LastIndexOf('.') - 1) + 1).Split('.').FirstOrDefault() ?? String.Empty;

                            if (!string.IsNullOrEmpty(domain))
                            {
                                postCardClassList = string.Format("{0} post-card--{1}", postCardClassList, domain);
                            }
                        }

                        // truncate description
                        var maxDescriptionChars = 100;

                        // parse and strip html tags from the category description
                        var htmlDoc = new HtmlDocument();
                        htmlDoc.LoadHtml(blogPost.ShortDescription ?? String.Empty);

                        var description = htmlDoc.DocumentNode.InnerText;
                        var shortDescription = description;

                        if (description.Length >= maxDescriptionChars)
                        {
                            shortDescription = string.Format(@"{0}...", shortDescription.Substring(0, maxDescriptionChars));
                        }
                        %>
                        <figure class="<%= postCardClassList %>">
                            <a <%= linkAttributeList %> class="post-card__picture contain contain--post-card">
                                <img src="<%= blogPostsEngine.GetThumbnail(blogPost) %>" alt="" width="" height="" loading="lazy" />
                            </a>
                            <%
                                if (isExternal)
                                {
                                    string host = new Uri(url).Host;
                                    string domain = host.Substring(host.LastIndexOf('.', host.LastIndexOf('.') - 1) + 1).Split('.').FirstOrDefault() ?? String.Empty;
                                    string logo = logos.FallbackImages.FirstOrDefault(fi => domain.Contains(logos.GetImageFileName(fi)));

                                    if (!string.IsNullOrEmpty(logo))
                                    {
                                        %>
                                        <picture class="post-card__logo">
                                            <img src="<%= logos.FormatRelativeImagePath(logo) %>" alt="" loading="lazy"/>
                                        </picture>
                                        <%
                                    }
                                }
                            %>
                            <figcaption class="post-card__caption">
                                <h2 class="post-card__title"><%= blogPost.Title %></h2>
                            </figcaption>
                            <div class="post-card__footer">
                                <a <%= linkAttributeList %> class="post-card__link">
                                    <span>See Full Article</span>
                                </a>
                            </div>
                        </figure>
                        <%
                    }
                %>
            </div>
        </div>
    </div>
</main>

</asp:Content>