<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.ClientSites.Web" %>
<%@ Import Namespace="IDVFTFBS.Navigation" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>

<section aria-label="View our feed and follow us on Instagram" class="view content content--instagram">
    <div id="instagram-feed" class="view__anchor"></div>
    <div class="section__block">
        <h2 class="content__title">Connect. Follow. Discover.</h2>
    </div>

    <%
        NavigationList sitemap = (ViewData["Sitemap"] as Sitemap ?? new Sitemap()).SitemapList;    
    %>
    <div class="section__block">
        <div class="content__group">
            <%
                Dictionary<string, string> socialHandles = new Dictionary<string, string> {
                    { "instagram", "@flawlessbeauty" },
                    { "facebook", "@Flawlessbeauty" },
                    { "youtube", "Flawlessbeauty" },
                    { "tiktok", "@flawlessbeauty" }
                };

                List<NavigationItem> socialItems = sitemap.GetItemsByIdRange(new List<string>
                {
                    "instagram",
                    "facebook",
                    "youtube",
                    "tiktok"
                });

                socialItems.ForEach(socialItem =>
                {
                    %>
                    <a href="<%= socialItem.Route %>" aria-label="<%= socialItem.Name %>" class="social-media-favicon-link" <%= sitemap.ModifyAttributeList(socialItem) %>>
                        <span class="social-media-favicon-link__favicon">
                            <svg class="icon icon--favicon-circle">
                                <use href="#icon-favicon-circle"></use>
                            </svg>
                            <svg class="icon icon--social">
                                <use href="#icon-<%= socialItem.Id %>"></use>
                            </svg>
                        </span>
                        <% 
                            var handle = socialHandles.Where(sh => sh.Key == socialItem.Id);
                            
                            if (handle.Any())
                            {
                                %>
                                <span class="social-media-favicon-link__link"><%= handle.Select(sh => sh.Value).FirstOrDefault() %></span>
                                <%
                            }
                        %>
                    </a>
                    <%
                });
            %>
        </div>
    </div>
    <div class="instafeed">
        <div class="slide slide--instagram-content">
            <div class="slide__into" tabindex="0" id="instagramSlider">
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/1.jpg" loading="lazy" alt="Emma Roberts getting ready">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/2.jpg" loading="lazy" alt="Flawless products with gold-plated design">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/3.jpg" loading="lazy" alt="Smooth face">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/4.jpg" loading="lazy" alt="Beauty fridge with beauty products">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/5.jpg" loading="lazy" alt="Flawless Pedi">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/6.jpg" loading="lazy" alt="Flawless products">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/7.jpg" loading="lazy" alt="Emma Roberts">
                </div>
                <div class="slide__item">
                    <img src="/images/UPGRADE/instagram/8.jpg" loading="lazy" alt="Beauty fridge">
                </div>
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
        </div>
    </div>
</section>