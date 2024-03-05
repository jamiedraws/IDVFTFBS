<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%if (DtmContext.Page.IsStartPageType)
    { %>
	<link href="<%= Url.Content("~/Shared/css/jquery-ui.custom.min.css") %>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%= Url.Content("~/Shared/js/jquery-ui-1.8.17.custom.min.js") %>"></script>
	<script type="text/javascript">
        (function () {
            var EIPU = function (params) {
                return new Library(params);
            };

            var Library = function (params) {
                var self = this;
                for (var x in params) {
                    this[x] = params[x];
                }
                for (var i = 0; i < params.length; i++) {
                    this[i] = params[i];
                }
                this.length = params.length;
                this.tickTock = 0;

                if (self.C != '') {
                    $('#specialOfferContent').html(self.C);
                }

                if (self.U != '') {
                    $('#specialOfferContent').find('a').attr('href', self.U);
                }

                if (self.I != '') {
                    $('#specialOfferContent').find('img').attr('src', self.I);
                }

                function ouibounce(el, config) {
                    var config = config || {},
                        aggressive = config.aggressive || false,
                        sensitivity = setDefault(config.sensitivity, 20),
                        timer = setDefault(config.timer, 1000),
                        delay = setDefault(config.delay, 0),
                        callback = config.callback || function () { },
                        cookieExpire = setDefaultCookieExpire(config.cookieExpire) || '',
                        cookieDomain = config.cookieDomain ? ';domain=' + config.cookieDomain : '',
                        sitewide = config.sitewide === true ? ';path=/' : '',
                        _delayTimer = null,
                        _html = document.documentElement;

                    setTimeout(tickTock, 1000);
                    function tickTock() {
                        if (self.tickTock >= self.IT) {
                            _fireAndCallback();
                        } else {
                            self.tickTock += 1;
                            if (window.location.href.indexOf("debugiepu") > -1) {
                                console.log("Tick: " + self.tickTock);
                            }
                            setTimeout(tickTock, 1000);
                        }
                    }

                    function resetTickTock() {
                        if (self.CIOA) {
                            self.tickTock = 0;
                        }
                    }

                    function setDefault(_property, _default) {
                        return typeof _property === 'undefined' ? _default : _property;
                    }

                    function setDefaultCookieExpire(days) {
                        var ms = days * 24 * 60 * 60 * 1000;

                        var date = new Date();
                        date.setTime(date.getTime() + ms);

                        return "; expires=" + date.toUTCString();
                    }

                    setTimeout(attachOuiBounce, timer);
                    function attachOuiBounce() {
                        _html.addEventListener('mouseleave', handleMouseleave);
                        _html.addEventListener('mouseenter', handleMouseenter);
                        _html.addEventListener('mousemove', handleMousemove);
                        _html.addEventListener('keydown', handleKeydown);
                    }

                    function handleMouseleave(e) {
                        if (e.clientY > sensitivity || (checkCookieValue('EIPU', 'true') && !aggressive)) return;

                        _delayTimer = setTimeout(_fireAndCallback, delay);
                    }

                    function handleMousemove(e) {
                        resetTickTock();
                    }

                    function handleMouseenter(e) {
                        if (_delayTimer) {
                            clearTimeout(_delayTimer);
                            _delayTimer = null;
                        }
                    }

                    var disableKeydown = false;
                    function handleKeydown(e) {
                        if (disableKeydown || checkCookieValue('EIPU', 'true') && !aggressive) return;
                        else if (!e.metaKey || e.keyCode !== 76) return;

                        disableKeydown = true;
                        _delayTimer = setTimeout(_fireAndCallback, delay);
                    }

                    function checkCookieValue(cookieName, value) {
                        return parseCookies()[cookieName] === value;
                    }

                    function parseCookies() {
                        var cookies = document.cookie.split('; ');

                        var ret = {};
                        for (var i = cookies.length - 1; i >= 0; i--) {
                            var el = cookies[i].split('=');
                            ret[el[0]] = el[1];
                        }
                        return ret;
                    }

                    function _fireAndCallback() {
                        fire();
                        callback();
                    }

                    function fire() {
                        if (el) el.style.display = 'block';
                        disable();
                    }

                    function disable(options) {
                        var options = options || {};

                        if (typeof options.cookieExpire !== 'undefined') {
                            cookieExpire = setDefaultCookieExpire(options.cookieExpire);
                        }

                        if (options.sitewide === true) {
                            sitewide = ';path=/';
                        }

                        if (typeof options.cookieDomain !== 'undefined') {
                            cookieDomain = ';domain=' + options.cookieDomain;
                        }

                        document.cookie = 'EIPU=true' + cookieExpire + cookieDomain + sitewide;

                        _html.removeEventListener('mouseleave', handleMouseleave);
                        _html.removeEventListener('mouseenter', handleMouseenter);
                        _html.removeEventListener('mousemove', handleMousemove);
                        _html.removeEventListener('keydown', handleKeydown);
                    }

                    return {
                        fire: fire,
                        disable: disable
                    };
                }

                ouibounce(document.getElementById('specialOffer'), { aggressive: true, callback: exitIntentEvent });

                if (typeof this["U"] != "undefined" && this["U"] != null && this["U"] != '') {
                    $('.__EI #exitIntentRedirect').click(function () {
                        console.log('redirecting to ' + this["U"]);
                        window.location = this["U"];
                    });
                }

                $('.__EI  underlay').click(function () {
                    $('.__EI .editIntentModel').hide();
                });

                $('.__EI .editIntentModel .modal-footer').click(function () {
                    $('.__EI .editIntentModel').hide();
                });

                $('.__EI #ouibounce-modal .modal').click(function (e) {
                    e.stopPropagation();
                });

                $('.__EI .closeModal').click(function () {
                    $('.__EI .specialOfferMessage').hide();
                });

                function exitIntentEvent() {
                    $('form').append('<input id="idleexitIntentPopupShown" name="idleexitIntentPopupShown" type="hidden" value="true">');
                }

                return this;
            };

            if (!window.EIPU) {
                window.EIPU = EIPU;
            }
        })();

        $(document).ready(function () {
            var cookieExists = document.cookie.indexOf("emailSubmit=");
            var hasPopUpShown = document.cookie.indexOf("popUpShown=");

            if (cookieExists <= -1 && hasPopUpShown <= -1) {
                document.cookie = "popUpShown=1";
                EIPU({
                    'IT': parseInt('<%=ViewData["IdleThreshold"] ?? SettingsManager.ContextSettings["IdleExitIntent.IdleThreshold"]%>'),
                    'CIOA': <%=bool.Parse(ViewData["ClearIdleOnAction"] as string ?? "True").ToString().ToLower()%>,
                    'C': '<%=ViewData["PopupContent"] ?? string.Empty%>',
                    'I': '<%=ViewData["ImageUrl"] ?? string.Empty%>',
                    'U': '<%=ViewData["RedirectUrl"] ?? string.Empty%>'
                });
            }

        });

        //Subscribe Email Function
        function saveEmailOptInPop(e) {
            var email = jQuery('#emailSubscribePop').val();
            if (email.length > 0) {
                if (isEmpty("emailSubscribePop")) {
                    jQuery('#subscribemessagePop').addClass('error').html("Invalid Email Address");
                    return false;
                }
                else {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    var address = document.getElementById("emailSubscribePop").value;

                    if (reg.test(address) == false) {
                        console.log("fail");
                        jQuery('#subscribemessagePop').addClass('error').html("Invalid Email Address");
                        return false;
                    }
                }
            }

            jQuery('#subscribemessagePop').html("Processing...");
            jQuery.ajax({
                type: 'GET',
                url: '/Cart/Subscribe/<%=DtmContext.PageCode%>?email=' + email,
                dataType: 'json',
                async: false,
                success: function (data) {
                    var success = new RegExp("Success", "g"), error = new RegExp("Invalid", "g");

                    if (data.errorMessage.match(success)) {
                        console.log('success');
                        jQuery('#subscribemessagePop').addClass('success');
                        document.cookie = "emailSubmit=1";
                    }
                    else if (data.errorMessage.match(error)) {
                        console.log('failed');
                        jQuery('#subscribemessagePop').addClass('error');
                    }

                    jQuery('#subscribemessagePop').html(data.errorMessage);
                    jQuery('#emailSubscribePop').val('');
                    setTimeout(function () {
                        jQuery('#subscribemessagePop').slideUp('fast', function () {
                            jQuery(this).removeClass('error success').html('');
                        });

                        //close email pop up after success
                        $('#specialOffer').remove();

                    }, 8000);
                },
                error: function () {
                    jQuery('#subscribemessagePop').addClass('error').html('Unable to process request at this time, please try again.');
                    setTimeout(function () {
                        jQuery('#subscribemessagePop').slideUp('fast', function () {
                            jQuery(this).removeClass('error success').html('');
                        });
                    }, 8000);
                }
            });
            return true;
        }


	</script>

<% string currentUrl = Request["exitpop"];

    if (currentUrl != "0")
    {

        %>

<div class="specialOfferMessage" id="specialOffer" style="display: none;">
    <div class="emailpop__wrapper">
        <div class="emailpop__image">
            <img src="/images/3.0000/email-pop.png" alt="Sign Up Today!">
        </div><!-- end .emailpop__image -->
        <div class="emailpop__text" id="specialOfferContent">
            <h3 class="emailpop__title">
                <small>Be The First To Know About</small>
                New Products &amp; Special Offers
            </h3>
            <div class="emailpop__graphic"></div>
            <input type="email" name="emailSubscribePop" type="email" id="emailSubscribePop" class="animate emailpop__textbox" placeholder="ENTER EMAIL ADDRESS" required />
            <input type="submit" class="animate  emailpop__btn emailpop__btn--yes" value="SIGN ME UP"  onclick="return saveEmailOptInPop(this);"/>
            <button class="animate  emailpop__btn emailpop__btn--no" onclick="$('#specialOffer').remove();">No Thanks</button>
            <div id="subscribemessagePop" class="subscribe-msg">&nbsp;</div>
            <img src="/images/3.0000/email-pop-logo.png" class="emailpop__logo" alt="Flawless from Head to Toe!">
        </div><!-- end .emailpop__text -->
    </div><!-- end .emailpop__wrapper -->
    <div class="close_specialOfferMessage">
        <button type="button" onclick="$('#specialOffer').remove();">X</button>
    </div><!-- end .close_specialOfferMessage -->
</div><!-- end #specialOffer -->

<style>

.screen {
    position: absolute;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin: auto;
    background: rgba(0,0,0,.3);
    z-index: 1000;
}

@media screen and (min-width:0) {
    .specialOfferMessage {
        margin: 30px
    }

    .screen {
        position: absolute
    }
}

/* additions to new subscibe popup */

#specialOffer:before {
    content: "";
    background: rgba(0,0,0,0.7);
    width: 100%;
    height: 100%;
    display: block;
    position: fixed;
    z-index: -1;
    top: 0;
    left: 0;
}

.specialOfferMessage {
    position: fixed;
    left: 0;
    right: 0;
    margin: 0 auto;
    width: 100%;
    max-width: 760px;
    padding: 0;
    background: none;
    border: none;
    top: 2vh;
    z-index: 1000;
    text-align: center;
    box-shadow: none;
    color: #333333;
}

/* close the box */
.close_specialOfferMessage {
    position: absolute;
    right: 0; top: 0;
    padding: 10px;
    text-align: center;
}
.close_specialOfferMessage button {
    font: 18px 'Sofia Pro Semi Bold';
    background: none;
    border: none;
}

/* email pop */
.emailpop__wrapper {
    display: flex;
    align-items: center;
    background: #fff2eb;
}

.emailpop__text {
    text-align: center;
    padding: 30px 20px;
    max-width: 350px;
}

.emailpop__title {
    font: 36px/1 'Sofia Pro Bold';
    text-transform: uppercase;
}
.emailpop__title small {
    display: block;
    font-size: 18px;
    margin: 0 auto 10px;
}
.emailpop__textbox,
.emailpop__btn,
.emailpop__wrapper .subscribe-msg {
    display: block;
    text-align: center;
    margin: 10px auto;
    width: 80%;
    max-width: 80%;
    height: 46px;
    border: 1px solid #333333;
    font: 15px/30px 'Sofia Pro Regular';
    border-radius: 0;
}
.dtm .dtm__in .emailpop__textbox {
    display: block;
    background: white;
    border-radius: 0px;
    padding: 13px 0;
}
.emailpop__btn {
    font-size: 20px;
    text-transform: uppercase;
    padding: 10px 0;
}
.emailpop__btn--yes {
    background: #fed2c2;
}
.emailpop__btn--yes:focus,
.emailpop__btn--yes:hover {
    background: #cf9d8b;
    color: #000;
}
.emailpop__btn--no {
    background: #ffebe1;
    color: #606060;
}
.emailpop__btn--no:focus,
.emailpop__btn--no:hover {
    background: #d6b9ab;
    color: #000;
}
.emailpop__wrapper .subscribe-msg {
    border-color: transparent;
}
.subscribe-msg.success {
    background: #53d966;
    border-color: #222;
    display: block;
}
.subscribe-msg.error {
    background: #d95353;
    border-color: #222;
    display: block;
}
.dtm .dtm__in .emailpop__logo {
    margin: 0 auto;
    display: block;
}

@media screen and (max-width: 760px) {
    .emailpop__title {
        font-size: 4vw;
    }
    .emailpop__title small {
        font-size: 2.5vw;
    }
    .emailpop__image {
        width: 50%;
    }
}
@media screen and (min-width: 550px) {
    .emailpop__graphic {
        display: none;
    }
}
@media screen and (max-width: 550px) {
    .emailpop__wrapper {
        max-height: 90vh;
    }
	.emailpop__title {
        font-size: 7vw;
    }
    .emailpop__title small {
        font-size: 4.2vw;
    }
    .emailpop__text {
        max-width: none;
        width: 100%;
    }
    .emailpop__image {
        display: none;
    }
    #specialOffer {
        width: 90vw;
    }
    .emailpop__textbox,
    .emailpop__btn,
    .emailpop__wrapper .subscribe-msg {
        height: auto;
        padding: 13px 0 10px;
    }
    .emailpop__graphic {
        position: relative;
        left: -20px;
        margin: 20px auto;
        width: calc(100% + 40px);
        background: url(/images/3.0000/email-pop.png) center -70px no-repeat;
        background-size: 110%;
        height: 100px;
    }
}
</style>
<%} %>

<%}%>