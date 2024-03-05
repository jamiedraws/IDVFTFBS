<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>

<%
    var Title = Request["title"] ?? (String)ViewData["title"] ?? string.Empty;
    var Image = Request["image"] ?? (String)ViewData["image"] ?? string.Empty;
    var Desc = Request["desc"] ?? (String)ViewData["desc"] ?? string.Empty;
    var CallToAction = Request["cta"] ?? (String)ViewData["cta"] ?? string.Empty;
    var Actions = Request["actions"] ?? string.Empty;
    var imageClasses = !String.IsNullOrEmpty(Image) ? "page__logo--has-content" : "hide";
%>

<div class="tertiary-container">
    <div class="l-outer__in l-outer__page">
        <div class="row-to-center u-mar--vert @x2-mar width-at-100 center-text">
            <div class="col page__logo <%= imageClasses %> will-slide-from-left @sm-u-vw--30">
                <img data-page-logo class="u-mar--center" src="/images/pages/<%= Image %>?appV=<%= DtmContext.ApplicationVersion %>" alt="<%= Title %>">
            </div>
            <div class="col @sm-fn--lg @md-fn--xl page__headline will-slide-from-right @sm-u-vw sans-primary-book italic">
                <h2 data-page-headline><%= Title %></h2>
            </div>
        </div>
        <div class="row page__content">
            <%
                try {
                    if ( Model.UpsellActions != null ) {
                        var upsellActions = Model.UpsellActions;
                        if (upsellActions.Count > 0) {
                            %>
                            <div class="col page__media will-slide-from-left @md-u-vw--50">
                            <%
                            var action = upsellActions[0];
                            foreach (var product in action.NewProducts) {
                                Response.Write(product.Description);
                            }
                            %>
                            </div>
                            <%
                        }
                    }
                } catch (Exception exception) {
                    if ( !String.IsNullOrEmpty(Actions) ) {
                        %>
                        <div class="col page__media will-slide-from-left @md-u-vw--50"></div>
                        <%
                    }
                }
            %>
            <div class="col page__copy will-slide-from-right @md-u-vw sans-primary-book">
                <%= Desc %>
            </div>
        </div>
        <div class="page__calltoaction will-slide-from-left">
            <%= CallToAction %>
        </div>
    </div>
</div>