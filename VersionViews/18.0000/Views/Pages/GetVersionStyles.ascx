<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%-- Html.RenderSnippet("STYLE-BLOCK-HEAD"); --%>

<% Html.RenderPartial("CSS.Module.ARP", Model); %>

<style id="CSS.Helpers">

.no-bkg,
.no-bkg::after {
	background: none;
}

/* Screen reader only */
.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0,0,0,0);
	border: 0;
}

[hidden] {
	display: none;
}

.hidden {
	visibility: hidden;
}

</style>

<style id="CSS.Base">
/* Cascading Stylesheet | Campaign Version

@Layout

* --------------------------------------------------------------------- */
/* Canvas | @Layout */
/* set the min-width of the page */
.dtm__in .l-outer,
.dtm__in .l-header,
.dtm__in .l-footer {
	max-width: 100%;
}

/* set the max-width of the page */
.dtm__in .l-header__in,
.dtm__in .l-outer__in,
.dtm__in .l-footer__in {
	max-width: 1200px;
	width: 100%;
	margin: auto;
}

.dtm .dtm__in .l-header {
	position: relative;
	z-index: 10;
}

.header--first {
    position: relative;
    z-index: 10;
}

/* set the minimum height of our footer */
.dtm__in--dv .l-footer {
	min-height: 80px;
	height: auto !important; /* putting this here for js overule */
}

/* set the padding of the canvas */
.dtm__in--dv .l-outer__in {
	padding: 0.25em;
}

/* set the border style of our header & midline sections */
.dtm__in--dv .l-header,
.dtm__in--dv .o-box--banner {
	border-style: solid;
}

/* set the border width of our header section */
.dtm__in .l-header,
.dtm__in .l-footer {
	border-width: 0;
}

/* set the border width of our midline section */
.dtm__in--dv .o-box--banner {
	border-width: 3px 0;
}
</style>

<style id="CSS.OldStyles">
.page__copy p {
	margin-bottom: 3rem;
	line-height: 1.75;
}

.page__copy,
.page__media.hide + .page__copy {
	padding: 0 2rem;
}

.page__media:not(.hide) + .page__copy {
	padding: 1.5rem 3rem;
}

iframe + div > span {
	font-style: italic;
}

		@media all and (min-width: 769px) {
				.page__headline {
						padding-left: 2rem;
				}

				.dtm .l-outer__page .page__product {
						display: none;
				}
		}

		@media all and (min-width: 769px) and (max-width: 992px) {
				.page__media iframe[src*="player.vimeo.com"] {
						max-width: 70vw;
				}
				.dtm .page__media .video-no-max {
					max-width: none;
				}
		}
</style>
<style id="CSS.OldStyes">
@media all and (min-width: 993px) {
	/*#main-menu > ul > li {
		padding: 31px 0 20px;
	}
	.page__media iframe[src*="player.vimeo.com"] {
			max-width: 304px;
			max-height: 171px;
	}
	.dtm .page__media .video-no-max {
		max-width: none;
		max-height: none;
		max-width: 465px;
		margin-left: auto;
		margin-right: auto;
		display: block;
	}*/
	/* make sure quote-container has min-height */
	.quote-container {
		min-height: 200px;
	}

	.dtm .dtm__in .quote__item blockquote {
		display: block;
		margin: 0 auto;
	}
}
</style>

<style id="CSS.Quotes">
.dtm .dtm__in .quote__item {
	background: #f5f5f5;
}

.dtm .dtm__in .quote--list .quote__wrap {
	max-width: 838px;
	padding: 1%;
	min-height: 250px;
	display: inline-block;
	vertical-align: top;
}
</style>

<style id="CSS.MediaQueries">
@media all and (max-width: 768px) {
	.logo__link {
		max-width: 50%;
	}

	.dtm .story__img {
		display: none;
	}
	.dtm .story__text {
		width: 100%;
		text-align: center;
		padding: 30px 10px;
	}

	.dtm [class*="social-link"] {
		font-size: 1.25rem;
	}

	.connect a [class*=icon] {
		font-size: 1.5em;
	}

	.page__headline {
		text-align: center;
	}

	.page__copy {
		padding: 1rem 0;
	}

	.l-outer__page .page__button {
		display: block;
	}
	.dtm__in--mv .c-brand--table tbody td:first-of-type {
		background: #3d3d3d;
	}
	.how-to--item > .col {
		display: block;
		width: 100%;
	}
	.l-header input[type=search] {
		width: 100%;
		margin: 10px auto;
	}
	.dtm .dtm__in .mobile-hide {
		display: none;
	}
	.dtm .dtm__in .mobile-no-padding,
	.dtm .header__tagline * {
		padding: 0px;
	}
	.dtm .dtm__in .mobile-center {
		text-align: center;
		width: 100%;
	}
}
</style>

<style>
	.l-outer__page {
			min-height: 75vh;
	}

	.l-outer__page img {
			margin: auto;
			display: block;
	}

	.list--category {
			display: block;
			width: 100%;
	}

	.category__item {
			display: block;
			vertical-align: top;
			padding: 1rem;
			margin: 5px auto 2rem;
			width: 49%;
	}

	.category__title {
			display: block;
			margin-top: 1rem;
	}

	@media all and ( max-width: 760px ) {
			.category__item {
					width: 100%;
			}
	}

	@media screen and (max-width: 1500px) {
		.dtm .story__img {
			background-position: -290px -18px;
		}
	}



/* --------------------------------------------------------------------- *

		@Model

* --------------------------------------------------------------------- */
		/*	Containers
		* --------------------------------------------------------------------- */
		.dtm .primary-container,
		.dtm .secondary-container,
		.dtm .quote-container,
		.dtm .tertiary-container {
				display: block;
				box-shadow: none;
				border-radius: 0;
				border: none;
		}

		.primary-container {
				background: #f5b5ac;
		}

		.secondary-container {
				background: black;
				color: white;
		}

		.tertiary-container {
				background: white;
		}
		.is-modal > .tertiary-container {
				background: white;
				background-size: contain;
		}


		[class*="social-link"] {
				text-decoration: none;
				display: block;
				padding: 0.05em 0.3em;
				border-radius: 0.25em;
				font-size: 2rem;
		}

				.social-link--fb {
						background: #3c5a98;
						color: white;
				}

				.social-link--ig {
						background: #1400c8;
						background: -moz-linear-gradient(-45deg, #1400c8 0%, #b900b4 52%, #f50000 100%);
						background: -webkit-linear-gradient(-45deg, #1400c8 0%, #b900b4 52%, #f50000 100%);
						background: linear-gradient(-135deg, #1400c8, #b900b4, #f50000);
						color: white;
				}

				.social-link--yt {
						background: #ff0000;
						color: white;
				}

				.l-footer .icon--social {
						font-size: 4rem;
				}


		/*	Lists
		* --------------------------------------------------------------------- */
		.nav__link--sub {
			padding: 0;
		}
		.nav__link {
			display: block;
			text-decoration: none;
			padding: 27px 0;
			transition: all 250ms ease-in-out;
			color: #333333;
			text-transform: uppercase;
			font-family: inherit;
			font-size: 0.8em;
		}

		li:not(.nav__link--sub) .nav__link:hover {
			color: black;
				transition: 0.3s;
		}

		/* fixes for IE11 */
		@media screen {
			@media (min-width: 0px) {
				.nav__link {
					border-bottom: 1px solid white;
				}
				li:not(.nav__link--sub) .nav__link:hover {
					border-color: #e197a3;
				}
			}
		}

		.nav__link--sub {
			position: relative;
		}

		.dtm .dtm__in .nav__link--sub:hover .nav__sub {
			display: block;
			transition: 0.1s;
		}

		.nav__sub {
			position: absolute;
			top: 0;
			margin: 70px auto 0;
			background: #dcdbdb;
			padding: 0.5vw;
			box-shadow: 0 0 10px 3px rgba(0,0,0,0.3);
			border-radius: 0px;
			padding-bottom: 0;
			text-align: left;
			z-index: -1;
			min-width: 360px;
			border-left: 1px solid white;
			border-right: 1px solid white;
		}

		.nav__sub::before {
			content: "";
		}

		.dtm .nav__sub li {
			padding: 0;
		}

		.nav__sub .nav__link {
			padding: 0.85em 0.35em 0.70em;
		}

		.nav__link--sub+.nav__link--sub .nav__sub {
			width: 300%;
			left: -100%;
		}

		.dtm .dtm__in .l-header__nav {
				position: relative;
				z-index: auto;
		}

		.nav.is-scrollable .nav__item:hover .nav__down.nav--is-closed {
				max-height: 0;
		}

		.nav__item:hover .nav__down,
		.nav__item.is-selected .nav__down {
				/* max-height: 10rem; */
				max-height: 30rem;
		}

		.nav__down ul {
				text-align: center;
				list-style: none;
				font-size: 1.5rem;
		}

		.nav__down li {
				display: block;
		}

		.quote-container {
			position: relative;
			/*background: url(/images/pages/quote-bkg.jpg) center top no-repeat;*/
			background-size: 100%;
			height: auto;
		}

		/*.dtm .quote-container .quote-icon {
				color: #f5b5ac;
				position: absolute;
				font-size: 11em;
				left: 0;
				top: -40px;
				font-family: Georgia;
		}*/

		.quote--list {
				line-height: 1.45;
				/*max-height: 35rem;*/
				height: auto;
		}

				.quote__stars {
						width: 100%;
				}

				.quote__stars .list--stars {
						width: 100%;
				}

				.quote--list .list--stars {
						color: #f22449;
				}

				.quote--list .list--stars,
				.quote--list .list__star {
						display: inline-block;
						font-size: 1.3em;
  					margin: 0.5em 0; padding: 0;
				}

				/*.quote__item:not(:first-child) {
						padding-top: 1.5rem;
				}

				.quote__item:not(:last-child) {
						padding-bottom: 1.5rem;
				}*/

				@media all and ( max-width: 500px ) {
						.quote__item > .col {
								display: block;
								width: 100%;
						}
				}

		.page--list {
				margin-left: 2rem;
				padding: 2rem 0;
		}

				.page--list > li {
						padding-bottom: 1rem;
						line-height: 1.45;
				}


		/*	Buttons
		* --------------------------------------------------------------------- */
		.dtm .order-button {
				font: 1em/1 'Sofia Pro Bold', sans-serif;
				border-radius: 0;
				padding: 0.5rem 5rem;
				border: none;
				box-shadow: 0 2px 3px rgba(0, 0, 0, 0.75);
				text-shadow: 0 1px 2px rgba(0,0,0,0.45);
				width: 100%;
				background: #ffc7be;
				background: -moz-linear-gradient(top, #ffc7be 0%, #ffc7be 49%, #f79d8f 50%, #ffc7be 100%);
				background: -webkit-linear-gradient(top, #ffc7be 0%,#ffc7be 49%,#f79d8f 50%,#ffc7be 100%);
				background: linear-gradient(to bottom, #ffc7be 0%,#ffc7be 49%,#f79d8f 50%,#ffc7be 100%);
		}

		.dtm .order-button.uppercase {
			font: 1.3em/1 'Sofia Pro Bold', sans-serif;
		}

		.dtm .order-button img {
			display: inline-block;
			vertical-align: middle;
		}

				.order-button small {
						display: block;
						font-size: 0.6em;
				}

		.dtm a.btn--product {
			background: #f83f5b;
			color: white;
			text-transform: uppercase;
			text-decoration: none;
			padding: 10px 8px 6px;
			display: block;
			margin: 0;
			max-width: none;
			border: 2px solid white;
			font-size: 13px;
			font-family: 'Sofia Pro Medium';
			border-radius: 0px;
		}
		.dtm a.btn--product:hover {
			background: #9e0624;
			transition: 0.3s;
		}
		.dtm a.btn--product:focus {
			border: 2px solid black;
		}

		.dtm .dtm__in a.btn--learn {
			background: #838383;
		}
		.dtm .dtm__in a.btn--learn:hover {
			background: #444;
		}

		/*	jQuery Eflex Fade
		* --------------------------------------------------------------------- */
/*		.fade--banner .js-eflex--fade {
				max-width: 875px;
				max-height: 622px;
				margin: auto;
		}*/

		.dtm .btn--shop {
			padding: 1.5rem 2.5rem 1rem;
			position: absolute;
			left: 0; top: 0;
			z-index: 100;
			background: #000;
			border-color: black;
			color: #fff;
			border-radius: 0px;
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
		}
		.dtm .btn--shop:hover,
		.dtm .btn--shop:focus {
			background: #e40079;
			color: white;
		}

		.dtm .btn--shop.btn--shop--pink {
				background: #fed2c2;
				color: #443b38;
			}

				.fade--banner .js-eflex--fade li {
						padding: 0;
				}

		.fade--banner .paginav {
				z-index: 100;
		}

		.fade--banner .js-eflex--fade__nav {
				height: 10rem;
				pointer-events: none;
				z-index: 100;
		}

		.fade--banner .js-eflex__nav {
				background: transparent;
				border: none;
				margin: 0;
				padding: 0;
				font-size: 7rem;
				pointer-events: all;
		}

		.fade--banner .paginav {
				text-align: center;
		}

		.fade--banner .paginav__dot {
				display: inline-block;
				background: transparent;
				border: 1px solid white;
				border-radius: 100%;
				width: 10px;
				height: 10px;
				margin: 0.5rem;
				cursor: pointer;
		}

				.fade--banner .paginav__dot:hover,
				.fade--banner .paginav__dot.is-selected {
						background: white;
				}

		.header__logo__a {
			display: block;
			margin-top: -0.75rem;
		}


		@media all and (max-width: 768px) {
				.l-header__logo .col {
						text-align: center;
				}

				.l-header__logo img {
						margin: auto;
						display: block;
				}
				#subscribeform {
					margin: 10px auto;
				}
				.option__wrap {
					margin: 20px 5px;
				}
		}


		@media all and (max-width: 500px) {
				.l-header__logo .logo__headline {
						font-size: 5vw;
				}
		}


/* --------------------------------------------------------------------- *

		@State

* --------------------------------------------------------------------- */
		/*	Inertial Momentum Scrolling | @Animation
		* --------------------------------------------------------------------- */
				@supports ( display: block ) {
						.set-inertial,
						.list--is-scrollable {
								overflow-y: scroll;
								-webkit-overflow-scrolling: touch;
								-ms-overflow-style: -ms-autohiding-scrollbar;
						}

						.set-inertial {
								position: absolute;
								top: 0;
								left: 0;
								width: 100%;
								width: 100vw;
								height: 100%;
								height: 100vh;
						}

						.nav.is-scrollable {
								display: block;
								white-space: nowrap;
								overflow-x: auto;
								/*-webkit-overflow-scrolling: touch;*/
								-ms-overflow-style: -ms-autohiding-scrollbar;
								text-align: center;
						}

						.nav.is-scrollable .nav__item {
								display: inline-block;
						}

						.nav.is-scrollable .nav__down {
								white-space: normal;
								text-align: left;
						}

						.nav.is-scrollable .nav__item:hover .nav__down,
						.nav.is-scrollable .nav__item.is-selected .nav__down {
								max-height: 50vh;
						}
				}

		 .gold-border { border: 8px solid #ddaa9d; }
		 /*.video-border { border: 2px solid #9a928f; }*/


		/*	Quote
		* --------------------------------------------------------------------- */
		.dtm .dtm__in .quote--is-template {
				display: none;
		}


		/*	Post | @Animation
		* --------------------------------------------------------------------- */

		/* .quote__item was here */
		.will-slide-from-left,
		.will-slide-from-right,
		.set-slide-from-right,
		.set-slide-from-left {
				opacity: 0;
		}

		.set-slide-from-right {
				transform: translateX(7%);
		}

		.set-slide-from-left {
				transform: translateX(-7%);
		}

		.will-slide-from-right {
				transform: translateX(7%);
				animation: pullPostFromRight 500ms ease-out forwards;
		}

		/* .quote__item was here */
		.will-slide-from-left {
				transform: translateX(-7%);
		animation: pullPostFromLeft 500ms ease-out forwards;
		}

		.will-slide-to-left,
		.will-slide-to-right {
				opacity: 1;
				transform: translateX(0);
		}

		.dtm .will-slide-to-left {
				animation: pushPostToLeft 500ms ease-out 250ms forwards;
		}

		.dtm .will-slide-to-right {
				animation: pushPostToRight 500ms ease-out 250ms forwards;
		}

		/* .quote__item was here */
		.page__logo {
				animation-delay: 250ms;
		}

		.page__headline {
				animation-delay: 500ms;
		}

		.page__media {
				animation-delay: 750ms;
		}

		.page__copy,
		.page__calltoaction {
				animation-delay: 1000ms;
		}

		.modal--stop-animation [class*="page__"] {
				animation-duration: 0.05s;
				animation-delay: 0.05s;
		}

		@keyframes pullPostFromRight {
		from {
			opacity: 0;
			transform: translateX(7%);
		}
		to {
			opacity: 1;
			transform: translateX(0);
		}
		}

		@keyframes pullPostFromLeft {
		from {
			opacity: 0;
			transform: translateX(-7%);
		}
		to {
			opacity: 1;
			transform: translateX(0);
		}
		}

		@keyframes pushPostToRight {
				from {
			opacity: 1;
			transform: translateX(0);
		}
		to {
			opacity: 0;
			transform: translateX(7%);
		}
		}

		@keyframes pushPostToLeft {
		from {
			opacity: 1;
			transform: translateX(0);
		}
		to {
			opacity: 0;
			transform: translateX(-7%);
		}
		}


		.set-modal {
		position: absolute;
			top: 0;
			width: 100%;
				height: 100%;
				opacity: 0;
		transition: all 250ms linear;
		}

		.set-modal > .modal__in {
				height: 100%;
				min-height: 60vh;
		}

	.set-modal.modal--is-open {
		z-index: 1;
		animation: fadeIn 250ms linear forwards;
		}

		.set-modal.modal--is-closed {
				animation: fadeOut 250ms linear forwards;
		}

	.set-modal.modal--is-closed {
				z-index: 1;
				pointer-events: none;
				height: auto;
	}

	.modal-animation-end main > div:not(.set-modal) {
		display: none;
	}

	.modal-animation-end .set-modal {
		position: relative;
		}

	@keyframes fadeIn {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
		}

		@keyframes fadeOut {
				from {
			opacity: 1;
		}
		to {
			opacity: 0;
		}
		}


/* --------------------------------------------------------------------- *

		@Theme

* --------------------------------------------------------------------- */
		/*	Font Size
				@Desc: Set up our font sizes
		* --------------------------------------------------------------------- */
		h1, .h1 {
				font-size: 40px;
				font-size: 2.2em;
		}

		h2, .h2 {
				font-size: 36px;
				font-size: 1.8em;
		}

		h3, .h3 {
				font-size: 26px;
				font-size: 1.525em;
		}

		h4, .h4 {
				font-size: 25px;
		}

		h5, .h5 {
				font-size: 18px;
		}

		h6, .h6  {
				font-size: 15px;
		}

		.h7 {
			font-size: 12px;
		}

		body, .p  {
				font-size: 18px;
				line-height: 26px;
		}
    
        small { font-size: 75%; }


		/*	@Font Family
				@Desc: Set up our font families
		* --------------------------------------------------------------------- */
		body {
				font-family: Helvetica, sans-serif;
		}

		.sans-primary-book,
		.sans-secondary-book {
				font-family: 'Sofia Pro Regular', sans-serif;
		}

		.sans-primary-medium,
		.sans-secondary-medium,
		.dtm .dtm__in .product__options * {
				font-family: 'Sofia Pro Medium', sans-serif;
		}

		.sans-secondary-semibold {
			font-family: 'Sofia Pro Semi Bold', sans-serif;
		}

		.sans-primary-bold,
		.sans-secondary-bold,
		.sans-primary-black,
		.sans-primary-ultra {
				font-family: 'Sofia Pro Bold', sans-serif;
		}

		.fn--expand {
			letter-spacing: 4px;
		}

		.fn--expanded {
			letter-spacing: 10px;
		}


		/*	@Color
		@Desc: Set up our font color palette
		* --------------------------------------------------------------------- */
		.color-primary {
			color: #f5b5ac;
		}

		.color-secondary {
			color: #fed2c2;
		}

		.color-tertiary {
			color: #fc596d;
		}

		.color-pink--new {
			color: #f3244a;
		}

		.color-gray {
			color: #444444;
		}

		.color-gray--light {
			color: #bababa;
		}

		.has-responsive-footer {
				color: black;
		}


		/*	@Background
				@Desc: Set up our background color palette
				* --------------------------------------------------------------------- */

		body.dtm__in {
			background: white;
			overflow-x: hidden;
		}

		body.dtm__in--dv {
			background: #fff;
		}

		.bg-primary {
				background: #fde1e5;
				color: #665b57;
		}

		.bg-secondary {
				background: #fee7ea;
		}

		.bg-tertiary {
			background: #e4abb4;
		}

		.bg-gray {
			background: #f5f5f5;
		}

		/* set the desktop color of our white-space background */
		.dtm__in--dv {
				background: black;
		}

		/* set the color of our canvas background */
		.l-outer__in {
				background: transparent;
		}

		.dtm__in--dv .l-footer {
				padding: 3rem 0;
				border: none;
		}

		.l-footer li,
		.l-footer p,
		.l-footer a {
			color: #333333;
		}

		.l-footer .c-list--nav:not(.has-responsive-footer) .c-list__item {
			border-right: 1px solid #333333;
		}

		.l-footer .c-list--nav:not(.has-responsive-footer) .c-list__item:last-child {
			border-right: none;
		}

		/* set the desktop color of the header & midline border color */
		.dtm__in--dv .l-header,
		.dtm__in--dv .o-box--banner {
				border-color: #8A8C8E;
		}

		/* set the color of our form headline (defaults to #333) */
		.c-brand--form .c-brand--form__legend {
				background: #3d3d3d;
		}

		/* set the color of our order review table (defaults to red) */
		.c-brand--table th,
		.c-brand--table__th {
				background: #fed2c2;
				color: black;
		}

		/* set the color of our mobile nav button */
		.dtm .nav-button {
				background: #f58223;
		}

		/* set the color of our mobile view-full-site button */
		.dtm .vfs {
				background: #333;
		}


		/*	@Graphics
				* --------------------------------------------------------------------- */
		/* set our desktop background image */
		.dtm__in--dv {

		}

		.hero {
			margin: 0 auto;
			text-align: center;
			border-bottom: 5px solid #fde1e5;
		}

		.hero * {
			margin: 0 auto;
		}

		.hero ul li div,
		.hero ul li img {
		    margin: 0 auto !important;
		}

		.hero li:first-of-type {
				background: #ffe3e0;
		}

		.hero li:nth-of-type(2) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(3) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(4) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(5) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(6) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(7) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(8) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(9) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(10) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(11) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(12) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(13) {
			background: #ffe3e0;
		}

		.hero li:nth-of-type(14) {
			background: #ffe3e0;
		}

		.shipping--tagline {
			border-bottom: 3px solid #ccc;
			max-width: 1200px;
		}

		.sans-primary-book strong {
				font-weight: normal;
				font-family: 'Sofia Pro Bold';
		}

		/* set up our path to the sprite sheet */
		[class*="sprite"] {
				background: url(/images/desktop/_sprites.png?appV=[#DtmContext.ApplicationVersion#]) no-repeat;
		}

		/* Order Btn (Round) */
		.sprite--btn-ord-round {
				width: 97px; height: 101px; background-position: -5px -2px;
		}

		.sprite--btn-ord-round:hover {
				background-position: -106px -2px;
		}

		/* Order Btn (Rect) */
		.sprite--btn-ord-rect {
				width: 194px; height: 57px; background-position: -6px -109px;
		}

		.sprite--btn-ord-rect:hover {
				background-position: -6px -170px;
		}

				/* position our order button in the main offer area */
				.gfx-offer .sprite--btn-ord-rect {
						position: absolute; top: 300px; right: 193px;
				}

		/* Process Order  */
		.sprite--btn-order-send {
				width: 194px; height: 57px; background-position: -6px -228px;
		}

		.sprite--btn-order-send:hover {
				background-position: -6px -290px;
		}


		/*	@Features & Benefits
				@Desc: thematize the features & benefits
				* --------------------------------------------------------------------- */
		/* set the text color and size of the headline */
		.fb__headline {
				color: white;
				font: 20px/1 'Sofia Pro Bold', sans-serif;
				text-transform: uppercase;
		}

		/* set the color of our banner and folds */
		.fb__banner {
				background: #7fc027;
				border-color: #568616;
		}

		/* set the color & size of our list */
		.fb__list {
				background: white;
				border-color: white;
				list-style: none;
				margin-left: 7px;
				margin-top: 10px;
		}

				/* set the size of the features box */
				.fb__list {
						width: 100%;
						left: 0px;
				}

		.fb__list li {
			margin-top: 0em;
			font-size: 1.1em;
		}

		/* set the color of our bullets */
		.fb__list li:before {
			content: "";
			position: absolute;
			display: block;
			width: 10px; height: 10px;
			border-radius: 5px;
			background: #ef6e88;
			left: -20px; top: 1px;
		}

		/*.quote-container .quote--list+ul, .js-eflex--nav {
				display: none;
		}*/

		#ba-fader {
			width: 496px;
			height: 278px;
			padding: 0;
			border: none;
			border-radius: 0px;
		}

	.option__img {
		background: #fff;
		border: 1px solid #000000;
		box-shadow: 0 2px 5px rgba(0,0,0,0.4);
	}

	.option .option__title {
		line-height: 1.25;
		margin-bottom: 1rem;
	}

	.dtm--searchresults .option__img {
		background: transparent;
	}

	.option hr {
		background: black;
	}

	hr {
		background: #9a9a9a;
		height: 2px;
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		display: block;
	}

	.dtm hr.vertical-rule {
		width: 2px;
		height: 100%;
		margin: 0 3em;
		min-height: 210px;
	}

	.dtm--subpage main.l-outer {
	  max-width: 1000px;
	  margin: 0 auto;
	}

	.option h4 {
		font-size: 1.5em;
		line-height: 1.8em;
	}

	@media all and (max-width: 1000px) {
		.hero {
			max-width: 90vw;
			margin: 0 auto;
		}
	}

		@media all and (max-width: 769px) {
			.dtm__in--mv #ba-fader {
				width: 300px;
				height: 167px;
				margin: 10px auto;
				display: block;
			}
		}

		.dtm .dtm__in .mv-show {
			display: none;
		}

		.menu-title {
				padding-left: 1rem;
			}

		@media all and ( min-width: 701px ) {
			.hero .btn--shop {
				position: absolute;
				left: 43%;
				top: 49%;
			}
			.hero .btn--shop.btn--shop--pink {
				left: 10%;
				top: 77%;
			}
			.dv--no-click {
				pointer-events: none;
			}
			.main-menu ul {
				display: flex;
				justify-content: space-around;
				align-items: center;
				list-style: none;
			}
			.main-menu > ul {
				max-height: 81px;
			}
			.menu-toggle,
			.menu-title,
			.menu-close {
				display: none;
			}
			.story {
				margin: 60px 0;
			}
			.dtm.\@mv .dtm__in--mv .\@mv-o-grid--none {
				display: table-cell;
			}
			.product {
				padding-left: 30px;
			}
			.flex .option {
				width: 50%;
			}
			.flex .option__wrap {
				max-width: 350px;
				margin: 0 auto;
			padding: 5% 0;
			}
			.dtm__in .c-brand--form__col--left {
				padding-right: 5px;
			}
			.dtm__in .c-brand--form__col--right {
				padding-left: 5px;
			}
			.dtm .dtm__in--dv .l-header__nav {
				min-height: 81px;
			}
		}

		/* @mobile new mobile styles */
		@media all and ( max-width: 701px ) {
			.hero {
				max-width: none;
			}
			.dtm .dtm__in .options {
				padding: 0;
			}
			.dtm .options .option {
				display: block;
				width: 100%;
				margin: 0;
				padding: 10px;
			}
			.options .option .row {
				width: 100%;
			}
			.dtm .dtm__in .products__title,
			.dtm .dtm__in .reviews__title,
			.dtm .dtm__in .insta__title,
			.dtm .dtm__in .story__title {
				font-size: 8vw;
				line-height: 8.5vw;
				margin: 20px 0;
				padding: 0;
			}
			.dtm .dtm__in .mv-block {
				display: block;
				width: 100%;
				padding: 0;
			}
			.dtm .dtm__in .mv-show {
				display: block;
			}
			.dtm .dtm__in .mv-hidden {
				display: none;
			}
			.fn--expand,
			.fn--expanded {
				letter-spacing: 0px;
			}
			.dtm .dtm__in .flex {
				flex-wrap: wrap;
				padding: 10px;
			}

			.flex .option {
				width: 100%;
			}

			.nav__link {
					padding: 2em 0;
					font-size: 2.3vw;
			}

			.l-header .social {
					display: none;
			}
			.dtm .btn--shop {
				position: relative;
				width: 100%;
				display: block;
				left: 0;
				top: 0;
				right: 0;
				border-top: 2px solid white;
				border-bottom: 2px solid white;
				background: #ea0090;
			}

				.dtm .dtm__in .mobile-title {
						display: block;
						text-align: center;
						padding: 30px 0 5px;
				}
				.dtm .story {
					height: auto;
					background: #ced1d6;
					padding: 10px;
				}
				.dtm .dtm__in .quote--list .quote__wrap {
					width: 100%;
					display: block;
					min-height: unset;
					padding-bottom: 20px;
				}
				.dtm .dtm__in .emailzone {
					padding: 10px 0;
				}

				/* Button styling */
				.menu-toggle {
				  display: inline-block;
				  padding: .75em 15px;
				  color: #424242;
				  cursor: pointer;
				}

				.hamburger rect {
				    fill: #424242 !important;
				}

				.menu-title {
					display: inline-block;
				}

				.menu-toggle:hover,
				#main-menu-checkbox:focus ~ header .menu-toggle {
				  color: #c00;
				  outline: auto;
				}

				#main-menu-checkbox {
				  position: absolute;
				  left: -100vw; /* get it off the screen */
				}

				/*
				 Default styles + Mobile first
				 Offscreen menu style
				*/
				.main-menu {
				  position: absolute;
				  left: -280px;
				  top: 0;
				  height: 100%;
					overflow-y: scroll;
					overflow-x: visible;
					transition: left 0.3s ease,
				  box-shadow 0.3s ease;
					z-index: 999;
				}

				.main-menu ul {
				  list-style: none;
				  margin: 0;
				  padding: 2.25em 0 0;
				  /* Hide shadow w/ -8px while 'closed' */
				  -webkit-box-shadow: -8px 0 8px rgba(0,0,0,.5);
					 -moz-box-shadow: -8px 0 8px rgba(0,0,0,.5);
						  box-shadow: -8px 0 8px rgba(0,0,0,.5);
				  min-height: 100%;
				  width: 280px;
				  background: #1a1a1a;
					overflow: hidden;
				}

				.main-menu a,
				.main-menu .menu-close {
				  display: block;
				  padding: 0.85em 0.35em 0.70em;
				  line-height: 2rem;
    			font-size: 1.5rem;
				  color: #fff;
				  text-decoration: none;
				  border-bottom: 1px solid #383838;
				}

				.main-menu a:hover,
				.main-menu a:focus,
				.main-menu .menu-close:hover,
				#main-menu-checkbox:focus ~ header .menu-close {
				  background: #333;
				  text-decoration: none;
				  color: white;
				}

				.main-menu .menu-close {
				  position: absolute;
				  right: 0;
				  top: 0;
				  cursor: pointer;
				  border-bottom: none;
				}

				.dtm .dtm__in .nav__link--sub > a {
					display: none;
				}

				#main-menu-checkbox:checked ~ header .main-menu .nav__sub {
					display: block;
					margin-top: 0px;
					padding: 0;
					left: 0;
					top: 0;
					border-left: none;
				}

				.hamburger {
					position: relative;
					top: -2px;
				}

				/*
				 On small devices, allow it to toggle...
				*/
				/*
				 :target for non-JavaScript
				 aria-expanded="true/false" will be for JavaScript
				*/
				#main-menu-checkbox:checked ~ header .main-menu,
				.main-menu[aria-expanded="true"] {
				  left: 0;
				  outline: none;
				  -moz-box-shadow: 3px 0 12px rgba(0,0,0,.25);
				  -webkit-box-shadow: 3px 0 12px rgba(0,0,0,.25);
				  box-shadow: 3px 0 12px rgba(0,0,0,.25);
					overflow: hidden;
				}

				#main-menu-checkbox:checked ~ header .menu-close,
				.main-menu[aria-expanded="true"] .menu-close {
				  z-index: 1001;
					font-size: 1.2em;
				}

				#main-menu-checkbox:checked ~ header .main-menu ul,
				.main-menu[aria-expanded="true"] ul {
				  position: relative;
				  z-index: 1000;
				  text-align: left;
				}

				/*
				 We could us `.main-menu:target:after`, but
				 it wouldn't be clickable.
				*/
				#main-menu-checkbox:checked ~ header .backdrop,
				.main-menu[aria-expanded="true"] + .backdrop {
				  position: absolute;
				  display: block;
				  content: "";
				  left: 0;
				  top: 0;
				  width: 100%;

				  height: 100%;
				  z-index: 998;
				  background: #000;
				  background: rgba(0,0,0,.85);
				  cursor: default;
				}

				@supports (position: fixed) {
				  .main-menu,
				  #main-menu-checkbox:checked ~ header .backdrop,
				  .main-menu[aria-expanded="true"] + .backdrop {
					position: fixed;
				  }
				}

				h1, .h1 {
						font-size: 8vw;
						line-height: 1;
				}

				h2, .h2 {
						font-size: 6vw;
						line-height: 1;
				}

				h3, .h3 {
						font-size: 5vw;
						line-height: 1;
				}

				h4, .h4 {
						font-size: 4vw;
						line-height: 1;
				}

				.dtm .dtm__in #form {
						padding: 2%;
						box-sizing: border-box;
				}
				.l-footer .c-list--nav > .o-grid--block a {
						color: black;
				}
				.flex .gallery {
					width: 100%;
					margin: 0 auto 30px;
				}

				.flex .product {
					padding:  0 10px;
					text-align: center;
				}
				.dtm .dtm__in .product .btn--product {
					margin: 10px 0;
				}

				.dtm .dtm__in .product__options .btn--product {
					margin: 10px auto;
				}

				.product__desc {
					text-align: left;
				}
				.product__options > div {
					margin: 0 auto;
					display: block;
				}

				.replacement-heads > .col {
					display: block;
					width: 100%;
					border: none;
				}

				.dtm .replacement-heads .vertical-rule {
					width: 100%;
					height: 2px;
					min-height: unset;
					margin: 30px 0;
				}
				.dtm .dtm__in .hearts img {
					margin: 0 auto;
					display: block;
				}
				/* end main mobile styling */
		}

.l-footer .c-list--nav > .o-grid--block a {
		color: black;
}
		}

		/* before after slider overrides */
		.twentytwenty-left-arrow, .twentytwenty-right-arrow {
				display: none;
		}

		.twentytwenty-handle {
				border: none;
				-webkit-box-shadow: none;
				-moz-box-shadow: none;
				box-shadow: none;
				background: url(/images/pinwheel.png) center top no-repeat;
				background-size: contain;
		}
		.twentytwenty-horizontal .twentytwenty-handle:before {
			margin-bottom: 18px;
		}
		.twentytwenty-horizontal .twentytwenty-handle:after {
			margin-top: 18px;
		}
		.twentytwenty-horizontal .twentytwenty-handle:before, .twentytwenty-horizontal .twentytwenty-handle:after, .twentytwenty-vertical .twentytwenty-handle:before, .twentytwenty-vertical .twentytwenty-handle:after {
			background: #cd857a;
		}
		.twentytwenty-horizontal .twentytwenty-handle:before,
		.twentytwenty-horizontal .twentytwenty-handle:after {
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
		}

		/* @flex */
		.dtm .dtm__in .flex {
			display: flex;
		}

		.flex--around {
			justify-content: space-around;
		}

		.flex--between {
			justify-content: space-between;
		}

		.flex--center--horz {
			justify-content: center;
		}

		.flex--center--vert {
			align-items: center;
		}

		.flex-self--center {
			margin: auto;
		}

		.flex-self--center {
			justify-self: center;
		}

		.flex-self--left {
			justify-self: flex-start;
		}

		.flex-self--right {
			justify-self: flex-end;
		}

		.flex--wrap {
			flex-wrap: wrap;
		}

		main .l-outer__in .flex {
			margin: 40px 0;
		}


		/* @v2 new v2 components */
		.header__tagline {
			padding: 5px 0 0;
		}

		.l-header .social {
			position: absolute;
			right: 0;
		}

		.l-header .social a {
			font-size: 1.6em;
		}

		.featured {
			padding: 2rem 0;
			/*box-shadow: 0 4px 7px rgba(0,0,0,0.35);*/
			position: relative;
			display: block;
			margin: 0 auto;
		}

		.featured img {
			max-width: 890px;
			margin: 0 auto;
		}

		.social a:hover span {
			filter: drop-shadow(0 2px 8px black);
			transition: 0.3s;
		}

		.reviews {
			border-top: 3px solid white;
			border-bottom: 3px solid white;
			background: #f5f5f5;
			/*box-shadow: inset 0 0 30px #d1d1d1;*/
		}

		.dtm .quote--list {
			background: none;
		}

		.emailzone {
			border-top: 3px solid white;
		}
		.dtm .emailzone {
			background: #f5f5f5;
		}

		.emailzone .button {
			color: black;
		}

		#form {
			background: white;
		}

		.dtm .dtm__in .steps,
		#reviewOrder {
			border: 1px solid #333333;
		}

		.dtm .steps .offer,
		.dtm .steps .c-brand--form__list,
		.dtm .dtm__in .reviewTable__wrap {
			padding: 10px;
		}

		#form form {
				max-width: 930px;
				margin: 0 auto;
		}

		#AcceptOfferButton {
			background: #f83f5b;
			color: #fff;
			text-align: center;
			padding: 17px 26px 12px;
			border-radius: 5px;
			font: 20px/20px 'Sofia Pro Bold';
			text-indent: 0px;
			width: auto;
			max-width: none;
			text-transform: uppercase;
			box-shadow: none;
			border: none;
			border-radius: 0px;
		}

		#ShippingIsSame {
			margin: 0 auto 1rem;
		}

		#AcceptOfferButton:hover {
			background: #b62b3d;
			transition: 0.3s;
		}

		.dtm [class*="button"] {
			padding: 1rem 1rem 0.7rem;
		}

		.story {
			/*background: url(/images/3.0000/bg-story.jpg) center top no-repeat;*/
			border-top: 3px solid white;
			border-bottom: 3px solid white;
			height: auto;
			padding: 0;
			display: flex;
			justify-content: center;
			width: 100%;
			align-items: stretch;
			margin: 0 0 -3px;
		}
		.story__img {
			width: 40%;
			position: relative;
			overflow: hidden;
			background: url(/images/3.0000/story.jpg) right bottom no-repeat;
		}
		.story__img img {
			height: 100%;
			width: auto;
			position: absolute;
			right: 0;
			top: 0;
			display: block;
		}
		.story__text {
			text-shadow: 0 2px 1px white;
			width: 60%;
			padding: 3vw;
			padding-right: 1%;
			background: #fde1e5;
			text-align: left;
		}

		.story__title {
			letter-spacing: 4px;
		}

		.story__text p,
        .story__text h3 {
			max-width: 660px;
		}
		.overflow {
			overflow: scroll;
			height: 320px;
		}
		@keyframes smoothSlide {
		  from { transform: translateX(0px); }
		  to { transform: translateX(-20vw); }
		}
		#instafeed {
			width: auto;
			max-height: 320px;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			flex-basis: 0;
			height: auto;
		}
		.insta__title {font-family: 'Sofia Pro Regular', sans-serif;}
		/*
		#instafeed.animated {
			animation-name: smoothSlide;
			animation-duration: 1s;
			animation-iteration-count: infinite;
			animation-direction: alternate;
			animation-timing-function: linear;
			animation-delay: -4s;
		}
		#instafeed.animated:hover {
			animation-play-state: paused;
		}
		*/
		#instafeed {
			overflow: scroll;
		}
		#instafeed img {
			width: auto;
			max-height: 320px;
		}

		.dtm .page__copy {
			font-family: 'Sofia Pro Regular';
		}

		.dtm .page__copy strong {
			font-family: 'Sofia Pro Semi Bold';
		}

		h2[data-page-headline] {
			font-family: 'Sofia Pro Bold';
			font-style: normal;
		}


.subscribe-msg {
	display: none;
  text-align:  center;
  width: 90%;
  max-width: 900px;
  margin: 10px auto;
  padding: 0.75em;
  font-size: 1.1em;
}

.subscribe-msg.success {
	display: block;
  background: #4ed14e;
  border: 1px solid green;
}

.subscribe-msg.error {
	display: block;
  background: #e00808;
  border: 1px solid black;
  color: white;
}

.dtm .product .btn--product {
	margin: 10px 0;
	font-size: 16px;
	padding: 10px 0 4px;
	max-width: 180px;
		text-align: center;
		background: #f32449;
}
.dtm .product .btn--product:hover,
.dtm .product .btn--product:focus {
	background: #b62b3d;
}
.dtm .product .btn--product.btn--sold-out,
.dtm--index .btn--product.btn--sold-out {
	background: #222;
}
.dtm--sub .product .btn--product {
	max-width: 130px;
}

.gallery {
	height: auto;
	text-align: center;
}
.gallery img {
	border: 1px solid black;
	width: 100%;
}
.gallery__main {
	width: calc(100% - 8px);
	margin: 0 auto 2px;
	display: block;
}
.gallery__thumbs {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
.gallery__thumbs a {
	width: calc(20% - 8px);
	margin: 3px;
}
.gallery__thumbs--six a {
    width: calc(17% - 8px);
}
.gallery__thumbs .no-left-m {
	margin-left: 0px;
}
.gallery__thumbs .no-right-m {
	margin-right: 0px;
}

.hearts {
	margin: 6px 0 0;
	color: #fd5a6e;
	font-size: 1.4em;
  letter-spacing: 4px;
}

.hearts img {
	max-width: 90px;
}

.flex .gallery {
	min-width: 40%;
	max-width: 520px;
}

@media all and (min-width: 701px) {
	.dtm--replacement .flex .gallery {
		min-width: 400px;
	}
}

.\@b .l-header__nav,
.\@b #main-menu-checkbox,
.\@b .menu-toggle,
.\@b .menu-title,
.\@b .l-header .social {
	display: none !important;
}

.fancybox-wrap iframe {
	min-width: 64vw;
	min-height: 36vw;
}

.dtm--customerservice main.l-outer {
	padding: 30px 10px 30px;
}

.dtm__in--dv #form, .dtm__in--dv #order {
	padding: 0;
	width: 100%;
	max-width: none;
}

#emailSubscribePop,
#emailSubscribe {
	min-width: 170px;
	border-radius: 0px;
}

.how-to--item {
	max-width: 800px;
	margin: 10px auto 40px;
}

/* IE11 fixes */
.dtm__in--dv .offer--grid .item__img {
	max-width: 66px;
}

/* detail page */
.dtm .product__title {
	font-size: 40px;
	font-size: 1.9em;
	line-height: 1.05;
}

.product__desc .product__title,
.product .product__desc p,
.dtm--replacement .product__title {
	margin-bottom: 2rem;
}

.product__desc .product__title {
	font-size: 2.8rem;
}

.product p {
	font-family: 'Sofia Pro Regular', sans-serif;
}

.product hr {
	margin: 30px 0;
}

.dtm .product__options {
    padding: 0;
}

.product__title__name {
	line-height: 1.05;
}

.dtm .dtm__in .replacement-heads img {
	display: inline-block;
	width: auto;
}
.has-search-icon {
	position: relative;
	display: flex;
}
.has-search-icon input {
	text-indent: 40px;
	font: 18px 'Sofia Pro Semi Bold';
	letter-spacing: 1px;
	height: 55px;
	color: black;
}

#textS {
	border-radius: 5px 0 0 5px;
	font: 15px/1 'Sofia Pro Medium';
	text-transform: uppercase;
}

#searchSubmit {
	display: flex;
	text-align: center;
	align-items: center;
	text-indent: 0;
	line-height: 1;
	height: auto;
	justify-content: center;
	background: #000;
	transition: background 200ms ease-in-out;
	border: none;
	border-radius: 0 5px 5px 0;
	color: white;
}

#searchSubmit:focus,
#searchSubmit:hover {
	background: #444;
}

#searchSubmit > span {
	font-family: 'Sofia Pro Medium';
	position: relative;
	margin-top: 4px;
}

.has-search-icon::after {
		content: "";
		position: absolute;
		width: 30px;
		height: 30px;
		background: url(/images/3.0000/search-icon.png);
		background-size: contain;
		background-repeat: no-repeat;
		z-index: 3;
		left: 10px;
		top: 12px;
		opacity: 0.5;
}

.dtm__in--dv img[src*=PositiveSSL_tl_trans] {
	max-width: 108px;
}

.dtm__in--mv .c-brand--form__fieldset {
	border: 1px solid black;
}
.dtm__in--mv .c-brand--form__fieldset--borderless {
	border: none;
}

.c-brand--form__headline strong {
	text-transform: uppercase;
}

.form__title {
    font: 40px 'Sofia Pro Semi Bold';
    color: #333333;
    margin: 35px 0;
}

.form__text {
    font: 18px 'Sofia Pro Regular';
    color: #333333;
    margin: 15px 0;
}

.form-wrapper .c-brand--form__fieldset *,
.l-footer * {
    font-family: 'Sofia Pro Regular';
}

.dtm .form-wrapper {
	max-width: 960px;
	margin: 0 auto;
}

#subscribeform {
	display: flex;
	justify-content: space-between;
	align-items: stretch;
}
#subscribeform .button {
	margin-left: 5px;
	border-radius: 0px;
}

/* this hides the homepage qty options */
/* leaving this until client wants to turn on */
.dtm--index .option .col select,
.dtm--index .option .col+h5 {
	display: none;
}

/* fix logic with classes to hide/show right columns for replacement heads page */
.dtm .product__heads--main .col__heads--legs {
	display: none;
}

.dtm .product__heads--legs .col__heads--main {
	display: none;
}


@media all and (-ms-high-contrast:none) {
	*::-ms-backdrop, .dtm__in .bg-secondary > .flex { display: block; } /* IE11 */
}
</style>

<style id="CSS.New">
.dtm .products__title,
.reviews__title,
.insta__title,
.story__title {
	font-size: 40px;
	line-height: 40px;
}
.dtm .products__title {
	margin: 60px 0 0;
}
.dtm sup {
	font-size: 50%;
	bottom: 0.7em;
}
.options .option {
	display: inline-block;
	vertical-align: top;
	width: calc(33% - 60px);
	margin: 30px;
}
.dtm .option hr {
	margin: 0 0 12px;
}
#subscribeform input[type="submit"] {
	background: #f83f5b;
	color: white;
	box-shadow: none;
	transition: background 200ms ease-in-out;
	border: none;
	padding-top: 12px;
}

#subscribeform input[type="submit"]:focus,
#subscribeform input[type="submit"]:hover {
	background: #9e0624;
}

.insta__title {
	padding: 0;
    margin: 60px 0 40px;
}
.insta__subtitle {
	font-size: 20px;
	margin: 20px 0;
}
.dtm .dtm__in .connect {
	padding-bottom: 0px;
}
.dtm--sub .dtm__in--dv main > div.tertiary-container {
	min-height: 800px;
}

.dtm--body .gallery__thumbs a {
    width: calc(17.2% - 8px);
}

/*.dtm .dtm__in--dv .l-header__nav {
    min-height: 81px;
}*/
.dtm__in--dv .replacement-heads .flex {
	max-width: 1200px;
}
.dtm__in--dv .replacement-heads .flex .gallery img {
    max-width: 400px;
}
.dtm.\@b .c-brand--table--cart th,
.dtm.\@b .dtm__in .c-brand--table--cart .c-brand--table__th {
	color: white;
}
.dtm__in--dv .reviews {
	max-height: 500px;
}
.dtm__in--mv .reviews {
    max-height: 130vw;
}
.quote__item:not(:first-child) {
	position: absolute;
}
.promo {
    width: 100%;
}
.promo .inner {
    display: block;
    max-width: 380px;
    margin: 0 auto;
}

/* slider controls */

@media all and (min-width: 1300px) {

	.dtm__in .hero .js-eflex--nav button {
		color: #a0a0a0;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 50px;
		height: 50px;
		background: white;
		font-size: 5rem;
		position: absolute;
		z-index: 10;
		border-radius: 12px;
		box-shadow:  0 2px 2px rgba(0,0,0,0.4);
	}

	.dtm__in .hero .js-eflex--nav button {
		top: calc(50% - 50px);
		padding: 0;
	}

	.dtm__in .hero .js-eflex--nav button[data-dir=prev] {
		left: 50px;
	}
	.dtm__in .hero .js-eflex--nav button[data-dir=next] {
		right: 50px;
	}

@media all and (-ms-high-contrast:none) {
		*::-ms-backdrop, .hero .js-eflex--nav [data-dir=prev] {
			padding: 0 5px 0 0 !important;
		}
		*::-ms-backdrop, .hero .js-eflex--nav [data-dir=next] {
			padding: 0 0 0 13px !important;
		}
}

	.dtm__in .hero .js-eflex--nav button .js-eflex__nav__item {
		display: none;
	}
		.dtm__in--dv .hero [data-js-eflex-paginate] {
		position: absolute;
		bottom: 10px;
		z-index: 10;
		left: 0;
		right: 0;
		margin: 0 auto;
		max-width: 160px;
	}
	.dtm__in .hero .js-eflex--nav button .js-eflex__nav__item.icon-chevron-right,
	.dtm__in .hero .js-eflex--nav button .js-eflex__nav__item.icon-chevron-left {
		display: block;
		line-height: 0.80;
	}
}

.dtm a.btn--product.btn--sold-out {
    background: black;
}

/* replacement heads mobile overrides */
@media all and (max-width: 701px) {
	.dtm__in--dv .replacement-heads .flex .gallery img {
    max-width: 35rem;
	}
	.dtm--replacement .product__title {
    font-size: 2.4rem;
	}
	.dtm--replacement .dtm__in .product .btn--product {
    margin: 1rem auto;
	}
	.product__heads .col__heads--legs .col:first-of-type {
    width: 48%;
	}

	.product__heads .col__heads--legs,
	.product__heads .col__heads--legs .row {
	    width: 100%;
	    display: block;
	}

	#dv_Replace .product__heads--main > .col,
	#dv_Replace .product__heads--main > .col .row {
	    display: block;
	    width: 100%;
	    margin: 0 auto 3rem;
	}

	#dv_Replace .product__heads--main > .col:nth-of-type(2) {
	    display: none;
	}

	#dv_Replace .product__heads--main > .col .col {
	    width: 40%;
	}

	#dv_Replace .product__heads--main > .col img {
	    display: inline-block;
	    vertical-align: middle;
	}

	.dtm .dtm__in .featured {
		display: none;
	}
}

.gallery--glo .gallery__thumbs a {
    flex-wrap: wrap;
}

.gallery--glo .gallery__thumbs a {
    width: calc(25% - 8px);
}

.dtm--contour .gallery__thumbs a {
    width: calc(17.4% - 8px);
}
#faq p {
    font-size: 18px;
}
.dtm .l-footer .footer__awards {
	max-width: 570px;
}
.dtm__in--mv .l-footer .footer__awards {
	width: 100%;
}

@media all and (max-width: 900px) {
	.options .option {
	    width: calc(33% - 20px);
	    margin: 10px;
	}

	.dtm .dtm__in .options {
	    padding: 0;
	}
}

@media all and (max-width: 780px) {
	.options .option {
	    width: calc(50% - 30px);
	    margin: 10px;
	    display: inline-block;
	}

	.dtm .dtm__in .options {
	    padding: 0;
	}
}

@media screen and (orientation: landscape) {
.dtm .dtm__in--mv .options .option {
	width: calc(50% - 30px);
	display: inline-block;
	margin: 10px;
}
.dtm .dtm__in--mv .products__title,
.dtm .dtm__in--mv .reviews__title,
.dtm .dtm__in--mv .insta__title,
.dtm .dtm__in--mv .story__title {
    font-size: 3rem;
    margin-top: 10px;
}
}

.\@b.dtm .header__menu--mobile,
.\@b.dtm .header__menu {
    display: none;
}

.btn--sold-out {
    display: none;
}

/* broken instagrams */
#instafeed a[href*=B-AGkLgliP6] {
    display: none;
}

/* new replacement heads zoom transitions */

#dv_Replace .product img {
    transition: transform 0.3s;
		max-width: 60px;
}
#dv_Replace .product img:hover {
    transform: scale(1.5);
}
</style>