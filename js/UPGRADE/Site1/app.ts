// applications
import {
    initalizeDocumentModalDialogsByDOMMutation,
    initializeDocumentModalDialogsByContainers,
    initializeDocumentModalDialogsByControllers,
    initializeDocumentModalDialogsByTemplates
} from "ts/applications/modal-dialog";
import {
    initializeMikMakUI,
    initializeBazaarVoiceUI,
    initializeReviewTableUI,
    initializeFlyoutUI,
    pubsub
} from "ts/applications/delay-input";
import { initializeCartToast } from "ts/applications/toast";

// observers
import { observer } from "Shared/ts/observers/intersection";
import MediaQuery from "Shared/ts/observers/media-query";

// utils
import ElementController from "Shared/ts/utils/element-controller";
import VimeoManager from "Shared/ts/utils/vimeo-manager";
import LoadItem from "Shared/ts/utils/load-item";
import {
    createElement,
    getJSONByElementAttribute,
    setElementAttributes
} from "Shared/ts/utils/html";
import KlaviyoSignUpForm from "ts/utils/klaviyo-signup-form";

// api
import ModalDialogIframe from "Shared/ts/api/modal/modal-dialog-iframe";
import { initializeGlobalHTMLTemplateRenderingEngine } from "ts/api/html-template-rendering-engine";

// components
import Accordion from "Shared/ts/components/accordion";
import Carousel from "Shared/ts/components/carousel";
import ResponsiveCarousel from "Shared/ts/components/responsive-carousel";
import FadeCarousel from "Shared/ts/components/fade-carousel";
import VimeoCarousel from "Shared/ts/components/vimeo-carousel";

// adapters
import SlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/slide-carousel";
import ResponsiveSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/responsive-slide-carousel";
import FadeSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/fade-slide-carousel";
import VimeoSlideCarouselAdapter from "Shared/ts/api/carousel/slide/adapters/vimeo-slide-carousel";

// applications
import {
    importScrollableHeightByElement,
    initializeFlyoutsThenNav,
    initializeGlobalFlyoutRepository
} from "Shared/ts/applications/navigation";
import VimeoPlayerButton from "Shared/ts/components/vimeo-player-button";
import CaptureElement from "Shared/ts/utils/capture-element";
import ToolTip from "Shared/ts/components/tooltip";
import Player from "@vimeo/player";
import OrderFormReviewTable from "ts/utils/order-form-review-table";

initializeDocumentModalDialogsByContainers();
initializeDocumentModalDialogsByControllers();
initializeDocumentModalDialogsByTemplates();

initializeReviewTableUI();

initializeMikMakUI();
initializeBazaarVoiceUI();

initializeCartToast();

const vimeoManager = new VimeoManager();

const elementVimeoPlayerRepository: WeakMap<HTMLIFrameElement, Player> =
    new WeakMap<HTMLIFrameElement, Player>();

const initializeDelayRenderUI = (): void => {
    const candidates = Array.from(document.querySelectorAll(".delay-render"));

    candidates.forEach((candidate) =>
        candidate.classList.remove("delay-render")
    );
};

addEventListener("load", initializeDelayRenderUI);

const initializeAccordions = () => {
    const accordions = Array.from(document.querySelectorAll(".accordion"));

    accordions.forEach((accordion) => new Accordion(accordion));
};

initializeAccordions();

const initializeVimeoPostersByControllers = () => {
    observer('[data-modal-dialog-iframe^="https://player.vimeo.com/video/"]', {
        inRange: (placeholder) => {
            const url = placeholder.getAttribute(
                "data-modal-dialog-iframe"
            ) as string;

            const img = placeholder.getAttribute("data-src-img");
            if (!img) return;

            const id = vimeoManager.getIdByUrl(url);
            if (!id) return;

            const attributes = getJSONByElementAttribute<HTMLImageElement>(
                placeholder,
                "data-attr"
            );

            const min = 400;
            const width = attributes.width > min ? attributes.width : min;
            const height = attributes.height > min ? attributes.height : min;

            vimeoManager
                .generatePosterImage(id, {
                    width: width.toString(),
                    height: height.toString()
                    // quality: "100"
                })
                .then((posterImgUrl) => {
                    placeholder.setAttribute("data-src-img", posterImgUrl);
                })
                .finally(() => {
                    placeholder.classList.add("vimeo-player-button");

                    const playIconElement = createElement("span", {
                        class: "vimeo-player-button__play"
                    });

                    placeholder.insertAdjacentElement(
                        "afterbegin",
                        playIconElement
                    );

                    new LoadItem(placeholder).load(() =>
                        vimeoManager.createoEmbedById(id).then((response) => {
                            const metadata = JSON.parse(response.response);

                            placeholder.setAttribute(
                                "data-modal-dialog-title",
                                metadata.title
                            );

                            const img = placeholder.querySelector("img");

                            if (!img) return;

                            img.alt = metadata.title;
                        })
                    );
                });
        }
    });

    pubsub.subscribe("captureBody", (elements: Element[]) => {
        const modalDialogContainers = elements.filter((element) =>
            element.classList.contains("modal-dialog--video")
        );

        modalDialogContainers.forEach((modalDialogContainer) => {
            const iframe =
                modalDialogContainer.querySelector<HTMLIFrameElement>("iframe");
            if (!iframe) return;

            setElementAttributes(iframe, {
                allowfullscreen: "allowfullscreen",
                webkitallowfullscreen: "webkitallowfullscreen",
                allow: "fullscreen"
            });

            iframe.setAttribute("src", iframe.src);

            const player = vimeoManager.createPlayerByIframe(iframe);

            const captureContainer = new CaptureElement(modalDialogContainer);

            captureContainer.subscribe("attributes", (record) => {
                if (
                    record.attributeName === "hidden" &&
                    modalDialogContainer.hasAttribute("hidden")
                ) {
                    player.pause();
                }
            });
        });
    });
};

initializeVimeoPostersByControllers();

const modalDialogIframe = new ModalDialogIframe();
modalDialogIframe.initializeObserver();

// currently used on .slide--reviews if it needs to be split out from another slider
observer(".slide--carousel", {
    inRange: (element) => {
        const carousel = new Carousel(new SlideCarouselAdapter(element));

        carousel.enablePrevNextControls();
        carousel.enableThumbnailControls();
    }
});

observer(".slide--hero-banner", {
    inRange: (element) => {
        const carousel = new VimeoCarousel(
            new VimeoSlideCarouselAdapter(element)
        );

        carousel.enableThumbnailControls();
        carousel.autoplay();
        carousel.pause();
    }
});

observer(".element-controller", {
    inRange: (element) => {
        const elementController = new ElementController(element);

        elementController.controllers.forEach((controller) =>
            controller.addEventListener("click", (event) =>
                elementController.toggleElementsByController(controller)
            )
        );
    }
});

observer(".slide--instagram-content", {
    inRange: (element) => {
        const carousel = new ResponsiveCarousel(
            new ResponsiveSlideCarouselAdapter(element)
        );

        carousel.enablePrevNextControls();

        new MediaQuery("(min-width: 400px)")
            .inbound((task) => carousel.setAttributes({ steps: 2 }))
            .outbound((task) => carousel.setAttributes({ steps: 1 }));

        new MediaQuery("(min-width: 800px)")
            .inbound((task) => carousel.setAttributes({ steps: 3 }))
            .outbound((task) => carousel.setAttributes({ steps: 2 }));

        new MediaQuery("(min-width: 1200px)")
            .inbound((task) => carousel.setAttributes({ steps: 4 }))
            .outbound((task) => carousel.setAttributes({ steps: 3 }));

        new MediaQuery("(min-width: 1600px)")
            .inbound((task) => carousel.setAttributes({ steps: 5 }))
            .outbound((task) => carousel.setAttributes({ steps: 4 }));
    }
});

observer(".slide--category-products", {
    inRange: (element) => {
        const carousel = new ResponsiveCarousel(
            new ResponsiveSlideCarouselAdapter(element)
        );

        carousel.enablePrevNextControls();

        new MediaQuery("(min-width: 0px)").inbound((task) =>
            carousel.setAttributes({ steps: 1 })
        );

        new MediaQuery("(min-width: 500px)")
            .inbound((task) => carousel.setAttributes({ steps: 2 }))
            .outbound((task) => carousel.setAttributes({ steps: 1 }));

        new MediaQuery("(min-width: 760px)")
            .inbound((task) => carousel.setAttributes({ steps: 3 }))
            .outbound((task) => carousel.setAttributes({ steps: 2 }));

        new MediaQuery("(min-width: 1000px)")
            .inbound((task) => carousel.setAttributes({ steps: 4 }))
            .outbound((task) => carousel.setAttributes({ steps: 3 }));
    }
});

const pauseVimeoPlayersByElement = (
    element: Element | undefined | null
): void => {
    if (!element) return;

    const candidates = element.querySelectorAll<HTMLIFrameElement>(
        `iframe[src^="https://player.vimeo.com/video/"]`
    );
    if (!candidates) return;

    Array.from<HTMLIFrameElement>(candidates).forEach((candidate) => {
        const player = elementVimeoPlayerRepository.get(candidate);
        if (!player) return;

        player.pause();
    });
};

observer(".slide--tiktok-videos", {
    inRange: (element) => {
        const adapter = new ResponsiveSlideCarouselAdapter(element);
        const carousel = new ResponsiveCarousel(adapter);

        carousel.enablePrevNextControls();

        // new MediaQuery("(min-width: 400px)")
        //     .inbound((task) => carousel.setAttributes({ steps: 2 }))
        //     .outbound((task) => carousel.setAttributes({ steps: 1 }));

        new MediaQuery("(min-width: 800px)")
            .inbound((task) => carousel.setAttributes({ steps: 3 }))
            .outbound((task) => carousel.setAttributes({ steps: 2 }));

        new MediaQuery("(min-width: 1200px)")
            .inbound((task) => carousel.setAttributes({ steps: 4 }))
            .outbound((task) => carousel.setAttributes({ steps: 3 }));

        carousel.on("rotation", (currentIndex, prevIndex, nextIndex) => {
            pauseVimeoPlayersByElement(element);
        });
    }
});

observer(".slide--fade", {
    inRange: (element) => {
        const adapter = new FadeSlideCarouselAdapter(element);
        const carousel = new FadeCarousel(adapter);

        carousel.autoplay();
        carousel.enablePrevNextControls();

        const productListingRouterUrl = element.closest(
            "[data-product-listing-router-url]"
        );
        if (!productListingRouterUrl) return;

        initializeProductListingRouterUrlByFadeCarouselView(
            productListingRouterUrl,
            adapter,
            carousel
        );
    }
});

const initializeProductListingRouterUrlByFadeCarouselView = (
    productListingRouterUrl: Element,
    adapter: FadeSlideCarouselAdapter,
    carousel: FadeCarousel
): void => {
    const productListingRouter = productListingRouterUrl.querySelector(
        "[data-product-listing-router]"
    );
    if (!productListingRouter) return;

    carousel.on("rotation", (currentIndex) => {
        if (currentIndex === undefined) return;

        const currentSlide = adapter.children?.item(currentIndex);

        const productListingUrl = currentSlide?.getAttribute(
            "data-product-listing-url"
        );
        if (!productListingUrl) return;

        productListingRouter.setAttribute("href", productListingUrl);
    });
};

observer("[data-src-iframe]", {
    inRange: (record) =>
        new LoadItem(record, { tag: "iframe", src: "data-src-iframe" }).load(
            (iframe) => {
                const player = vimeoManager.createPlayerByIframe(
                    iframe as HTMLIFrameElement
                );

                elementVimeoPlayerRepository.set(
                    iframe as HTMLIFrameElement,
                    player
                );
            }
        )
});

initalizeDocumentModalDialogsByDOMMutation();
initializeGlobalHTMLTemplateRenderingEngine();

const initializeDynamicScrollPaddingOffset = () => {
    const header = document.querySelector("header");
    if (!header) return;

    importScrollableHeightByElement(header);
};

initializeDynamicScrollPaddingOffset();

const flyoutRepo = initializeGlobalFlyoutRepository();

const initializeNavWithFlyoutSupport = () => {
    const nav = document.querySelector<HTMLElement>("#nav");
    if (!nav) return;

    initializeFlyoutsThenNav(".flyout", nav.id);
    initializeFlyoutUI();

    const containers = Array.from<HTMLElement>(nav.querySelectorAll(".flyout"));

    const hoverableContainers = containers.filter((flyout) =>
        flyout.hasAttribute("data-flyout-allow-hover")
    );

    let usingNavDrawerUI = false;

    new MediaQuery("(max-width: 75rem)")
        .inbound((task) => {
            hoverableContainers.forEach((container) =>
                container.removeAttribute("data-flyout-allow-hover")
            );

            usingNavDrawerUI = true;
        })
        .outbound((task) => {
            hoverableContainers.forEach((container) =>
                container.setAttribute("data-flyout-allow-hover", "true")
            );

            usingNavDrawerUI = false;
        });

    const searchContainer = containers.find(
        (container) => container.id === "search-form"
    );
    if (!searchContainer) return;

    const searchFlyout = flyoutRepo.get(searchContainer);
    if (!searchFlyout) return;

    addEventListener("click", (event) => {
        const target = event.target as HTMLElement;
        const meetsCondition =
            target.closest("#search-form") === searchContainer &&
            !searchContainer.classList.contains("flyout--is-hidden");

        if (meetsCondition) return;

        searchFlyout.off();
    });

    const searchController = searchContainer.querySelector(".flyout__button");
    if (!searchController) return;

    const captureSearchController = new CaptureElement(searchController);
    captureSearchController.subscribe("attributes", (record) => {
        if (record.attributeName !== "aria-expanded") return;
        if (usingNavDrawerUI) return;

        switch (searchController.getAttribute("aria-expanded")) {
            case "true":
                hoverableContainers.forEach((container) =>
                    container.removeAttribute("data-flyout-allow-hover")
                );
                break;
            case "false":
                hoverableContainers.forEach((container) =>
                    container.setAttribute("data-flyout-allow-hover", "true")
                );
                break;
        }
    });
};

initializeNavWithFlyoutSupport();

new KlaviyoSignUpForm();

const vimeoPlayerButton = new VimeoPlayerButton();
vimeoPlayerButton.initializeOnCapture();

new ToolTip(document.querySelectorAll(".link"), "link--is-active");

const initializeReviewTableProductImages = () => {
    const reviewTable =
        document.querySelector<HTMLTableElement>("#orderReview");
    if (!reviewTable) return;

    const ofrt = new OrderFormReviewTable(reviewTable);

    ofrt.addProductListingImages();
};

initializeReviewTableProductImages();
