import { renderTemplate } from "Shared/ts/utils/html";

declare global {
    interface Window {
        HTMLTemplateRenderingEngine: HTMLTemplateRenderingEngine;
    }
}

export default class HTMLTemplateRenderingEngine {
    /**
     * Represents an element that can take an encoded HTML string and decode it.
     */
    private static textarea: HTMLTextAreaElement =
        document.createElement("textarea");

    /**
     * Represents an element that can take a document fragment and convert it into an HTML string.
     */
    private static div: HTMLDivElement = document.createElement("div");

    /**
     * Provides the ability to process HTML templates along with tokens using an object of data where each key represents the token name, expressed in double-curly braces. For example, `{{Key}}` in the HTML template will match with the data object `{ Key: "" }`.
     */
    constructor() {}

    /**
     * Takes an HTML element to create a new document fragment, then performs a token-matching operation using the provided data. The fragment undergoes a string encoding-to-decoding conversion and string to fragment conversion. The fragment is returned.
     * @param template HTMLElement | null
     * @param data Record<string, string>
     * @returns DocumentFragment | undefined
     */
    public renderViewByTemplate(
        template: HTMLElement | null,
        data: Record<string, string>
    ): DocumentFragment | undefined {
        if (!template) return;

        const html = template.innerHTML;
        let fragment = renderTemplate(html);

        const treeWalker = document.createTreeWalker(
            fragment,
            NodeFilter.SHOW_TEXT,
            null,
            false
        );
        let currentNode = treeWalker.nextNode();

        while (currentNode) {
            const textContentReference = currentNode.textContent?.trim() ?? "";
            const matches = textContentReference?.matchAll(/{{(\w*)}}/g);

            let textContentGenerator = textContentReference;

            for (const match of matches) {
                const token = match[0];
                const key = match[1];
                const value = data[key];

                const tag = `<span data-template-key="${key}">${value}</span>`;

                textContentGenerator = textContentGenerator?.replace(
                    token,
                    tag
                );
            }

            currentNode.textContent = textContentGenerator;

            currentNode = treeWalker.nextNode();
        }

        return HTMLTemplateRenderingEngine.processFragmentWithEncodedHTML(
            fragment
        );
    }

    /**
     * Takes a document fragment and performs an encoding-to-decoding conversion and returns a new document fragment.
     * @param fragment DocumentFragment
     * @returns DocumentFragment
     */
    private static processFragmentWithEncodedHTML(
        fragment: DocumentFragment
    ): DocumentFragment {
        const encodedHTMLString =
            HTMLTemplateRenderingEngine.convertFragmentToEncodedString(
                fragment
            );

        const decodedHTMLString =
            HTMLTemplateRenderingEngine.decodeHTMLString(encodedHTMLString);

        return renderTemplate(decodedHTMLString);
    }

    /**
     * Takes a document fragment and converts it into an HTML string. The encoded HTML string is returned.
     * @param fragment DocumentFragment
     * @returns string
     */
    private static convertFragmentToEncodedString(
        fragment: DocumentFragment
    ): string {
        this.div.appendChild(fragment);

        return this.div.innerHTML;
    }

    /**
     * Takes an encoded HTML string and decodes it into an HTML string. The decoded HTML string is returned.
     * @param encodedString string
     * @returns string
     */
    private static decodeHTMLString(encodedString: string): string {
        this.textarea.innerHTML = encodedString;

        return this.textarea.value;
    }

    /**
     * Takes either an HTML element or a document fragment, pulls all elements matching the `data-template-key` attribute and updates each elements contents with the provided data. The same element is returned.
     * @param element HTMLElement | DocumentFragment
     * @param data Record<string, string>
     * @returns HTMLElement | DocumentFragment
     */
    private static mapAttributeKeysToDataKeys<
        T extends HTMLElement | DocumentFragment
    >(element: T, data: Record<string, string>): T {
        const elements = Array.from(
            element.querySelectorAll("[data-template-key]")
        );

        elements.forEach((element) => {
            const key = element.getAttribute("data-template-key");
            if (!key) return;

            const value = data[key];
            if (!value || value === "") return;

            element.innerHTML = value;
        });

        return element;
    }

    /**
     * Takes a document fragment and updates the contents using the provided data. The same fragment is returned; otherwise undefined is returned given the document fragment isn't available.
     * @param fragment DocumentFragment | null
     * @param data Record<string, string>
     * @returns DocumentFragment | undefined
     */
    public renderViewByFragment(
        fragment: DocumentFragment | null,
        data: Record<string, string>
    ): DocumentFragment | undefined {
        if (!fragment) return;

        return HTMLTemplateRenderingEngine.mapAttributeKeysToDataKeys(
            fragment,
            data
        );
    }

    /**
     * Takes an HTML element and updates the contents using the provided data. The same element is returned; otherwise undefined is returned given the element isn't available.
     * @param element HTMLElement | null
     * @param data Record<string, string>
     * @returns HTMLElement | undefined
     */
    public renderViewByElement(
        element: HTMLElement | null,
        data: Record<string, string>
    ): HTMLElement | undefined {
        if (!element) return;

        return HTMLTemplateRenderingEngine.mapAttributeKeysToDataKeys(
            element,
            data
        );
    }
}

/**
 * Creates a new instance of the HTMLTemplateRenderingEngine object and assigns it to the window object. The same object is returned.
 * @returns HTMLTemplateRenderingEngine
 */
export const initializeGlobalHTMLTemplateRenderingEngine =
    (): HTMLTemplateRenderingEngine => {
        const htmlTemplateRenderingEngine = new HTMLTemplateRenderingEngine();

        window.HTMLTemplateRenderingEngine = htmlTemplateRenderingEngine;

        return htmlTemplateRenderingEngine;
    };
