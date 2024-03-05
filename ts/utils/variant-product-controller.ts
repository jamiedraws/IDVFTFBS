import { observer } from "Shared/ts/observers/intersection";

export default class VariantProductController {
    /**
     * Represents the container for the radio group elements, price elements, image elements and name elements
     */
    public root: Element;

    /**
     * Represents a colletion of radio group input elements
     */
    public controllers: HTMLInputElement[];

    /**
     * Represents a repository between a route and it's HTML document, representing a product detail page
     */
    private static productDetailPageRepository: Map<string, Document> = new Map<
        string,
        Document
    >();

    /**
     * Represents a collection of elements that intends to group multiple elements
     */
    private groups: Element[];

    /**
     * Represents a collection of anchor elements where the current route will be assigned to
     */
    private routers: Element[];

    /**
     * Captures HTML elements that represent a campaign product's name, picture and price along with a radio group that represent a campaign product's variant products. Upon activation of the radio group, a GET request will be dispatched over the network to retrieve a new campaign product where the view can be updated with campaign product data.
     * @param root Element
     */
    constructor(root: Element) {
        this.root = root;

        this.controllers = Array.from(
            this.root.querySelectorAll(`[data-variant-product-controller]`)
        );

        this.groups = Array.from(
            this.root.querySelectorAll(`[data-variant-product-group]`)
        );

        this.routers = Array.from(
            this.root.querySelectorAll(`a[data-variant-product-router]`)
        );

        VariantProductController.initializeViewByPermalink(this);
        VariantProductController.initializeControllers(this);
    }

    /**
     * Takes the permalink as the route and initializes the view by that route.
     * @param context VariantProductController
     * @returns void
     */
    private static initializeViewByPermalink(
        context: VariantProductController
    ): void {
        const route = context.root.getAttribute(
            "data-variant-product-permalink"
        );
        if (!route) return;

        this.captureDocumentByRoute(context, route).then(() => {
            this.updateViewByRoute(context, route);

            context.root.setAttribute("data-variant-product-state", "ready");
        });
    }

    /**
     * Assigns a click event handler to each radio input element where a request is dispatched to capture a new campaign product and then update the view with the campaign product data
     * @param context VariantProductController
     */
    private static initializeControllers(
        context: VariantProductController
    ): void {
        observer(`[data-variant-product-controller]`, {
            inRange: (targetController) => {
                const hasTargetController = context.controllers.some(
                    (controller) => controller === targetController
                );

                if (!hasTargetController) return;

                const route = targetController.getAttribute(
                    "data-variant-product-route"
                );
                if (route === null) return;

                targetController.setAttribute("disabled", "disabled");

                this.captureDocumentByRoute(context, route).then(() => {
                    targetController.removeAttribute("disabled");
                });

                targetController.addEventListener("click", (event: Event) => {
                    this.updateViewByRoute(context, route);
                });
            }
        });
    }

    /**
     * Attempts to capture the product detail page document by it's route given it isn't already available in the repository
     * @param context VariantProductController
     * @param route string
     */
    private static captureDocumentByRoute(
        context: VariantProductController,
        route: string
    ): Promise<Document> {
        return new Promise<Document>((resolve, reject) => {
            const document =
                VariantProductController.productDetailPageRepository.get(route);

            switch (true) {
                case document === undefined:
                    context
                        .requestProductDetailPageByRoute(route)
                        .then((document) => {
                            this.processGroupAttributes(
                                route,
                                document,
                                context
                            );

                            resolve(document);
                        })
                        .catch(() => reject());

                    break;
                case document instanceof Document:
                    this.processGroupAttributes(
                        route,
                        document as Document,
                        context
                    );

                    resolve(document as Document);

                    break;
                default:
                    reject();

                    break;
            }
        });
    }

    /**
     * Attempts to process the product detail page by the document provided by the given route.
     * @param context VariantProductController
     * @param route string
     * @returns void
     */
    private static updateViewByRoute(
        context: VariantProductController,
        route: string
    ): void {
        const document =
            VariantProductController.productDetailPageRepository.get(route);
        if (document !== undefined) {
            this.processProductDetailPage(context, document, route);

            return;
        }

        context
            .requestProductDetailPageByRoute(route)
            .then((document) =>
                this.processProductDetailPage(context, document, route)
            );
    }

    /**
     * Updates the current product detail page using similar node references from the captured product detail page document
     * @param context VariantProductController
     * @param document Document
     * @param route string
     */
    private static processProductDetailPage(
        context: VariantProductController,
        document: Document,
        route: string
    ): void {
        const types = Array.from(
            document.querySelectorAll(
                `[data-variant-product-permalink="${route}"] [data-variant-product-type]`
            )
        );

        types.forEach((type) => {
            let references = Array.from(
                context.root.querySelectorAll(
                    `[data-variant-product-type="${type.getAttribute(
                        "data-variant-product-type"
                    )}"]`
                )
            );

            if (context.groups.length > 0) {
                references = references.filter((reference) =>
                    context.groups.find(
                        (group) =>
                            group.getAttribute("data-variant-product-group") !==
                            reference.getAttribute("data-variant-product-type")
                    )
                );
            }

            references.forEach(
                (reference) => (reference.innerHTML = type.innerHTML)
            );
        });

        context.groups.forEach((group) => {
            const references = Array.from(
                document.querySelectorAll(
                    `[data-variant-product-permalink="${route}"] [data-variant-product-type="${group.getAttribute(
                        "data-variant-product-group"
                    )}"]`
                )
            );

            references.forEach((reference) => {
                const siblings = Array.from(
                    group.querySelectorAll(
                        `[data-variant-product-type="${group.getAttribute(
                            "data-variant-product-group"
                        )}"]`
                    )
                );

                siblings.forEach((sibling) =>
                    sibling.setAttribute(
                        "aria-hidden",
                        sibling.innerHTML === reference.innerHTML
                            ? "false"
                            : "true"
                    )
                );
            });
        });

        context.routers.forEach((router) => router.setAttribute("href", route));
    }

    /**
     * Collects all `data-variant-product-group` attribute elements and populates all elements where the `data-variant-product-type` value matches the `data-variant-product-group` value.
     * @param route string
     * @param document Document
     * @param context VariantProductController
     */
    private static processGroupAttributes(
        route: string,
        document: Document,
        context: VariantProductController
    ): void {
        context.groups.forEach((group) => {
            const types = Array.from(
                context.root.querySelectorAll(
                    `[data-variant-product-type="${group.getAttribute(
                        "data-variant-product-group"
                    )}"]`
                )
            );

            const references = Array.from(
                document.querySelectorAll(
                    `[data-variant-product-permalink="${route}"] [data-variant-product-type="${group.getAttribute(
                        "data-variant-product-group"
                    )}"]`
                )
            );

            references.forEach((reference) => {
                const alreadyHasType = types.find(
                    (type) => type.innerHTML === reference.innerHTML
                );

                if (!alreadyHasType) {
                    reference.setAttribute("aria-hidden", "true");

                    group.insertAdjacentHTML("beforeend", reference.outerHTML);
                }
            });
        });
    }

    /**
     * Makes a GET request to the product detail page route to capture the document. The document contents are then stored into the repository for repeat accessibility.
     * @param route string
     * @returns Promise<Document>
     */
    public requestProductDetailPageByRoute(route: string): Promise<Document> {
        return new Promise<Document>((resolve, reject) => {
            const xhr = new XMLHttpRequest();

            const parser = new DOMParser();

            xhr.addEventListener("load", (response: ProgressEvent) => {
                try {
                    const document = parser.parseFromString(
                        xhr.response,
                        "text/html"
                    );

                    VariantProductController.productDetailPageRepository.set(
                        route,
                        document
                    );

                    resolve(document);
                } catch (e) {}
            });

            xhr.open("GET", route);

            xhr.send();
        });
    }
}
