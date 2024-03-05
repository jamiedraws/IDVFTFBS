<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<% var ProductName = SettingsManager.ContextSettings["Label.ProductName"];
%>

	<input id="main-menu-checkbox" type="checkbox" hidden>

	<header class="l-header @dv-o-shadow--out @print-only-hide">

		<div class="center-text white-text black-background header__tagline">
			<h6 class="sans-secondary-bold uppercase fn--expanded">#1 Brand in women's hair removal</h6>
		</div><!-- end tagline -->

		<div class="bg-secondary center-text u-pad--vert @x2-pad">
			<div class="l-outer__in relative center-margin flex flex--center--vert flex--center--horz">
				<div class="header__logo center-margin">
					<a href="Index<%= Model.Extension %>" data-modal-close title="<%= ProductName %>"><img src="/images/2.0000/logo--pink.png?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= ProductName %>"></a>
				</div>
				<div class="flex-self--right social white-text">
					<% Html.RenderPartial("Social", Model); %>
				</div>
			</div>
		</div><!-- end logo header section -->

		<% if (DtmContext.PageCode != "HowTo") { %>

		<label for="main-menu-checkbox" class="menu-toggle">
			<span class="sr-only">Open main menu</span>
			<span class="pictos h2" aria-hidden="true">l</span>
		</label><!-- mobile menu checkbox -->

		<h1 class="menu-title sans-secondary-bold uppercase h2">menu</h1>

		<!-- // nav -->
		<div class="l-header__nav white-background">
			<div class="@sm-fn--xl l-header__in center-text">
				<!-- nav flex flex--around column-block -->
				<nav id="main-menu" role="navigation" class="main-menu sans-secondary-semibold h4 black-text" aria-expanded="false" aria-label="Main menu">
					<label for="main-menu-checkbox" class="menu-close">
						<span class="sr-only">Close main menu</span>
						<span class="menu-close" aria-hidden="true">X</span>
					</label>
					<ul>
						<li class="nav__link--sub">
							<a href="javascript:void(0);" title="Finishing Touch Flawless Products" class="nav__link">Flawless Products</a>
							<ul class="nav__sub hide">
								<li><a href="FLAWLESS<%= Model.Extension %>" class="nav__link">Finishing Touch&reg; Flawless&reg;</a></li>
								<li><a href="BROWS<%= Model.Extension %>" class="nav__link">Flawless Brows</a></li>
								<li><a href="LEGS<%= Model.Extension %>" class="nav__link">Flawless Legs</a></li>
								<li><a href="DERMAPLANE<%= Model.Extension %>" class="nav__link">Flawless Dermaplane</a></li>
							</ul>
						</li>
						<li class="nav__link--sub">
							<a href="javascript:void(0);" title="Finishing Touch Flawless Videos" class="nav__link">Videos</a>
							<ul class="nav__sub hide">
								<li><a href="videos<%= Model.Extension %>" title="Watch all of the Finishing Touch Flawless Videos" class="nav__link">All Videos</a></li>
								<li><a href="HowTo<%= Model.Extension %>" title="Watch How To Finishing Touch Flawless Videos" class="nav__link">How To Videos</a></li>
							</ul>
						</li>
						<li>
							<a href="FAQ<%= Model.Extension %>" title="Finishing Touch Flawless FAQs" class="nav__link">Frequently Asked Questions</a>
						</li>
						<li>
							<a href="Index<%= Model.Extension %>#story" title="Learn more about Finishing Touch Flawless" class="nav__link">Our Story</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<label for="main-menu-checkbox"
		 class="backdrop"
		 tabindex="-1"
		 aria-hidden="true" hidden></label>

		 <% } %>

	</header>
