// components
import Toast from "Shared/ts/components/toast";

declare global {
    interface Window {
        cartToast: Toast;
    }
}

const toast = new Toast("cart-response");

export const initializeCartToast = (): void => {
    window.cartToast = toast;
};
