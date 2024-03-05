<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<div class="medium-6 columns email-sub search-sub">
    <%using (Html.BeginForm("Search", "Search", FormMethod.Post, new { data_processing_message= "Searching", onsubmit = "return document.getElementById('text').value.replace(/^\\s+|\\s+$/,'').length != 0;" }))
    {%>
        
    <div class="flex-start--right has-search-icon">
    <%= Html.Hidden("text", ViewData["text"])%>
    <%= Html.Hidden("versionNumber", DtmContext.Version.ToString("N4"))%>
    <%=Html.TextBox("textS", ViewData["textS"], new { placeholder = "Search...", onkeyup = "document.getElementById('text').value = this.value;", required="required", pattern="^[a-zA-Z0-9_ ]*$" })%>   
    <button id="searchSubmit" type="submit">
        <span>GO</span>
    </button>
        <span id="rData"></span>
			
        		</div>
    <%}%>
</div>
            
