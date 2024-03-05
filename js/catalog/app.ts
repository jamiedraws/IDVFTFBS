// components
import Nav from "Shared/ts/components/nav";
import Accordion from "Shared/ts/components/accordion";

// utils
import LoadItem from "Shared/ts/utils/load-item";
import { elementExists, enumerateElements } from "shared/ts/utils/html";


// observers
import { observer } from "shared/ts/observers/intersection";

const nav = new Nav("nav");

observer("[data-src-img]", {
    inRange: (record) => new LoadItem(record)
});

observer("[data-src-iframe]", {
    inRange: (record) =>
        new LoadItem(record, { tag: "iframe", src: "data-src-iframe" })
});

const accordion = document.querySelector(".accordion");

if (elementExists(accordion)) {
    new Accordion(accordion);
}