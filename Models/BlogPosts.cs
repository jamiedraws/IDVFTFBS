using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models.Ecommerce;
using Dtm.Framework.Models.Ecommerce.Repositories;

namespace IDVFTFBS.Models
{
    public class BlogPosts
    {
        public readonly string DefaultThumbnail;

        public BlogPosts (string defaultThumbnail = null) {
            DefaultThumbnail = defaultThumbnail ?? "/images/blogs/default/default.svg";
        }

        // Get blog posts
        public List<BlogPost> GetBlogPostList ()
        {
            var blogRepo = new BlogPostRepository();

            return blogRepo.Context.BlogPosts
                .Where(bp => bp.CampaignCode == DtmContext.CampaignCode && bp.IsApproved)
                .OrderByDescending(bp => bp.AddDate).ToList();
        }

        // Check if blog post is tagged with external
        public bool IsExternal (BlogPost blogPost)
        {
            return blogPost.BlogPostsBlogTags
                .Any(t => t.BlogTag.Name.Equals("EXTERNAL", StringComparison.InvariantCultureIgnoreCase));
        }

        // Fetch unique post thumbnail or default thumbnail
        public string GetThumbnail (BlogPost blogPost)
        {
            var hasThumbnail = !string.IsNullOrEmpty(blogPost.Meta) 
                && File.Exists(DtmContext.ProjectPath + blogPost.Meta ?? string.Empty);

            return hasThumbnail ? blogPost.Meta : DefaultThumbnail;
        }

        // Fetch full URL structure for unique post thumbnail or default thumbnail
        public string GetFullPathThumbnail (BlogPost blogPost)
        {
            return DtmContext.Domain.FullDomain + GetThumbnail(blogPost);
        }

        // Get default permalink
        public string GetPermalink (BlogPost blogPost)
        {
            return string.Format("{0}Articles/{1}", DtmContext.Domain.FullDomain, blogPost.UrlSlug);
        }

        // Get permalink by external tag or default permalink
        public string GetPermalinkByExternalTagOrDefault (BlogPost blogPost)
        {
            var permalink = GetPermalink(blogPost);

            if (IsExternal(blogPost))
            {
                var description = blogPost.Description ?? string.Empty;
                var isUrl = description.StartsWith("https://") || description.StartsWith("http://");

                if (isUrl)
                {
                    permalink = description;
                }
            }
            
            return permalink;
        }
    }
}