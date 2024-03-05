<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="IDVFTFBS.Models" %>
<%@ Import Namespace="IDVFTFBS.Utils" %>

<style>
    .delay-render {
        opacity: 0;
        animation: none;
        transition: none;
    }
</style>
<noscript>
    <style>
        .delay-render {
            opacity: 1;
        }
    </style>
</noscript>

<link rel="preconnect" href="https://use.typekit.net/" crossorigin>
<link rel="dns-prefetch" href="https://use.typekit.net/">
<link rel="stylesheet" href="https://use.typekit.net/ctq6auo.css">

<%
    ResourceWriter resourceWriter = ViewData["ResourceWriter"] as ResourceWriter ?? new ResourceWriter();

    var isIndex = DtmContext.PageCode == "Index";
    var isFrontPage = DtmContext.Page.IsStartPageType;
    var isPayment = DtmContext.Page.PageCode == "ProcessPayment";

    var isCheckout = DtmContext.PageCode == "Checkout";
    var isConfirmation = DtmContext.PageCode == "Confirmation";

    var landingPages = new string[] { "HowTo" };
    var isLandingPage = DtmContext.Page.PageType == "SubPage" || landingPages.Contains(DtmContext.PageCode);

    var accountPages = new string[] { "Account", "Login", "Register", "StoreCustomerProfile" };
    var isAccountPage = accountPages.Contains(DtmContext.PageCode);

    // preload critical stylesheets
    var preloadStyles = new List<string>
    {
        "css/UPGRADE/Site1/shell.css"
    };

    if (isLandingPage)
    {
        preloadStyles.Add("css/UPGRADE/Site1/landing-page.css");
    }

    if (isConfirmation)
    {
        preloadStyles.Add("css/UPGRADE/Site1/confirmation.css");
    }

    if (isAccountPage) 
    {
        preloadStyles.Add("css/UPGRADE/Site1/account.css");
    }

    foreach (var preloadStyle in preloadStyles)
    {
        Response.Write(resourceWriter.WriteStylePreload(preloadStyle));
    }

    // preload critical scripts
    var preloadScripts = new List<string>
    {

    };

    foreach (var preloadScript in preloadScripts)
    {
        %>
        <link rel="preload" href="<%= preloadScript %>" as="script">
        <%
    }

    // request critical stylesheets
    var criticalStyles = new List<string>
    {
        "css/UPGRADE/Site1/shell.css"
    };

    if (isLandingPage)
    {
        criticalStyles.Add("css/UPGRADE/Site1/landing-page.css");
    }

    if (isConfirmation)
    {
        criticalStyles.Add("css/UPGRADE/Site1/confirmation.css");
    }

    if (isAccountPage)
    {
        criticalStyles.Add("css/UPGRADE/Site1/account.css");
    }
    
    if (isPayment)
    {
        criticalStyles.Add("css/UPGRADE/Site1/processpayment.css");
        criticalStyles.Add("/shared/js/fancybox/2.1.5/jquery.fancybox.min.css");
    }

    foreach (var criticalStyle in criticalStyles)
    {
        Response.Write(resourceWriter.WriteLink(criticalStyle));
    }

    // request critical scripts. inform browser to defer script execution to document parse completion
    var criticalScripts = new List<string>
    {
    };

    if (isPayment)
    {
        criticalScripts.Add("/shared/js/fancybox/2.1.5/jquery.fancybox.pack.js");
    }

    foreach (var criticalScript in criticalScripts)
    {
        Response.Write(resourceWriter.WriteScriptDefer(criticalScript));
    }

    // request deferred stylesheets
    var deferStyles = new List<string> {

    };

    foreach (var deferStyle in deferStyles)
    {
        Response.Write(resourceWriter.WriteLinkDefer(deferStyle));
    }

    // request deferred scripts. inform browser to defer script execution to document parse completion
    var deferScripts = new List<string>
    {
        "js/UPGRADE/Site1/app.es5.js",
        "js/UPGRADE/Site1/form.es5.js"
    };

    if (isFrontPage)
    {
        //deferScripts.Add("js/UPGRADE/Site1/shoppingcart.js");
    }

    foreach (var deferScript in deferScripts)
    {
        Response.Write(resourceWriter.WriteScriptDefer(deferScript));
    }
%>