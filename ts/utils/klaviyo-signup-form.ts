export default class KlaviyoSignUpForm {
    public controllers: Element[] = [];

    constructor() {
        this.captureControllerElements();
    }

    public hasKlaviyo(): boolean {
        return "_klOnsite" in window;
    }

    public captureControllerElements(): void {
        this.controllers = Array.from(
            document.querySelectorAll("[data-klaviyo-form-id]")
        );

        this.controllers.forEach((controller) =>
            controller.addEventListener("click", () => {
                const id = controller.getAttribute("data-klaviyo-form-id");
                if (!id || !this.hasKlaviyo()) return;

                window._klOnsite.push(["openForm", id]);
            })
        );
    }
}
