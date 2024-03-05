export interface IKlaviyoOnsiteUI {
    _loaded: boolean;
    push: (event: [method: string, id: string]) => void;
    openForm: () => void;
}

declare global {
    interface Window {
        _klOnsite: IKlaviyoOnsiteUI;
    }
}
