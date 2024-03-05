<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
	var finishingTouch = "Finishing Touch";
    var flawless = "Flawless";
    var flawlessBody = "Body";
    var flawlessBrows = "Brows";
    var flawlessLegs = "Legs";
%>
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
			<h2 class="sans-secondary-book center-text uppercase color-gray u-pad--vert @x2-pad fn--expand reviews__title h1">
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
							<h4 data-quote-title class="sans-secondary-book"></h4>
						</li>
					</ul>
				</div>
			</div><!-- end .l-outer__in -->
		</div>
	</div>

<% } %>

<div class="white-background width-at-100 middle">
<div id="story" class="story no-padding">
	<div class="story__img">
	</div>
	<div class="story__text sans-secondary-book color-gray">
		<h2 class="uppercase story__title sans-secondary-semibold story__title">our story</h2>
		<p class="h5 u-mar--vert @x2-mar">The <%= flawless %> mission is to help women everywhere look and feel their best. We provide the best, innovative solutions for everyday beauty problems by making products that provide the <%= finishingTouch %> needed to look and feel <%= flawless %> every day.</p>
		<a href="javascript:void(0);" onclick="$(this).hide();$('#story1').show();$('#story2').show();" class="mv-show">View More</a>
		<p id="story1" class="h5 u-mar--vert mv-hidden @x2-mar">We've all experienced the "uh-oh" moment when you see a stray chin hair, notice a shadow over your lip, or spot the dreaded growth of a unibrow. The literal and figurative pain of waxing, shaving, lasering and layering of chemicals to fight this battle only lends in pain and embarrassment of these moments. Whether you're just entering the world of beauty, or a beauty veteran, these moments pop up consistently throughout our lives and effect the way we present ourselves throughout our day.</p>
		<p id="story2" class="h5 u-mar--vert mv-hidden @x2-mar"><%= productName %> knows all too well what it's like when you look in the mirror and what you see on the outside, affects how you feel on the inside.</p>
	    <h3 class="center-text h2 sans-secondary-book">Be Flawless From Head To Toe&trade;</h3>
    </div>
</div>
</div>

