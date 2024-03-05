import CaptureElement from "Shared/ts/utils/capture-element";

export default class OrderFormReviewTable {
    private table: HTMLTableElement;

    private captureTable: CaptureElement;

    private static rows: WeakMap<HTMLTableRowElement, string> = new WeakMap<
        HTMLTableRowElement,
        string
    >();

    constructor(table: HTMLTableElement) {
        this.table = table;
        this.captureTable = new CaptureElement(this.table);
    }

    private mapHTMLTableRowElementWithProductCode(
        row: HTMLTableRowElement
    ): void {
        const cell = row.querySelector(`[data-cart-code$="Quantity"]`);
        if (!cell) return;

        const productCode = cell
            .getAttribute("data-cart-code")
            ?.replace("Quantity", "")
            .trim();
        if (!productCode) return;

        OrderFormReviewTable.rows.set(row, productCode);
    }

    private addProductListingImage(row: HTMLTableRowElement): void {
        if (!OrderFormReviewTable.rows.has(row)) return;

        const productCode = OrderFormReviewTable.rows.get(row);
        if (!productCode) return;

        const cell = row.querySelector(`[data-cart-code$="Quantity"]`);
        if (!cell) return;

        this.getProductImageByProductCode(productCode).then((html) => {
            const container = document.createElement("td");
            container.innerHTML = html;

            cell.insertAdjacentElement("beforebegin", container);
        });
    }

    public addProductListingImages() {
        this.captureTable.subscribe("childList", (record) => {
            const rows = Array.from(record.addedNodes).filter(
                (node) => node.nodeName.toLowerCase() === "tr"
            ) as HTMLTableRowElement[];
            if (!rows) return;

            rows.forEach((row) => {
                this.mapHTMLTableRowElementWithProductCode(row);
                this.addProductListingImage(row);
            });
        });
    }

    private getProductImageByProductCode(productCode: string): Promise<string> {
        return new Promise<string>((resolve, reject) => {
            fetch(
                `/Services/GetProductImageByProductCode.ashx?productCode=${productCode}&imagePath=images/UPGRADE/products/`
            )
                .then((response) => response.text())
                .then((html) => resolve(html))
                .catch((error) =>
                    reject(`There was an issue capturing the html`)
                );
        });
    }
}
