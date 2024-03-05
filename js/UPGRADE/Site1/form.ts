// api
import ExpressCheckout from "Shared/ts/api/express-checkout/express-checkout";
import ValidateCommon from "Shared/ts/api/validate/validate-common";

// applications
import {
    initializeValidateCommonWithBraintree,
    initializeValidateEvent,
    initializeValidateEventWithPromoCode,
    validatePromoCode
} from "Shared/ts/applications/form";
import StatusScreen from "Shared/ts/components/status-screen";

// observers
import { observer } from "Shared/ts/observers/intersection";

// utils
import ValidateEvent from "Shared/ts/utils/validate-event";

const validateCommonWhenAvailable = async (): Promise<ValidateCommon> => {
    const form = document.querySelector<HTMLFormElement>(
        "[data-validate-common-form]"
    );
    if (!form) {
        throw {
            message: `HTMLElement containing the attribute [data-validate-common-form] could not be found.`
        };
    }

    const validateCommon = initializeValidateCommonWithBraintree(form);

    if (!validateCommon) {
        throw {
            message: `Reference to the instance of ValidateCommon is undefined.`,
            form
        };
    }

    return validateCommon;
};

validateCommonWhenAvailable().then((validateCommon) => {
    if (!validateCommon.form) return;

    const statusScreen = new StatusScreen("checkout-form", validateCommon.form);
    statusScreen.update("Initializing payment options");

    let closeConnection = false;
    let timeout: NodeJS.Timeout;

    const initializeTimeout = (time: number) =>
        setTimeout(() => {
            closeConnection = true;

            clearTimeout(timeout);

            statusScreen.update("Ready for use");
        }, time);

    addEventListener("load", (event) => initializeTimeout(0));
});

const validateInputRules = (control: HTMLInputElement) => {
    const isValid = control.validity.valid;
    if (!isValid) return false;

    const isEmpty = control.value === "";
    if (isEmpty) return false;

    const pattern = control.getAttribute("data-pattern");

    if (pattern) {
        const regex = new RegExp(pattern);
        const hasValidPattern = regex.test(control.value);

        return hasValidPattern;
    }

    return true;
};

const validateComboboxRules = (control: HTMLSelectElement) => {
    return control.validity.valid;
};

const initializeValidateSearchForm = () => {
    const form = document.querySelector<HTMLFormElement>(
        'form[action^="/Search"]'
    );
    if (!form) return;

    const submit = form.querySelector<HTMLButtonElement>(
        'button[type="submit"]'
    );
    if (!submit) return;

    const validateSearchForm = new ValidateEvent({
        form,
        submit,
        invalidInputEvents: ["keyup", "blur", "change"]
    });

    validateSearchForm.submit?.addEventListener("click", (event) =>
        validateSearchForm.validateAll()
    );

    validateSearchForm.processInputEvents();

    validateSearchForm.submit?.addEventListener("click", (event) =>
        validateSearchForm.validateAll()
    );

    const text = validateSearchForm.inputs.find((input) => input.id === "text");
    if (!text) return;

    const textS = validateSearchForm.inputs.find(
        (input) => input.id === "textS"
    );
    if (!textS) return;

    textS.addEventListener("keyup", (event) => (text.value = textS.value));

    validateSearchForm.submit?.addEventListener(
        "submit",
        (event) => text.value.replace(/^\s+|\s+$/, "").length !== 0
    );
};

initializeValidateSearchForm();

observer("[data-validate-form]", {
    inRange: (element) => {
        const validateMessage = new ValidateEvent({
            form: element as HTMLFormElement,
            submit: element.querySelector(
                `[data-validate-form-type="submit"]`
            ) as HTMLButtonElement,
            attribute: "data-required",
            inputEvents: ["blur", "change"],
            invalidInputEvents: ["keyup", "blur", "change"],
            comboboxEvents: ["change", "blur"]
        });

        validateMessage.validateInputEvent = (event: Event) => {
            validateMessage.validateControl(
                event.target as HTMLInputElement,
                validateInputRules
            );
        };

        validateMessage.validateComboboxEvent = (event: Event) => {
            validateMessage.validateControl(
                event.target as HTMLSelectElement,
                validateComboboxRules
            );
        };

        validateMessage.submit?.addEventListener("click", (event: Event) => {
            validateMessage.validateInputs(validateInputRules);
            validateMessage.validateComboboxes(validateComboboxRules);
        });

        validateMessage.processInputEvents();
        validateMessage.processComboboxEvents();
    }
});

addEventListener("ECDrawFormComplete", (event) => {
    const checkout: HTMLElement | null = document.querySelector(
        "[data-validate-common-form]"
    );
    if (!checkout) return;

    new ExpressCheckout(checkout);
});

const validatePromoCodeAroundStatusScreen = (): void => {
    const form = document.querySelector<HTMLFormElement>(
        "[data-validate-promo-code]"
    );
    if (!form) return;

    const statusContainer = document.querySelector<HTMLElement>(
        "#promo-code-validation-status"
    );
    if (!statusContainer) return;

    const statusScreen = new StatusScreen("inline", statusContainer);
    let wasValidated = false;
    let capturePromoCode: string | undefined;

    const validateEvent = initializeValidateEvent(
        form,
        form.querySelector('button[type="button"]') as HTMLButtonElement
    );

    const input = validateEvent.inputs.find(
        (input) => input.id === "promoCode"
    );

    input?.addEventListener("keyup", (event) => {
        if (wasValidated) {
            wasValidated = false;
            statusScreen.close();
        }

        capturePromoCode && input.value === capturePromoCode
            ? statusScreen.open()
            : statusScreen.close();
    });

    validateEvent.submit?.addEventListener("click", (event) => {
        validateEvent.validateInputs(validateInputRules);

        if (validateEvent.isValidForm()) {
            statusScreen.busy("Checking...");
        }
    });

    validatePromoCode()
        .pass((promoCode) => {
            statusScreen.done(`Code ${promoCode} was successfully redeemed.`);
        })
        .fail((error) => {
            statusScreen.problem(error);
        })
        .finally(() => {
            capturePromoCode = input?.value;
            wasValidated = true;
        });
};

validatePromoCodeAroundStatusScreen();
