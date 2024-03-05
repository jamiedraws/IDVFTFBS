(function (global) {
    if ("app" in global) {
        app.require(["observer", "lazy"], function () {
            app.observer.watch({
                selector: "[data-src-img]",
                inRange: function (loadItem) {
                    app.lazy(loadItem);
                }
            });

            app.observer.watch({
                selector: ".excerpt",
                inRange: function (loadItem) {
                    loadItem.classList.add("excerpt--is-in-view");
                }
            });
        });
    }
})(window);
