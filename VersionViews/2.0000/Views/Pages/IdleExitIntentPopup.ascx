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
        function saveEmailPopOptIn(e) {
            var email = jQuery('#emailSubscribePop').val();
            if (email.length > 0) {
                if (isEmpty("emailSubscribePop")) {
                    jQuery('#subscribemessagePop').addClass('error extend pad').html("Invalid Email Address");
                    return false;
                }
                else {
                    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                    var address = document.getElementById("emailSubscribePop").value;

                    if (reg.test(address) == false) {
                        console.log("fail");
                        jQuery('#subscribemessagePop').addClass('error extend pad').html("Invalid Email Address");
                        return false;
                    }
                }
            }

            jQuery('#subscribemessagePop').addClass('extend pad').html("Processing...");
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
                            jQuery(this).removeClass('error success extend pad').html('');
                        });

                        //close email pop up after success
                        $('#specialOffer').remove();

                    }, 8000);
                },
                error: function () {
                    jQuery('#subscribemessagePop').addClass('error').html('Unable to process request at this time, please try again.');
                    setTimeout(function () {
                        jQuery('#subscribemessagePop').slideUp('fast', function () {
                            jQuery(this).removeClass('error success extend pad').html('');
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
    <img src="/images/email-pop.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Flawless from head to toe - Sign up to learn more">
    <div class="close_specialOfferMessage" style="float: right;">
        <button type="button" onclick="$('#specialOffer').remove();">X<?button>
    </div>
	<div id="specialOfferContent">
		<h5 class="white-text block bottom-padding">SIGN UP TO LEARN ABOUT NEW PRODUCTS AND SPECIAL OFFERS</h5>
        <input type="email" name="emailSubscribePop" type="email" id="emailSubscribePop" class="animate" placeholder="ENTER EMAIL ADDRESS" required />
        <input type="submit" class="animate button" value="SIGN ME UP"  onclick="return saveEmailPopOptIn(this);"/>
	</div>
    <div id="subscribemessagePop" class="subscribe-msg"></div>
</div>

<style>
    @font-face {
        font-family: LeagueGothicRegular;
        src: url(/shared/webfonts/league_gothic/League_Gothic-webfont.eot?#iefix) format('embedded-opentype'),url(/shared/webfonts/league_gothic/League_Gothic-webfont.woff) format('woff'),url(/shared/webfonts/league_gothic/League_Gothic-webfont.ttf) format('truetype'),url(/shared/webfonts/league_gothic/League_Gothic-webfont.svg#LeagueGothicRegular) format('svg')
    }

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

        .specialOfferMessage .headline {
            color: #222;
            font-weight: 400;
            font-size: 36px;
            line-height: 1.25em;
            font-family: LeagueGothicRegular,Arial,sans-serif
        }

        .specialOfferMessage p {
            font-family: "Trebuchet MS",Arial,sans-serif
        }

        .specialOfferMessage input[type=submit].flow_input_btn {
            font-weight: 700;
            color: #fff;
            background: #f30;
            height: 52px;
            font-size: 16px;
            line-height: 16px;
            padding: 5px 20px;
            border: 2px solid #f30;
            box-shadow: inset 0 0 0 2px #fff,inset 0 0 10px rgba(131,9,0,.75);
            border-radius: 40px
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
    max-width: 680px;
    padding: 0;
    background: none;
    border: none;
    top: 2vh;
    z-index: 1000;
    text-align: center;
    box-shadow: none;
}

#specialOfferContent {
    background: rgba(166, 19, 20, 0.45);
    border: 1px solid white;
    box-shadow: 0 5px 7px rgba(0, 0, 0, 0.45);
    position: absolute;
    left: 0;
    right: 0;
    margin: 0 auto;
    top: 150px;
    z-index: 1100;
    padding: 15px;
    width: 90%;
}

#specialOfferContent .button {
    color: black;
}

#emailSubscribePop {
    height: 43px;
    vertical-align: top;
    width: 175px;
}

.close_specialOfferMessage {
    background: none;
    float: none;
    position: absolute;
    right: -10px;
    top: -10px;
}

.close_specialOfferMessage button {
    background: black;
    width: 30px;
    height: 30px;
    border-radius: 16px;
    color: white;
    text-align: center;
    padding: 0;
    font-weight: bold;
    border: 2px solid white;
}

.close_specialOfferMessage button:hover {
    color: pink;
}

#specialOfferContent .button:hover, .l-footer .button:hover {
    background: #ddd;
}

#specialOfferContent h5 {
	font-size: 17px;
}

@media screen and (max-width: 680px) {
	.specialOfferMessage {
		width: 90%;
	}
	#specialOfferContent {
		top: 16vw;
    padding: 6px;
	}
	#specialOfferContent h5 {
		font-size: 4vw;
	}
	#specialOfferContent input[type="email"],
	#specialOfferContent button {
    display: inline-block;
    font-size: 11px;
    height: auto;
	}
	#specialOfferContent button {
    width: 30%;
    font-size: 11px;
	}
}
</style>
<%} %>

<%}%>