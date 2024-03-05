<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%-- Html.RenderSnippet("STYLE-BLOCK-HEAD"); --%>

<style>

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

.pictos {
	font-family: 'Pictos';
}

[hidden] {
	display: none;
}

/* before after slider styles*/
.twentytwenty-horizontal .twentytwenty-handle:before, .twentytwenty-horizontal .twentytwenty-handle:after, .twentytwenty-vertical .twentytwenty-handle:before, .twentytwenty-vertical .twentytwenty-handle:after {
	content: " ";
	display: block;
	background: white;
	position: absolute;
	z-index: 30;
	-webkit-box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5); }

.twentytwenty-horizontal .twentytwenty-handle:before, .twentytwenty-horizontal .twentytwenty-handle:after {
	width: 3px;
	height: 9999px;
	left: 50%;
	margin-left: -1.5px; }

.twentytwenty-vertical .twentytwenty-handle:before, .twentytwenty-vertical .twentytwenty-handle:after {
	width: 9999px;
	height: 3px;
	top: 50%;
	margin-top: -1.5px; }

.twentytwenty-before-label, .twentytwenty-after-label, .twentytwenty-overlay {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%; }

.twentytwenty-before-label, .twentytwenty-after-label, .twentytwenty-overlay {
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	transition-duration: 0.5s; }

.twentytwenty-before-label, .twentytwenty-after-label {
	-webkit-transition-property: opacity;
	-moz-transition-property: opacity;
	transition-property: opacity; }

.twentytwenty-before-label:before, .twentytwenty-after-label:before {
	color: white;
	font-size: 13px;
	letter-spacing: 0.1em; }

.twentytwenty-before-label:before, .twentytwenty-after-label:before {
	position: absolute;
	background: rgba(255, 255, 255, 0.2);
	line-height: 38px;
	padding: 0 20px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px; }

.twentytwenty-horizontal .twentytwenty-before-label:before, .twentytwenty-horizontal .twentytwenty-after-label:before {
	top: 50%;
	margin-top: -19px; }

.twentytwenty-vertical .twentytwenty-before-label:before, .twentytwenty-vertical .twentytwenty-after-label:before {
	left: 50%;
	margin-left: -45px;
	text-align: center;
	width: 90px; }

.twentytwenty-left-arrow, .twentytwenty-right-arrow, .twentytwenty-up-arrow, .twentytwenty-down-arrow {
	width: 0;
	height: 0;
	border: 6px inset transparent;
	position: absolute; }

.twentytwenty-left-arrow, .twentytwenty-right-arrow {
	top: 50%;
	margin-top: -6px; }

.twentytwenty-up-arrow, .twentytwenty-down-arrow {
	left: 50%;
	margin-left: -6px; }

.twentytwenty-container {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	z-index: 0;
	overflow: hidden;
	position: relative;
	-webkit-user-select: none;
	-moz-user-select: none; }
	.twentytwenty-container img {
		max-width: 100%;
		position: absolute;
		top: 0;
		display: block; }
	.twentytwenty-container.active .twentytwenty-overlay, .twentytwenty-container.active :hover.twentytwenty-overlay {
		background: rgba(0, 0, 0, 0); }
		.twentytwenty-container.active .twentytwenty-overlay .twentytwenty-before-label,
		.twentytwenty-container.active .twentytwenty-overlay .twentytwenty-after-label, .twentytwenty-container.active :hover.twentytwenty-overlay .twentytwenty-before-label,
		.twentytwenty-container.active :hover.twentytwenty-overlay .twentytwenty-after-label {
			opacity: 0; }
	.twentytwenty-container * {
		-webkit-box-sizing: content-box;
		-moz-box-sizing: content-box;
		box-sizing: content-box; }

.twentytwenty-before-label {
	opacity: 0; }
	.twentytwenty-before-label:before {
		content: attr(data-content); }

.twentytwenty-after-label {
	opacity: 0; }
	.twentytwenty-after-label:before {
		content: attr(data-content); }

.twentytwenty-horizontal .twentytwenty-before-label:before {
	left: 10px; }

.twentytwenty-horizontal .twentytwenty-after-label:before {
	right: 10px; }

.twentytwenty-vertical .twentytwenty-before-label:before {
	top: 10px; }

.twentytwenty-vertical .twentytwenty-after-label:before {
	bottom: 10px; }

.twentytwenty-overlay {
	-webkit-transition-property: background;
	-moz-transition-property: background;
	transition-property: background;
	background: rgba(0, 0, 0, 0);
	z-index: 25; }
	.twentytwenty-overlay:hover {
		background: rgba(0, 0, 0, 0.5); }
		.twentytwenty-overlay:hover .twentytwenty-after-label {
			opacity: 1; }
		.twentytwenty-overlay:hover .twentytwenty-before-label {
			opacity: 1; }

.twentytwenty-before {
	z-index: 20; }

.twentytwenty-after {
	z-index: 10; }

.twentytwenty-handle {
	height: 38px;
	width: 38px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -22px;
	margin-top: -22px;
	border: 3px solid white;
	-webkit-border-radius: 1000px;
	-moz-border-radius: 1000px;
	border-radius: 1000px;
	-webkit-box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: 0px 0px 12px rgba(51, 51, 51, 0.5);
	z-index: 40;
	cursor: pointer; }

.twentytwenty-horizontal .twentytwenty-handle:before {
	bottom: 50%;
	margin-bottom: 22px;
	-webkit-box-shadow: 0 3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: 0 3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: 0 3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5); }
.twentytwenty-horizontal .twentytwenty-handle:after {
	top: 50%;
	margin-top: 22px;
	-webkit-box-shadow: 0 -3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: 0 -3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: 0 -3px 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5); }

.twentytwenty-vertical .twentytwenty-handle:before {
	left: 50%;
	margin-left: 22px;
	-webkit-box-shadow: 3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: 3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: 3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5); }
.twentytwenty-vertical .twentytwenty-handle:after {
	right: 50%;
	margin-right: 22px;
	-webkit-box-shadow: -3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	-moz-box-shadow: -3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5);
	box-shadow: -3px 0 0 white, 0px 0px 12px rgba(51, 51, 51, 0.5); }

.twentytwenty-left-arrow {
	border-right: 6px solid white;
	left: 50%;
	margin-left: -17px; }

.twentytwenty-right-arrow {
	border-left: 6px solid white;
	right: 50%;
	margin-right: -17px; }

.twentytwenty-up-arrow {
	border-bottom: 6px solid white;
	top: 50%;
	margin-top: -17px; }

.twentytwenty-down-arrow {
	border-top: 6px solid white;
	bottom: 50%;
	margin-bottom: -17px; }

</style>

<style>
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

		/*
		@media all and (min-width: 993px) and (max-width: 1300px) {
			.nav__sub {

			}
		}

		@media all and (min-width: 701px) and (max-width: 993px) {
			.nav__sub {

			}
		}
		*/

		@media all and (min-width: 993px) {
				.l-header__nav {
					padding: 10px 0;
				}
				#main-menu li {
					padding: 21px 0 10px;
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
				}
				/* make sure quote-container has min-height */
				.quote-container {
					min-height: 200px;
				}

				.dtm .dtm__in .quote__item blockquote {
					display: block;
					/*max-width: 800px;*/
					margin: 0 auto;
				}
		}

		.dtm .dtm__in .quote__item {
			background: #f2f2f2;
		}

		.dtm .dtm__in .quote--list .quote__wrap {
			width: 31%;
			padding: 1%;
			min-height: 200px;
			display: inline-block;
			vertical-align: top;
		}

		@media all and (max-width: 768px) {
				.logo__link {
						max-width: 50%;
				}

				.dtm [class*="social-link"] {
						font-size: 1.25rem;
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
		}

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
				display: inline-block;
				vertical-align: top;
				padding: 1rem;
				margin-bottom: 2rem;
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
				background: #fce9e6;
		}
		.is-modal > .tertiary-container {
				background: #fce9e6;
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
		.nav__link {
			display: block;
			text-decoration: none;
			padding: 0 0 0.2rem;
			border-bottom: 1px solid transparent;
			transition: all 250ms ease-in-out;
			color: #333333;
			text-transform: uppercase;
			font-family: inherit;
			font-size: 0.8em;
			border-bottom: 2px solid white;
		}

		li:not(.nav__link--sub) .nav__link:hover {
			color: black;
				border-color: #e197a3;
				transition: 0.3s;
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
			top: -5vw;
			margin: 2vw auto 0;
			background: white;
			padding: 0.5vw;
			box-shadow: 0 0 10px 3px rgba(0,0,0,0.3);
			border-radius: 5px;
			padding-bottom: 0;
		}

		.nav__sub::before {
			content: "";
		}

		.nav__link--sub+.nav__link--sub .nav__sub {
			width: 300%;
			left: -100%;
		}

		.l-header__nav {
				position: relative;
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
						color: #eb4d6d;
				}

				.quote--list .list--stars,
				.quote--list .list__star {
						display: inline-block;
						font-size: 1.1em;
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
				font: 1em/1 'Gotham Bold', sans-serif;
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
			font: 1.3em/1 'Gotham Bold', sans-serif;
		}

		.dtm .order-button img {
			display: inline-block;
			vertical-align: middle;
		}

				.order-button small {
						display: block;
						font-size: 0.6em;
				}

		.dtm a.btn--order {
			background: #eb4d6d;
			color: white;
			text-transform: uppercase;
			text-decoration: none;
			border-radius: 5px;
			padding: 1.5rem 3rem 1rem;
			display: block;
			margin: 1rem auto;
			max-width: 250px;
			border: 2px solid white;
		}
		.dtm a.btn--order:hover {
			background: #9e0624;
			transition: 0.3s;
		}
		.dtm a.btn--order:focus {
			border: 2px solid black;
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
			background: white;
			color: #d64e66;
		}
		.dtm .btn--shop:hover {
			background: #444;
			color: white;
			border-color: #f5b5ac;
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


		@media all and (max-width: 768px) {
				.l-header__logo .col {
						text-align: center;
				}

				.l-header__logo img {
						margin: auto;
						display: block;
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
				font-size: 44px;
				font-size: 2.750em;
		}

		h2, .h2 {
				font-size: 36px;
				font-size: 1.8em;
		}

		h3, .h3 {
				font-size: 26px;
				font-size: 1.625em;
		}

		h4, .h4 {
				font-size: 22px;
				font-size: 1.375em;
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
		}


		/*	@Font Family
				@Desc: Set up our font families
		* --------------------------------------------------------------------- */
		body {
				font-family: Helvetica, sans-serif;
		}

		.sans-primary-book {
				font-family: 'Gotham Book', sans-serif;
		}

		.sans-primary-medium {
				font-family: 'Gotham Medium', sans-serif;
		}

		.sans-primary-bold {
				font-family: 'Gotham Bold', sans-serif;
		}

		.sans-primary-black {
				font-family: 'Gotham Black', sans-serif;
		}

		.sans-primary-ultra {
				font-family: 'Gotham Ultra', sans-serif;
		}

		.sans-secondary-bold {
			font-family: 'sofia-pro', sans-serif;
			font-weight: 700;
		}

		.sans-secondary-semibold {
			font-family: 'sofia-pro', sans-serif;
			font-weight: 600;
		}

		.sans-secondary-book {
			font-family: 'sofia-pro', sans-serif;
			font-weight: 400;
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
			color: #650DA2;
		}

		.color-tertiary {
			color: #eb4d6d;
		}

		.color-gray {
			color: #333333;
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

		.bg-primary {
				background: black;
				color: white;
		}

		.bg-secondary {
				background: #e197a3;
		}

		.bg-tertiary {
			background: #e4abb4;
			/*background: -moz-linear-gradient(left, #dfa7b2 0%, #dc98a5 50%, #dfa7b2 100%);
			background: -webkit-linear-gradient(left, #dfa7b2 0%,#dc98a5 50%,#dfa7b2 100%);
			background: linear-gradient(to right, #dfa7b2 0%,#dc98a5 50%,#dfa7b2 100%);*/
		}

		.bg-gray {
			background: #424242;
		}

		/* set the desktop color of our white-space background */
		.dtm__in--dv {
				background: black;
		}

		/* set the color of our canvas background */
		.l-outer__in {
				background: transparent;
		}

		/* set the desktop color of our header, midline & footer */
		.dtm__in--dv .l-header {
				background: white;
		}

		.dtm__in--dv .l-footer {
				color: white;
				border: none;
		}

		.dtm__in--dv .l-footer a,
		.dtm__in--dv .l-footer p {
			color: white;
		}

		.l-footer .c-list--nav:not(.has-responsive-footer) .c-list__item {
			border-right: 1px solid white;
		}

		.l-footer .c-list--nav:not(.has-responsive-footer) .c-list__item:last-child {
			border-right: none;
		}

		/* set the desktop color of the header & midline border color */
		.dtm__in--dv .l-header,
		.dtm__in--dv .o-box--banner {
				border-color: #8A8C8E;
		}

		.dtm__in--dv .l-header {
			/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f4b5ab+0,ffffff+50,ffffff+100 */
			background: #f4b5ab; /* Old browsers */
			background: -moz-linear-gradient(top, #f4b5ab 0%, #ffffff 15%, #ffffff 100%); /* FF3.6-15 */
			background: -webkit-linear-gradient(top, #f4b5ab 0%,#ffffff 15%,#ffffff 100%); /* Chrome10-25,Safari5.1-6 */
			background: linear-gradient(to bottom, #f4b5ab 0%,#ffffff 15%,#ffffff 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		}

		/* set the color of our form headline (defaults to #333) */
		.c-brand--form .c-brand--form__legend {
				background: #3d3d3d;
		}

		/* set the color of our order review table (defaults to red) */
		.c-brand--table th,
		.c-brand--table__th {
				background: #ee599d;
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

		.sans-primary-book strong {
				font-weight: normal;
				font-family: 'Gotham Bold';
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
				font: 20px/1 'Gotham Ultra', sans-serif;
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

		@media all and ( min-width: 701px ) {
			.hero .btn--shop {
				position: absolute;
				left: 0px; top: 73%;
			}
			.main-menu ul {
				display: flex;
				justify-content: space-around;
				list-style: none;
				padding: 15px 0;
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
		}

		/* @mobile new mobile styles */
		@media all and ( max-width: 701px ) {
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
					border-radius: 0px;
					border-width: 3px;
			}
			.dtm .dtm__in .middle {
						padding: 10px;
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
				  color: #333;
				  cursor: pointer;
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
				  left: -200px;
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
				  width: 200px;
				  background: #1a1a1a;
				}

				.main-menu a,
				.main-menu .menu-close {
				  display: block;
				  padding: .75em 15px;
				  line-height: 1em;
				  font-size: 1em;
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
				}

				#main-menu-checkbox:checked ~ header .menu-close,
				.main-menu[aria-expanded="true"] .menu-close {
				  z-index: 1001;
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
						line-height: 8vw;
				}

				h2, .h2 {
						font-size: 6vw;
						line-height: 6vw;
				}

				h3, .h3 {
						font-size: 5vw;
						line-height: 5vw;
				}

				h4, .h4 {
						font-size: 4vw;
						line-height: 4vw;
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
				.dtm .dtm__in .product .btn--order {
					margin: 10px auto;
				}
				.product__desc {
					text-align: left;
				}
				/* end main mobile styling */
		}

		@media all and (max-width: 815px) and (orientation: landscape) {
			.dtm a.btn--order {
		font-size: 3vw;
		padding: 0.6em 0.4em 0.4em;
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

		.flex-self--right {
			justify-self: flex-end;
		}


		/* @v2 new v2 components */
		.header__tagline {
			padding: 5px 0;
		}

		.l-header .social {
			position: absolute;
			right: 0;
		}

		.l-header .social a {
			font-size: 1.6em;
		}

		.featured {
			padding: 2% 0;
			box-shadow: 0 4px 7px rgba(0,0,0,0.35);
			position: relative;
		}

		.social a:hover span {
			filter: drop-shadow(0 2px 8px black);
			transition: 0.3s;
		}

		.products__top {
			border-bottom: 3px solid #c0c0c0;
		}

		.reviews {
			border-top: 3px solid white;
			border-bottom: 3px solid white;
			background: #f2f2f2;
			box-shadow: inset 0 0 30px #d1d1d1;
		}

		.dtm .quote--list {
			background: none;
		}

		.emailzone {
			border-top: 3px solid white;
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
			background: #eb4d6d;
			color: white;
			text-align: center;
			padding: 1rem 1.5rem;
			border-radius: 5px;
			font: 700 2em/1.8em 'sofia-pro';
			text-indent: 0px;
			width: auto;
			max-width: none;
			text-transform: uppercase;
		}

		#AcceptOfferButton:hover {
			background: #9e0624;
			transition: 0.3s;
		}

		.story {
			background: url(/images/2.0000/bg-story.jpg) center top no-repeat;
			border: 3px solid white;
			box-shadow: 0 3px 10px rgba(0,0,0,0.65);
			height: 496px;
			padding: 30px 40px;
		}

		.story__text {
			text-shadow: 0 2px 1px white;
			float: right;
			max-width: 610px;
		}
		.overflow {
			overflow: scroll;
			height: 320px;
		}
		#instafeed {
			width: 1200px;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			flex-basis: auto;
			height: auto;
			overflow: scroll;
		}
		#instafeed,
		#instafeed img {
			width: auto;
			max-height: 320px;
		}

		.dtm .page__copy {
		    font-family: 'sofia-pro';
			font-weight: 400;
		}

		.dtm .page__copy strong {
		    font-family: 'sofia-pro';
			font-weight: 600;
		}

		h2[data-page-headline] {
		    font-family: 'sofia-pro';
			font-weight: 700;
		    font-style: normal;
		}

		.option__overlay:hover img {
			    -webkit-filter: grayscale(100%);
			    filter: grayscale(100%);
			}

			.option__overlay:hover:after {
			    content: "View Details";
			    font-size: 1.1em;
			    font-weight: bold;
			    text-transform: uppercase;
			    position: absolute;
			    margin: 0 auto;
			    background: rgba(0,0,0,0.5);
			    color: white;
			    width: 100%;
			    height: 100%;
			    left: 0;
			    top: 0;
			    display: flex;
			    justify-content: center;
			    align-items: center;
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

.dtm .product .btn--order {
    margin: 10px 0;
    font-size: 1.1em;
    padding: 0.75em 0.7em 0.6em;
    max-width: 180px;
    text-align: center;
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
	justify-content: space-between;
}
.gallery__thumbs a {
	width: calc(20% - 8px);
	margin: 3px;
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
    padding: 10px 10px 30px;
}

.dtm__in--dv #form, .dtm__in--dv #order {
    padding: 20px 0;
    width: 100%;
    max-width: none;
}

#emailSubscribePop,
#emailSubscribe {
    min-width: 170px;
}

.how-to--item {
	max-width: 800px;
	margin: 10px auto 40px;
}

/* IE11 fixes */
.dtm__in--dv .offer--grid .item__img {
    max-width: 66px;
}

.dtm__in--dv img[src*=PositiveSSL_tl_trans] {
	max-width: 108px;
}
@media all and (-ms-high-contrast:none) {
	*::-ms-backdrop, .dtm__in .bg-secondary > .flex { display: block; } /* IE11 */
}
</style>