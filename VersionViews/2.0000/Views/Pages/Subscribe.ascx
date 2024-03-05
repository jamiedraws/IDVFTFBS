<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<OrderPageViewData>" %>

<div class="bg-secondary emailzone u-pad--vert @x2-pad width-at-100 sans-secondary-book">
	<div class="l-outer__in  block no-background center-margin">
		<div class="row-to-center center-margin u-pad--horz @x2-pad">
			<div class="col u-pad--right center-text @x3-pad mv-block">
				<h5 class="white-text">SIGN UP TO LEARN ABOUT NEW PRODUCTS AND SPECIAL OFFERS</h5>
			</div>
			<div class="col w40 u-pad--left @x2-pad mv-block center-text">
                <div id="subscribeform">
				<%--<form id="subscribeform" onsubmit="event.preventDefault(); saveEmailOptIn();" role="form" aria-labeledby="sign up" class="relative">--%>
					<input type="email" name="emailSubscribe" type="email" id="emailSubscribe" class="animate" placeholder="ENTER EMAIL ADDRESS" required />
					<input type="submit" class="animate button" value="SIGN ME UP"  onclick="return saveEmailOptIn(this);"/>
		<%--		</form>--%>
                </div>
			</div>
		</div>
	</div>
    <div id="subscribemessage" class="subscribe-msg"></div>
</div>


