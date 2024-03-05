<%@ Page Language="C#" MasterPageFile="~/VersionViews/2.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<section><div class="tertiary-container modal__in">
    <div class="l-outer__in l-outer__page">
        <div class="row-to-center u-mar--vert @x2-mar width-at-100 center-text">
            <div class="col @sm-fn--lg @md-fn--xl page__headline will-slide-from-right @sm-u-vw sans-primary-book italic">
                <h2 data-page-headline="">Site Map</h2>
            </div>
        </div>
        <div class="row page__content">

                        <div class="col page__media will-slide-from-left @md-u-vw--50 hide"></div>

            <div class="col page__copy will-slide-from-right @md-u-vw sans-primary-book"><p>Thank you for choosing Finishing Touch&reg; Flawless&reg;. We are dedicated to your satisfaction and for your convenience, we have provided this Site Map. Thank You!</p>

<ul class="@back-only-hide o-grid--iblock c-list left-margin @x2-mar u-pad--vert">

				  	<!-- // Home -->
					<li>
				    	<a href="Index<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg; | Home" class="c-list__link">Home</a>
				  	</li>

					  <!-- // About Us -->
				  	<li class="c-list__item o-grid--iblock">
                          
				    	<a href="Index<%= Model.Extension %>#story" title="About | <%=SettingsManager.ContextSettings["Label.ProductName"] %> class="c-list__link">Our Story</a>
				  	</li>
  
  <!-- // Customer Service -->
				  	<li class="c-list__item o-grid--iblock">
				    	<a href="Customer-Service<%= Model.Extension %>" title="Customer Service | <%= SettingsManager.ContextSettings["Label.ProductName"] %> class="c-list__link">Customer Service</a>
				  	</li>

				  	<!-- // FLAWLESS -->
				  	<li>
				    	<a href="FLAWLESS<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg;" class="c-list__link">Finishing Touch Flawless</a>
				  	</li>

				  	<!-- // BROWS -->
				  	<li>
				    	<a href="BROWS<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg; Brows" class="c-list__link">Finishing Touch Flawless Brows</a>
				  	</li>

				  	<!-- // LEGS -->
				  	<li>
				    	<a href="LEGS<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg; Legs" class="c-list__link">Finishing Touch Flawless Legs</a>
				  	</li>

				  	<!-- // DERMAPLANE -->
				  	<li>
				    	<a href="DERMAPLANE<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg; Dermaplane" class="c-list__link">Finishing Touch Flawless Dermaplane</a>
				  	</li>


				  	<!-- // Contact Us -->
				  	<li>
				    	<a href="Contact<%= Model.Extension %>" title="Contact | Finishing Touch&reg; Flawless&reg;" class="c-list__link">Contact Us</a>
				  	</li>

  <!-- // Videos -->
				  	<li>
				    	<a href="Videos<%= Model.Extension %>" title="Videos | Finishing Touch&reg; Flawless&reg;" class="c-list__link">Videos</a>
				  	</li>

  <!-- // FAQ -->
				  	<li>
				    	<a href="FAQ<%= Model.Extension %>" title="FAQ | Finishing Touch&reg; Flawless&reg;" class="c-list__link">FAQ</a>
				  	</li>

				  	<!-- // Brand Ambassador -->
				  	<li>
				    	<a href="Ambassador<%= Model.Extension %>" title="Brand Ambassador | Finishing Touch&reg; Flawless&reg;" class="c-list__link">Brand Ambassador</a>
				  	</li>

					   <!-- // Shipping Policy -->
				  	<li>
				    	<a href="/StaticContent.txt?filename=ShippingPolicy&amp;isSelfContained=true" title="<%= SettingsManager.ContextSettings["Label.ProductName"] %> | Shipping Policy" class="c-list__link has-fancybox fancybox.ajax">Shipping Policy</a>
				  	</li>
  
  <!-- // Return Policy -->
				  	<li>
				    	<a href="/StaticContent.txt?filename=ReturnPolicy&amp;isSelfContained=true" title="<%= SettingsManager.ContextSettings["Label.ProductName"] %> | Return Policy" class="c-list__link has-fancybox fancybox.ajax">Return Policy</a>
				  	</li>

				  	<!-- // Privacy Policy -->
				  	<li>
				    	<a href="Privacy-Policy<%= Model.Extension %>" title="Finishing Touch&reg; Flawless&reg; | Privacy Policy" class="c-list__link">Privacy Policy</a>
				  	</li>
					
				</ul>

</div>
        </div>
    </div>
</div></section>

</asp:Content>
