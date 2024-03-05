// observers
import { observer } from "Shared/ts/observers/intersection";

// api
import InstagramMediaInstantTokenAdapter from "Shared/ts/api/instagram/instagram-media-instant-token-adapter";

const instagramMedia = new InstagramMediaInstantTokenAdapter({
    instagramId: "17841401713633020",
    userId: "aa697096-1f32-4328-84fc-fd9f3b2d38a6",
    userSecret: "rktfgzihuvlzax7o48b9h"
});

const createInstagramGallery = (gallery: Element | null): void => {
    if (!gallery) return;

    instagramMedia.requestImages().then((media) => {
        Array.from(gallery.querySelectorAll("img[src]")).forEach(
            (picture, index): void => {
                const post = media[index];
                picture.setAttribute("src", post.media_url);

                const image = picture.querySelector("img");

                if (!image) return;
                image.alt = post.caption;
            }
        );
    });
};

createInstagramGallery(document.querySelector(".slide--instagram"));
