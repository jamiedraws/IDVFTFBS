<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
	<%@ Import Namespace="Dtm.Framework.ClientSites" %>
	<% var ProductName = SettingsManager.ContextSettings["Label.ProductName"]; %>
	<%
			var orderType = ViewData["OrderType"] ?? "noOrder";
			var braintreeRadio = "";
			if(orderType.ToString() != "noOrder")
			{
					switch(orderType.ToString())
					{
							case "PayPalEC":
									braintreeRadio = "paypal";
									break;

							case "":
									braintreeRadio = "CC";
									break;
							default:
									braintreeRadio = "";
									break;
					}
			}


			%>

		<% if (DtmContext.Page.IsStartPageType && DtmContext.PageCode != "ShoppingCart") { %>
		<div class="connect u-pad--vert @x3-pad center-text white-background @back-only-hide">
			<h2 class="color-gray uppercase sans-secondary-semibold u-pad--vert fn--expanded insta__title">
				Connect. Follow. Discover.
			</h2>
			<h4 class="black-text sans-secondary-semibold insta__subtitle">@flawlessbeauty</h4>
			<div class="color-gray h4 bottom-padding @x3-pad"><% Html.RenderPartial("Social", Model); %></div>
			<div class="width-at-100" style="overflow: hidden;">
				<a href="https://www.instagram.com/flawlessbeauty/" target="_blank" id="instafeed" class="animated"></a>
			</div>
			<%-- <img class="width-at-100" src="/images/2.0000/social.jpg?appV=<%= DtmContext.ApplicationVersion %>" alt="See all the people that love <%= SettingsManager.ContextSettings["Label.ProductName"] %>"> --%>
		</div>
		<% } %>

		<footer class="l-footer bg-primary tertiary-container o-box--none block u-pad @print-only-hide">

			<nav class="l-footer__in c-brand @mv-u-pad--reset fn--center u-mar--center">

				<div href="Index" class="img block center-margin no-bkg" style="--aspect-ratio:46/242; --aspect-ratio-width: 242px; width: 242px;">
					<img class="center-margin" src="/images/5.0000/logo.png?appV=<%= DtmContext.ApplicationVersion %>" alt="Finishing Touch&reg; Flawless&reg;">
				</div>

				<img src="/images/3.0000/awards-icons-4.png?appV=<%= DtmContext.ApplicationVersion %>" class="footer__awards center-margin">

				<% Html.RenderSnippet("FOOTER-FRONTEND"); %>

			</nav>

		</footer>



		<%-- // @JS-FOOTER --%>
		<% switch ( DtmContext.Page.IsStartPageType ) { %>

			<% case false: %>


				<% break; %>
			<% default: %>

				<% Html.RenderPartial("Scripts"); %>
				<% Html.RenderSnippet("ORDERFORMSCRIPT"); %>

				<% break; %>

		<% } %>

	<script>

			$('#promoCode .c-brand--form__legend').click( function() {
				$('#promo').fadeToggle();
			});

			var searchSubmitted = false;

			<% Html.RenderPartial("JS.Module.ProgressiveContent", Model); %>
			getProgressiveContent(setItemByPlaceholder);
			getProgressiveContent(function (loadItem) {
							setItemByPlaceholder(loadItem, { tag : 'iframe', src : 'data-src-iframe', onloadname : 'onload' });
						}, '[data-src-iframe]');

			(function () {

				// part of inter
				var $body = $('body');
				var $inertial = $('.set-inertial');
				var $main = $('main');
				var $nav = $('.nav');
				var $quotes = $('.quote--list');
				var eflex__fade__banner = {};

				function getProduct (item, code, prop, sum, filterByProp) {
					var $defer = new $.Deferred();
					$.post('/GetCategory', { item : item, code : code, prop : prop, sum : sum, filterByProp : filterByProp }, function (response) {
						try {
							$defer.resolve(JSON.parse(response));
						} catch (e) {
							$defer.reject({
								clientError : e.message,
								serverError : response
							});
						}
					});

					return $defer.promise();
				}

				function getModalTemplate () {
					var $defer = new $.Deferred();
					var $modal = $('.is-modal');
					var modalExists = false;

					// check if modal layout doesn't exist in the DOM
					if ( $modal.length === 0 ) {
						// create a new modal layout and append to the main section of the page
						var $modal = $('<section/>', {
							class : 'is-modal'
						}).appendTo($main);
					} else {
						modalExists = true;
					}

					eflex__fade__banner.play = false;
					$defer.resolve($modal, modalExists);

					return $defer.promise();
				}

				function buildModalPage (data, $modal, modalExists) {
					var $defer = new $.Deferred();
					var product = data.current;
					var actions = product.actions.length > 0 ? product.actions[0].newProduct : '';
					var title = product.title;
					var image = product.image.split('/').pop();
					var callToAction = product.callToAction;

					if ( modalExists ) {
						var $logo = $modal.find('.page__logo'),
							$headline = $modal.find('.page__headline'),
							$media = $modal.find('.page__media'),
							$copy = $modal.find('.page__copy'),
							$callToAction = $modal.find('.page__calltoaction');

						var updateTemplate = function () {
							$headline.find('[data-page-headline]').html(product.title);

							if ( image === '' ) {
								$logo.addClass('hide');
							} else {
								$logo
									.removeClass('hide')
									.find('[data-page-logo]')
									.attr('src', '/images/pages/' + image);
							}

							$copy.html(product.desc);

							if ( actions === '' ) {
								$media.addClass('hide');
							} else {
								$media
									.removeClass('hide')
									.html(actions.desc);
							}

							$callToAction.html(product.callToAction);

							$logo.removeClass('will-slide-to-left');
							$headline.removeClass('will-slide-to-right');
							$media.removeClass('will-slide-to-left');
							$copy.removeClass('will-slide-to-right');
							$callToAction.removeClass('will-slide-to-left');

							$modal.addClass('modal--is-open');

							$defer.resolve($modal);
						};

						if ( $modal.hasClass('modal--is-closed') ) {
							$modal.addClass('modal--stop-animation');
						}

						$logo.addClass('will-slide-to-left');
						$headline.addClass('will-slide-to-right');
						$media.addClass('will-slide-to-left');
						$copy.addClass('will-slide-to-right');
						$callToAction.addClass('will-slide-to-left');

						$('.page__copy').one('animationend', updateTemplate);
					} else {
						$.post('/GetPage', {
							title : title,
							image : image,
							actions : 'template'
						}, function (template) {
							var $template = $(template);

							$template.addClass('modal__in');

							if ( image === '' ) {
								$template.find('.page__logo').addClass('hide');
							} else {
								$template.find('.page__logo').removeClass('hide');
							}

							$template.find('.page__copy').html(product.desc);

							if ( actions === '' ) {
								$template.find('.page__media').addClass('hide');
							} else {
								$template.find('.page__media').html(actions.desc);
							}

							$template.find('.page__calltoaction').html(product.callToAction);

							$template.appendTo($modal);
							$modal.addClass('set-modal modal--is-open');

							$defer.resolve($template);
						});
					}

					return $defer.promise();
				}

				function getVimeo (id, title) {
					var $defer = new $.Deferred();
					var $li = $('<li/>', {
						class : 'category__item center-text'
					});
					var $vimeo = $('<iframe/>', {
						src : 'https://player.vimeo.com/video/' + id + '?title=0&byline=0&portrait=0',
						class : 'has-dtm-vimeo set-slide-from-right',
						width : '300',
						height : '169'
					});

					var $title__container = $('<div/>', {
						class : '@md-fn--xl'
					});

					var $title = $('<span/>', {
						class : 'category__title h4 sans-primary-book',
						text : title
					});

					$vimeo.appendTo($li);
					$title.appendTo($title__container);
					$title__container.appendTo($li);
					$li.appendTo($('.list--category'));

					_dtm.makeVimeoResponsive({
						onAfter : function (self) {
							self.scale.addClass('will-slide-from-right');
						}
					});

					$defer.resolve();
					return $defer.promise();
				}

				function getContentByCategory ($template) {
					var $hasCategories = $template.find('[data-category]');
					if ( $hasCategories.length > 0 ) {
						var category = $hasCategories.data('category');
						var categoryProperty = $hasCategories.data('category-property');

						var fetchProduct = function () {
							var $ul = $('<ul/>', {
								class : 'list--category'
							}).appendTo($('.page__copy'));

							$('.page__content').addClass('u-vw--100');

							getProduct(null, category, null, true).done(function (sum) {
								var x = 0, y = sum;

								var getNextProduct = function (x) {
									getProduct(x, category, categoryProperty).done(function (data) {
										if ( data.Properties !== null ) {
											console.log(data);
											getVimeo(data.Properties, data.ProductName).done(function () {
												x = x + 1;
												if ( x < y ) {
													getNextProduct(x);
												}
											});
										}
									});
								};

								getNextProduct(x);
							});
						};

						fetchProduct();
					}
				}

				function addModalFeatures ($template) {
					var $defer = new $.Deferred();

					getContentByCategory($template);
					$template.find('iframe[src*="player.vimeo.com"]')
						.attr('data-eflex-aspect-ratio', 'true')
						.addClass('has-dtm-vimeo');
					_dtm.makeVimeoResponsive();

					$defer.resolve();
					return $defer.promise();
				}

				var newImage = '';
				$('.replace-image').click(function() {
					newImage = $(this).find('img').attr('src');
					$('#gallery__main').attr('src', newImage);
				});

				$('[data-page]').on('click', function (e) {
					var page = $(this).attr('data-page');
					if ( page !== '' ) e.preventDefault();
					$.getJSON('/' + page + '<%= DtmContext.ApplicationExtension %>?RemoteType=' + page, function (data) {
						getModalTemplate(data)
							.done(function ($modal, modalExists) {
								buildModalPage(data, $modal, modalExists).done(function ($template) {
									addModalFeatures($template).done(function () {
										$modal.one('modal/animation', function () {
											var retry = function () {
												if ( parseInt($modal.css('top')) === 0 ) {
													$modal.eflex({
														type : 'scroll',
														trigger : true
													});
												} else {
													$modal.css('top', 0);
													setTimeout(retry, 100);
												}
											}
											retry();
											// load the before after slider
											$("#ba-fader").twentytwenty();
										});
									});
								});
							});
					});
				});

				$body.on('click', '[data-modal-close]', function (e) {
					if ( DtmContext.PageCode == 'Index' ) {
						e.preventDefault();

						$('.modal--is-open')
							.removeClass('modal--is-open')
							.addClass('modal--is-closed')
							.css({
								top : $('.l-header').outerHeight(true)
							});

						$body.removeClass('modal-animation-end');

						$(window).trigger('resize');

						eflex__fade__banner.play = true;
						setTimeout(function () {
							$('.modal--is-closed').css('top', 0);
						}, 500);
					}
				});

				// event role: when CSS animation ends, change modal
				$body.on('animationend', '.modal--is-open', function () {
					$body.addClass('modal-animation-end');
					$(this)
						.removeClass('modal--is-closed modal--stop-animation')
						.trigger('modal/animation');
				});

				$('.fade--banner .js-eflex--fade').on('eflex/slider/onInit', function (eflex) {
					eflex__fade__banner = eflex.self;
				});

				function addDropdownListener () {
					var $nav__item = $nav.find('.nav__item'),
						$nav__down = $nav.find('.nav__down'),
						$nav__link = $nav__down.find('.nav__link');

					$nav__item.on('touchstart', function () {
						$nav__item.removeClass('is-selected');
						$(this).addClass('is-selected');
					});

					$nav__link.on('touchstart', function (e) {
						e.stopImmediatePropagation();
						$nav__item.removeClass('is-selected');
						$nav__down.addClass('nav--is-closed');

						$body.one('touchstart', function () {
							$nav__down.removeClass('nav--is-closed');
						});
					});
				}

							$(window).load(function () {

									//Adding braintreeKeepState
									var braintreeVal = "<%=braintreeRadio%>";

									if (braintreeVal != "") {
											if (braintreeVal == "paypal") {
													$('#otPayPalEC').click();
											} else {
													$('#otCARD').click();

											}
									}

					// Responsive lists
					$nav.eflex({
						type: 'list',
						compareTo : 768,
						switchByMediaQuery : true,
						onAfter : function ( self, result ) {
							if ( result ) {
								self.list.removeClass('is-scrollable');
							} else {
								self.list.addClass('is-scrollable');
							}
						}
					});

					addDropdownListener();
				});

				$quotes.on('ready/quotes:data', function (quotes) {
					var getSlides = function () {
						console.log($quotes.find('li').length);
						//if ( $quotes.find('li').length === quotes.len ) {
							$quotes.find('.quote--is-template').remove();
							// reconstruct 3 quotes into 1 slide
							var q = 0;
							var newQuotes = '';
							var threeQuotes = '';
							$quotes.find('li').each(function(index) {
								threeQuotes = threeQuotes + '<div class="quote__wrap">' + $(this).html() + '</div>';
								q++;
								if (q >= 1) {
									q = 0;
									newQuotes = newQuotes + '<li class="quote__item">' + threeQuotes + '</li>';
									threeQuotes = '';
								}
							});
							$quotes.html(newQuotes);
							$quotes.trigger('ready/quotes:dom');
							return false;
						//} else {
							//setTimeout(getSlides, 50);
						//}
					};

					getSlides();
				});

				$quotes.on('ready/quotes:dom', function () {
					$quotes.eflex({
						type : 'slider',
						sliderType : 'fade',
						animationType : 'CSS3',
						duration : 500,
						easing : 'swing',
						delay : 5000,
						paginate : false,
						nav : true,
						swipe : true,
						await : 'mouseenter scroll',
						onInit : function (self) {
							$('.quote--title').addClass('will-slide-from-left');
							self.slider.addClass('will-slide-from-right');
						}
					});
				});

				$('html').on('dtm/vimeo', function () {
					_dtm.makeVimeoResponsive();
				});



							$(document).ready(function () {



								$( "[name=singleDropdown_GDQ_FLAWLESS]" ).change(function() {
									console.log($(this).val());
									if ($(this).val() == 'SEA') {
										document.getElementById('gallery__main').src="/images/products/3.0000/flawless--teal.png";
									} else if ($(this).val() == 'WHITE') {
										document.getElementById('gallery__main').src="/images/products/3.0000/flawless--white.png";
									} else if ($(this).val() == 'BLUSH') {
										document.getElementById('gallery__main').src="/images/products/3.0000/flawless--pink.png";
									} else if ($(this).val() == 'LAVEN') {
										document.getElementById('gallery__main').src="/images/products/3.0000/flawless--lavender.png";
									}
									});

									$('#searchSubmit').on('click', function () {
											var searchQuery = $('#textS').val();

											if (searchQuery.length > 1 && !searchSubmitted) {
													/* send searchQuery text to googleAnalytics*/
													if ("ga" in window) {
															tracker = ga.getAll()[0];
															if (tracker) {
																	tracker.send("event", "Search", "Search", searchQuery);
																	searchSubmitted = true;
															}
													}
											}
									});

							});

							/////////////////////

							$(window).ready(function () {
					var x = 0, y = 0;

					function buildQuote (product) {
						var $quote = $('.quote--is-template').clone();
						var stars = 5 - product.MaxQuantity;

						if ( stars !== 0 ) {
							for ( var i = 0; i < stars; i++ ) {
								$quote.find('.list__star').eq(i).addClass('hide');
							}
						}

						$quote.find('[data-quote-title]').text(product.ProductName);
						$quote.find('[data-quote-copy]').text(product.DisplayText);
						$quote.removeClass('quote--is-template');
						$quote.insertBefore('.quote--is-template');

						// set values equal
						y = x;
						// set value to next post
						x = x + 1;
					}

					getProduct(null, 'QUOTES-VIDEOS', 'PageCode', true, DtmContext.PageCode).done(function (len) {
						for ( var i = 0; i < len; i++ ) {
							(function (i) {
								getProduct(i, 'QUOTES-VIDEOS', 'PageCode', null, DtmContext.PageCode).done(function (data) {
									buildQuote(data);
									if ( i === len - 1 ) {
										$quotes.trigger({ type : 'ready/quotes:data', len : len });
									}
								});
							})(i);
						}
					});

					getContentByCategory($('.l-outer__page'));

					$('body').on('modal/ready', '.set-modal', function (e) {
						console.log('modal is ready', $(this));
					});

					$('html').on('dtm/fwjs', function () {
						// _dtm.animateToTargetOnScroll({
						// 	anchor : $('.list--is-scrollable'),
						// 	target : $('.quote--is-template'),
						// 	distance : 0.25,
						// 	callbackInRange : function (self) {
						// 		// check if ready for new post
						// 		if ( x > y ) {
						// 			// fetch new post
						// 			getProduct(x, 'QUOTES').done(buildQuote);
						// 			y = x;
						// 		}
						// 	}
						// });
					});
				});
					})();

					//Subscribe Email Function
					function saveEmailOptIn(e) {
							var email = jQuery('#emailSubscribe').val();
							if (email.length > 0) {
									if (isEmpty("emailSubscribe")) {
											jQuery('#subscribemessage').addClass('error extend pad').html("Invalid Email Address");
											return false;
									}
									else {
											var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
											var address = document.getElementById("emailSubscribe").value;

											if (reg.test(address) == false) {
													console.log("fail");
													jQuery('#subscribemessage').addClass('error extend pad').html("Invalid Email Address");
													return false;
											}
									}
							}

							jQuery('#subscribemessage').addClass('extend pad').html("Processing...");
							jQuery.ajax({
									type: 'GET',
									url: '/Cart/Subscribe/<%=DtmContext.PageCode%>?email=' + email,
							dataType: 'json',
							async: false,
							success: function (data) {
									var success = new RegExp("Success", "g"), error = new RegExp("Invalid", "g");

									if (data.errorMessage.match(success)) {
											console.log('success');
											jQuery('#subscribemessage').addClass('success');
									}
									else if (data.errorMessage.match(error)) {
											console.log('failed');
											jQuery('#subscribemessage').addClass('error');
									}

									jQuery('#subscribemessage').html(data.errorMessage);
									jQuery('#emailSubscribe').val('');
									setTimeout(function () {
											jQuery('#subscribemessage').slideUp('fast', function () {
													jQuery(this).removeClass('error success extend pad').html('');
											});
									}, 8000);
							},
							error: function () {
									jQuery('#subscribemessage').addClass('error').html('Unable to process request at this time, please try again.');
									setTimeout(function () {
											jQuery('#subscribemessage').slideUp('fast', function () {
													jQuery(this).removeClass('error success extend pad').html('');
											});
									}, 8000);
							}
					});
					return true;
			}


		</script>

			<%if(DtmContext.Page.IsStartPageType){ %>
		<script src="/shared/js/instafeed.js"></script>
		<script>

			 <% if (DtmContext.PageCode == "ShoppingCart")
					{ %>
				$('html').on('dtm/fwjs', function () {
					_dtm.expressCheckout({ addPayPalButton: false});
				});
			<% }
					else
					{%>

							// Instagram

							var instafeedError = "";

							var feed = new Instafeed({
									accessToken: 'IGQVJVbm1wVy1RUG1qMDBXWXQ0N1U5WFRUcWVLOTJodmVYeU1vZAWV4UGdnNHBtWXFvaUJ6SWsxNXhOcmItZA2FHd0wxUnRCOWpvUzVrRkhNUm5LSFFxOUlsSWxGeC1qWFRVcmhsaWh3',
									template: '<img src="{{image}}" />',
									limit: 10,
									error: function(err) { instafeedError = err; }
							});

							var backupFeedImages = [
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/93594852_235184504259947_3570500100746939376_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=111&_nc_ohc=tVGLnN9U9hcAX9YmAqJ&oh=c1b5097ac915e7fe6408bde9c62513a9&oe=5EC8FAD4',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/93714514_2704416053002042_3073702858523790288_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=110&_nc_ohc=qR5emrnEkAcAX9IcBzP&oh=55b083eedc713a319f6f679980025b44&oe=5EC8ACC7',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/e15/s640x640/93578972_709208983157476_9208323971807810262_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=104&_nc_ohc=E3kvv38xkucAX_8ljx7&oh=4a72f819daf25f9cb35abe7c8d543d05&oe=5EC6109F',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/p640x640/93809591_716201722452002_7773532255564251030_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=102&_nc_ohc=ksb-zcO4oU4AX95yCN_&oh=407bd46868d1dc4e5c6c2281c23497c3&oe=5EC7233A',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s750x750/93576724_106195664290652_7050457858876020328_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=108&_nc_ohc=2R4IU8T2_6YAX-snVd_&oh=c0c98fa1d1ebf8387174f6a97c1a2922&oe=5EC58F2C',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/93302084_972223216506313_132730860588779351_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=101&_nc_ohc=4a7WG3Wm700AX-4Ll2I&oh=263a5b8e4902693504f39087b5c30394&oe=5EC736B9',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/93816862_1214113422130779_7421790904857829326_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=103&_nc_ohc=yHAJNaX8St4AX9H1GdK&oh=8acadca772bfd329f6d965ff5fd0f0a9&oe=5EC90207',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s750x750/93255650_129667111979155_1870121541173405586_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=107&_nc_ohc=Aw4W5S5TwXsAX_YZm-A&oh=3cb22bcec940a304b029c82dd08c0cb7&oe=5EC6443A',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/p640x640/94010042_875470122921414_5268336113049040808_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=106&_nc_ohc=YqF7Qy-w_BkAX-UTdsx&oh=0dda831c8f97aa8dc42ee46ef5811e8c&oe=5EC54D3C',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/93636646_183013076007730_440148459453567913_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=110&_nc_ohc=StpDtPjbg3IAX_8Amat&oh=162ac0a0424b8b2d985a0f7f5b5c8a14&oe=5EC60BBF',
								'https://scontent-ort2-2.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/92962924_282791542727350_2985091450500285199_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com&_nc_cat=110&_nc_ohc=TQRIW2-JMyQAX8P_aF_&oh=ad88151edb2b171e1970c9ca6ec0fa4c&oe=5EC8A5E8'
							];

							var backupFeed = '';

							function createBackupInstafeed () {
								if (instafeedError == "") {
									console.log('instagram feed running');
								} else {
									console.log('instagram feed not loaded..');
									backupFeedImages.forEach(function(source) {
										backupFeed = backupFeed + '<img src="'+source+'">';
									});
									document.getElementById('instafeed').innerHTML = backupFeed;
									console.log('loaded backup feed..');
								}

							}

							// load instagram
							feed.run();

		 // end Instagram
					<%}%>
		</script>
		<script src="/js/picture-polyfill.js"></script>
		<script>
			// IE polyfill check
			var isIE = '-ms-scroll-limit' in document.documentElement.style && '-ms-ime-align' in document.documentElement.style;
			console.log('is IE11');
		</script>
	<%} %>



		<%= Model.FrameworkVersion %>

		<div class="l-controls">
			<% Html.RenderSiteControls(SiteControlLocation.ContentTop); %>
			<% Html.RenderSiteControls(SiteControlLocation.ContentBottom); %>
			<% Html.RenderSiteControls(SiteControlLocation.PageBottom); %>
		</div>

		<script>
			$(window).load(function(){
				setTimeout(createBackupInstafeed(), 3000);
			});
		</script>
