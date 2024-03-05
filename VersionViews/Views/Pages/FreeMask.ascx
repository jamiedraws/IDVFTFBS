<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<style>
.free-mask {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #444444;
    font-size: 3rem;
}

.free-mask__copy {
    background: #fde1e5;
    padding: 0.75em;
    border: 2px solid white;
    outline: 1px solid #f83f5b;
    text-align: center;
    margin-left: -2.3em;
    position: relative;
    z-index: -1;
    padding-left: 2.7em;
	line-height: 1;
}

.free-mask__copy span {
    display: block;
    font-size: 1.25em;
    margin: 0 0 0.2em;
}

@media (max-width: 800px) {
    .free-mask {
        font-size: 4vw;
    }

    .free-mask__image {
        max-width: 6.3em;
    }
}
</style>

<div class="free-mask sans-secondary-book">
	<div class="free-mask__image">
		<img src="/images/silk-mask.png" alt="Silk Mask">
	</div>
	<div class="free-mask__copy">
		<span class="color-pink--new sans-primary-ultra">FREE FLAWLESS SILK MASK</span>
		with a purchase of $40 or more!
	</div>
</div>