<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    string itemId = (string)ViewData["itemId"];
    string price = (string)ViewData["price"];
    string midCsv = (string)ViewData["midCsv"];
    string accountId = (string)ViewData["accountId"] ?? "24869";
    string sendItemId = (string)ViewData["sendItemId"] ?? "true";
    string preConversion = (string)ViewData["isPreConversion"] ?? "false";
    string showViewItemOnly = (string)ViewData["showViewItemOnly"] ?? "false";

    var pageCodeProductIdMap = new Dictionary<string, string>()
    {
        {"PEDI","11798971" },
        {"NAILS","11798972" },
        {"SPA","11798964" },
        {"PBLUE","11798967" },
        {"BROWPB","11798962" },
        {"CLEANSE","11798963" },
        {"NU","11798970" },
        {"GLO","11798966" },
        {"ICE","11798968" },
        {"NFRIG","11798961" },
        {"CONTOUR","11798965" },
        {"LEGS","11798969" },
        {"MASK","11798973" },
        {"REPLACEMENT","11798970" }
    };
    var productIdMap = new Dictionary<string, string>()
    {
        {"PEDI,PREP","11798971" },
        {"NAILS,SNREP2","11798972" },
        {"SPA,SPAREP,CSREP","11798964" },
        {"PBLUE,R219,RF30,R2","11798967" },
        {"BROWPB","11798962" },
        {"CLEANSE","11798963" },
        {"NU,NUREP","11798970" },
        {"GLO,GLOREP","11798966" },
        {"ICE","11798968" },
        {"NFRIG,NFRIGFS","11798961" },
        {"CONTOUR","11798965" },
        {"LEGS,LEG,LEGT,LEGREP","11798969" },
        {"MASK","11798973" }
    };
    bool passItem = true;
    bool isPreConversion = false;
    bool treatAsUpsell = false;

    Boolean.TryParse(sendItemId, out passItem);
    Boolean.TryParse(preConversion, out isPreConversion);
    Boolean.TryParse(showViewItemOnly, out treatAsUpsell);

    if (String.IsNullOrWhiteSpace(itemId))
    {
        new SiteExceptionHandler("Pixel is missing Item ID parameter");
        return;
    }
    if (String.IsNullOrWhiteSpace(price))
    {
        new SiteExceptionHandler("Pixel is missing Price parameter");
        return;
    }
    if (String.IsNullOrWhiteSpace(midCsv))
    {
        new SiteExceptionHandler("Pixel is missing MID parameter");
        return;
    }

    if (String.IsNullOrWhiteSpace(accountId))
    {
        new SiteExceptionHandler("Pixel is missing Account ID parameter");
        return;
    }

    var isUpsell = DtmContext.Page.PageType.ToUpper() == "UPSELL" || treatAsUpsell;

    var conversionOrderStatus = new[] { 3 };
    var fireLanding = DtmContext.Page.IsStartPageType && !treatAsUpsell;
    var fireConversion = !DtmContext.Page.IsStartPageType
        && DtmContext.PageCode.ToUpper().Contains("CONFIRMATION")
        && conversionOrderStatus.Contains(DtmContext.Order.OrderStatusId);
    if (fireConversion)
    {
        const string conversionLabel = "CriteoConversion";
        var vsRepo = new Dtm.Framework.Models.Ecommerce.Repositories.VisitorSessionRepository();
        var conversionValue = vsRepo.GetVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel);
        const string coversionExpectedValue = "1";
        var hasAlreadyConverted = conversionValue == coversionExpectedValue;
        if (hasAlreadyConverted)
        {
            fireConversion = false;
        }
        else
        {
            vsRepo.SaveVisitorSessionData(DtmContext.VisitorSessionId, conversionLabel, coversionExpectedValue);
        }
    }
    var pageCode = DtmContext.PageCode;
    var products = TempData["Products"] as List<Dtm.Framework.Base.Models.CampaignProductView> ?? TempData["CriteoProducts"] as List<Dtm.Framework.Base.Models.CampaignProductView>;
    var isHomePage = DtmContext.Page.IsStartPageType && DtmContext.PageCode.ToUpper() == "INDEX";
    var isSearch = DtmContext.PageCode.ToUpper() == "SEARCHRESULTS" && products != null;
    var isProductPage = pageCodeProductIdMap.Where(x => x.Key.ToUpper() ==  DtmContext.PageCode.ToUpper()).Any();
    var isCartPage = (DtmContext.PageCode.ToUpper() == "CHECKOUT" || DtmContext.PageCode.ToUpper() == "SHOPPINGCART") && DtmContext.ShoppingCart.Any();
    var isVisit = (!isHomePage && !isSearch && !isProductPage && !isCartPage) && !fireConversion;

    var shoppingCart = DtmContext.ShoppingCart.Where(x => x.CampaignProduct.ProductTypeId != 6  && x.CampaignProduct.ProductTypeId != 9 
    && !x.CampaignProduct.ProductCode.Contains("ADAPT")  && !x.CampaignProduct.ProductCode.Contains("BODREP"));

    if (isVisit)
    {
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js?a=<%=accountId %>" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewPage" }

    );
</script>
<%}
    if (isHomePage)
    {
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js?a=<%=accountId %>" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewHome" }

    );
</script>


<%
    }


    if (isSearch)
    {

        var productCodeArray = products.Select(p => p.ProductCode);
        var itemIdFinalList = new List<string>() { };
        foreach (var item in pageCodeProductIdMap)
        {
            var productCodes = item.Key;
            var criteoId = item.Value;

            foreach (var product in productCodeArray)
            {
                if (productCodes == product)
                {
                    itemIdFinalList.Add(criteoId);
                }
            }
        }
        var finalSearchlist = itemIdFinalList.Distinct().Take(3);

%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js?a=<%=accountId %>" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        {
            event: "viewList", item: [
                <%foreach (var item in finalSearchlist )
    {%>
                "<%=item%>"
   <% 
    if (item != finalSearchlist.Last())
    {%>
                ,
        <%}
    }%>
            ]
        }
    );
</script>

<%}
    if (isProductPage)
    {
        var product = pageCodeProductIdMap.Where(x => x.Key.Contains(DtmContext.PageCode.ToUpper())).FirstOrDefault().Value;
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js?a=<%=accountId %>" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        { event: "viewItem", item: "<%=product%>" }

    );
</script>
<!-- End Impression -->

<%}
    if (isCartPage)
    {
%>
<!-- Begin Impression -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js?a=<%=accountId %>" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        {
            event: "viewBasket", item: [
                <%foreach (var item in shoppingCart)
    {
        var criteoFinalId = "";
        foreach (var product in productIdMap)
        {
            var productCodes = product.Key.Split(',').ToList();
            var criteoId = product.Value;

            if (productCodes.Contains(item.CampaignProduct.ProductCode))
            {
                criteoFinalId = criteoId;
            }

        }
    %>
                { id: "<%=criteoFinalId%>", price: <%=item.Price%>, quantity: <%=item.Quantity%> }
           <%     if (item != shoppingCart.Last())
    {%>
                ,
        <%}
    }%>


            ]
        }

    );
</script>
<!-- End Impression -->
<% }
    else if (fireConversion)
    {
%>
<!-- Begin Conversion -->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    var deviceType = /iPad/.test(navigator.userAgent) ? "t" : /Mobile|iP(hone|od)|Android|BlackBerry|IEMobile|Silk/.test(navigator.userAgent) ? "m" : "d";
    window.criteo_q.push(
        { event: "setAccount", account: <%= accountId %> },
        { event: "setSiteType", type: deviceType },
        {
            event: "trackTransaction", id: "<%= DtmContext.Order.OrderID%>",

            item: [

            <%foreach (var item in DtmContext.Order.ContextOrderItems.Where(x => x.CachedProductInfo.ProductTypeId != 6  && x.CachedProductInfo.ProductTypeId != 9 
              && !x.CachedProductInfo.ProductCode.Contains("ADAPT")  && !x.CachedProductInfo.ProductCode.Contains("BODREP")).ToList())
    {
         var criteoFinalId = "";
        foreach (var product in productIdMap)
        {
            var productCodes = product.Key.Split(',').ToList();
            var criteoId = product.Value;

            if (productCodes.Contains(item.CampaignProduct.ProductCode))
            {
                criteoFinalId = criteoId;
            }

        }
        %>
            { id: "<%= criteoFinalId %>", price: "<%=item.Price %>", quantity: <%=item.Quantity%> }

             <%     if (item != DtmContext.Order.ContextOrderItems.Where(x => x.CachedProductInfo.ProductTypeId != 6  && x.CachedProductInfo.ProductTypeId != 9 
                    && !x.CachedProductInfo.ProductCode.Contains("ADAPT") && !x.CachedProductInfo.ProductCode.Contains("BODREP")).Last())
    {%>
            ,
        <%}
    }%>



            ]
        }
    );
</script>
<!-- End Conversion -->
<%
    }%>