<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="IDVFTFBS.CampaignProduct" %>

<%
 var imageLoad = ViewData["imageLoad"] as string ?? "";
 var htmlClasses = ViewData["htmlClasses"] as string ?? "";
%>

<div class="slide slide--carousel <%= htmlClasses %>">
    <div class="slide__into" tabindex="0" id="reviews-carousel">
        <div class="slide__item">
            <div class="content__group">
                <div class="content__image">
                    <img src="/images/review-1.jpg" loading="<%= imageLoad %>" alt="" width="598" height="500">
                </div>
                <div class="content__quote">
                    <blockquote class="quote">
                        <svg class="quote__stars icon icon-stars">
                            <use href="#icon-stars"></use></svg>
                        <span class="quote__text">It is a little expensive when compared to other rinses, but aren't our teeth worth it? As adults, we only have one set! I will continue to use this, and I'll reorder!</span>
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="slide__item">
            <div class="content__group content__group--reverse">
                <div class="content__image">
                    <img src="/images/review-2.jpg" loading="<%= imageLoad %>" alt="" width="598" height="500">
                </div>
                <div class="content__quote">
                    <blockquote class="quote quote--secondary">
                        <svg class="quote__stars icon icon-stars">
                            <use href="#icon-stars"></use></svg>
                        <span class="quote__text">I have tried teeth whitening charcoal products before and this product has given me whiter results within a few days of using it. If you're looking for a good bad breath toothpaste as well, I would definitely recommend this toothpaste. I am never going back to ordinary toothpaste again!</span>
                    </blockquote>
                </div>
            </div>
        </div>
        <div class="slide__item">
            <div class="content__group">
                <div class="content__image">
                    <img src="/images/review-3.jpg" loading="<%= imageLoad %>" alt="" width="598" height="500">
                </div>
                <div class="content__quote">
                    <blockquote class="quote quote--accent">
                        <svg class="quote__stars icon icon-stars">
                            <use href="#icon-stars"></use></svg>
                        <span class="quote__text">Do you take medication that turns your mouth into what feels like the Death Valley in the middle of summer? Then these lozenges are for you. Take one, allow it to completely dissolve and your dryness is gone for hours! My neurologist had never heard of these lozenges so I educated him about the benefits. He put one in his mouth and in five minutes he told me he would be buying several boxes for other patients to try. They really do what they are advertised for.</span>
                    </blockquote>
                </div>
            </div>
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