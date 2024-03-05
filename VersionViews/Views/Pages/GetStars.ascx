<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
	var rating = (int?)ViewData["rating"] ?? 5;
%>

<div class="c-list--horz c-list list--stars stars--score">
	<% for ( var i = 0; i < rating; i++ ) { %>
		<span class="c-list__item list__star">
			<i class="icon-star-full"></i>
		</span>
	<% } %>
</div>
