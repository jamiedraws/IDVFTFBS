import {
    initializeDocumentModalDialogsByTemplates,
    initalizeDocumentModalDialogsByDOMMutation
} from "Shared/ts/applications/modal-dialog";

import { initializeGlobalHTMLTemplateRenderingEngine } from "ts/api/html-template-rendering-engine";

initializeDocumentModalDialogsByTemplates();
initalizeDocumentModalDialogsByDOMMutation();
initializeGlobalHTMLTemplateRenderingEngine();
