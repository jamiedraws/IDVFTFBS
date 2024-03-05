(function (global) {
    const backupFeed = [
        {
            image: "/images/instafeed/ig-1.jpg"
        },
        {
            image: "/images/instafeed/ig-2.jpg"
        },
        {
            image: "/images/instafeed/ig-3.jpg"
        },
        {
            image: "/images/instafeed/ig-4.jpg"
        },
        {
            image: "/images/instafeed/ig-5.jpg"
        },
        {
            image: "/images/instafeed/ig-6.jpg"
        },
        {
            image: "/images/instafeed/ig-7.jpg"
        }
    ];

    const createBackupInstafeed = function () {
        const target = document.getElementById(instafeed._options.target);
        const images = instafeed._renderData(backupFeed);
        target.innerHTML = images;
    };

    const instafeed = new Instafeed({
        accessToken: "",
        template:
            '<span class="instafeed__placeholder"><img class="instafeed__img" src="{{image}}" /></span>',
        limit: 10,
        error: createBackupInstafeed
    });

    const instantToken = Object.create({
        setEndpoint: function (credentials) {
            let endpoint =
                "https://ig.instant-tokens.com/users/{user-id}/instagram/{instagram-id}/token?userSecret={user-secret}";

            endpoint = endpoint.replace("{user-id}", credentials.userId);
            endpoint = endpoint.replace(
                "{instagram-id}",
                credentials.instagramId
            );
            endpoint = endpoint.replace(
                "{user-secret}",
                credentials.userSecret
            );

            return endpoint;
        },
        requestAccess: function (credentials) {
            const xhr = new XMLHttpRequest();
            xhr.addEventListener("load", function () {
                if (xhr.status === 200) {
                    const data = JSON.parse(xhr.response);
                    credentials.success(data.Token);
                } else {
                    credentials.error(xhr);
                }
            });
            xhr.addEventListener("error", credentials.error);
            xhr.open("GET", instantToken.setEndpoint(credentials));
            xhr.send();
        }
    });

    instantToken.requestAccess({
        userId: "aa697096-1f32-4328-84fc-fd9f3b2d38a6",
        instagramId: "17841400468264028",
        userSecret: "qhxugr0g73zp4uzxwm2n",
        success: function (accessToken) {
            instafeed._options.accessToken = accessToken;
            instafeed.run();
        },
        error: createBackupInstafeed
    });
})(window);
