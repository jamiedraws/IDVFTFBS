<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<% var ProductName = SettingsManager.ContextSettings["Label.ProductName"]; %>

<%
	var quotesCategory = DtmContext.CampaignCategories.Where(c => c.Code == "QUOTES");
	var quotesTitle = quotesCategory.Select(s => s.Name).FirstOrDefault();
	var quotesStars = string.Empty;
%>

<% if ( quotesTitle != null ) { %>

	<% quotesTitle = quotesTitle ?? "Customer Reviews"; %>

	<% if ( quotesTitle == "Customer Reviews" ) { %>
		<% quotesStars = "Five Star "; %>
	<% } %>

	<div class="width-at-100 reviews">
		<div class="u-pad--vert @x3-pad">
			<h2 class="sans-secondary-semibold center-text uppercase color-gray u-pad--vert @x2-pad fn--expand">
				<%= quotesStars %> <%= quotesTitle %>
				<!-- Five Star Customer Reviews -->
			</h2>
			<div class="l-outer__in no-background center-margin">
				<div class="@sm-fn--xl quote-container center-text">
					<ul class="quote--list quote--contains-template set-slide-from-right" data-eflex-pause-on-hover>
						<li class="quote--is-template quote__item center-text @sm-u-vw--75 center-margin">
							<blockquote class="sans-secondary-book h4"><span data-quote-copy></span></blockquote>
							<div class=" quote__stars center-margin">
									<span data-quote-stars>
											<%= Html.Partial("GetStars") %>
									</span>
							</div>
							<h4 data-quote-title class="sans-secondary-semibold"></h4>
						</li>
					</ul>
				</div>
			</div><!-- end .l-outer__in -->
		</div>
	</div>

<% } %>

<div class="white-background width-at-100 u-pad--vert @x3-pad middle">
<div class="l-outer__in center-margin">
	<div class="row width-at-100 u-pad--vert @x3-pad difference">
		<div class="col width-at-60 center-text mv-block">
			<h2 class="sans-secondary-semibold uppercase color-gray bottom-padding">See the Difference!</h2>
			<img src="/images/2.0000/difference.png?appV=<%= DtmContext.ApplicationVersion %>" alt="See the difference">
		</div>
		<div class="col width-at-40 left-padding @x3-pad mv-block">
			<h2 class="sans-secondary-semibold uppercase color-gray bottom-padding mobile-title">Flawless Features</h2>
			<ul class="fb__list sans-secondary-book">
				<li>Instant and Pain-Free Hair Removal</li>
				<li>Built-in light</li>
				<li>Safe on any skin type</li>
				<li>Dermatologist recommended</li>
				<li>1 AA Battery Included</li>
				<li>Head is gold plated</li>
				<li>Hair will not grow back thicker or faster</li>
				<li>No nicks, cuts, irritation, bumps or redness</li>
			</ul>
		</div>
	</div><!-- end difference -->
	<div id="story" class="story">
		<div class="story__text sans-secondary-book color-gray center-text">
			<h2 class="uppercase fn--expanded sans-secondary-semibold">our story</h2>
			<p class="h5 u-mar--vert">The Flawless mission is to help women everywhere look and feel their best. We provide the best, innovative solutions for everyday beauty problems by making products that provide the Finishing Touch needed to look and feel Flawless every day.</p>
			<a href="javascript:void(0);" onclick="$(this).hide();$('#story1').show();$('#story2').show();" class="mv-show">View More</a>
			<p id="story1" class="h5 u-mar--vert mv-hidden">We've all experienced the "uh-oh" moment when you see a stray chin hair, notice a shadow over your lip, or spot the dreaded growth of a unibrow. The literal and figurative pain of waxing, shaving, lasering and layering of chemicals to fight this battle only lends in pain and embarrassment of these moments. Whether you're just entering the world of beauty, or a beauty veteran, these moments pop up consistently throughout our lives and effect the way we present ourselves throughout our day.</p>
			<p id="story2" class="h5 u-mar--vert mv-hidden">Finishing Touch Flawless knows all too well what it's like when you look in the mirror and what you see on the outside, effects how you feel on the inside.</p>
		</div>
		<div class="clearfix"></div>
	</div><!-- end story -->
</div>
</div>

