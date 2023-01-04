'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "0bdfe74ad421f4269eb08e8a19108fb7",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"manifest.json": "9e34ce9b81c2ff05e22ea83c7f0a21c6",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"assets/AssetManifest.json": "7eb61be2767d18a61dd62c1563810e21",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "63442a529701cf4f3555b89e215e0d14",
"assets/packages/animated_snack_bar/assets/regular/exclamation-triangle.svg": "57a895d149648e4b69c7681d4efb2052",
"assets/packages/animated_snack_bar/assets/regular/info-circle.svg": "e733e8ecda8758e6b69d20cc1ca1c6c4",
"assets/packages/animated_snack_bar/assets/regular/exclamation-circle.svg": "69c777fe5b9ffd2f8286ca47f98d1a31",
"assets/packages/animated_snack_bar/assets/regular/check-circle.svg": "0936541fbbf9ebf325169373c2d2439a",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-triangle.svg": "10427de487dc532646c4a11f6be3fe84",
"assets/packages/animated_snack_bar/assets/monochrome/comment-dots.svg": "44311bf381ea1155bfe38c40d44c577a",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-octagon.svg": "ab5fb6de2478b95f911cebb5cf6af9c3",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-circle.svg": "63ffc503c8e024f9752866e021afb744",
"assets/packages/animated_snack_bar/assets/monochrome/check-circle.svg": "f6d9dd67711da5b6d4d965f66c10cd07",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "9ca1daa5a4c66f55b50208d8999ef9cd",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "ba1adf5b0dd583aa210095fa2789d0f8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "dbf0a93d2b23d99b7af4b1a6ab94e122",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "bc1064116116b2cb6daea292062da90c",
"assets/assets/images/jointconnector.png": "9e6187abf6018e518c59d01db77f0492",
"assets/assets/images/Logo.png": "08a75139217bad072c5c4c68c86203f4",
"assets/assets/images/logo1.png": "00becbb9a7cb97d6b18946f8005867c2",
"assets/assets/images/irLogo.png": "e76287ca5fe5087c4cdedcc551c90ccd",
"assets/assets/images/wire.jpg": "bc219e1f6465fdadd053e64f762f63b7",
"assets/assets/images/ProfileLogo.png": "bdf98dfb2085c49c8f9c0e938c462604",
"assets/assets/images/CADVizor_MFG.png": "1b71e259c4e0d157e2cb7111ca058bc9",
"assets/assets/images/prdt-idx01.png": "ae6662bf8ee7cee92aa1fdc3bd1f1602",
"assets/assets/images/terminal.jpg": "ae30027662af892eb8976900a68120b8",
"assets/assets/images/subreport.png": "aba59d34f8980a1013a11448584eb88d",
"assets/assets/images/librarary.png": "2588b79b86aae4cb625f8b5977e643c9",
"assets/assets/images/etcparts.png": "981e87aa644ceab0b2e217556104841c",
"assets/assets/images/pdficon.png": "ad688b38b0c11e4cba1b6bcd49c9d24f",
"assets/assets/images/CADvizor_Logic.png": "7959aaa6499d80e5c32ff10ac620c7d1",
"assets/assets/images/User.jpg": "604878074a3fae3f935637c5d95ea97c",
"assets/assets/images/vehicle-wiring-harness-market.jpg": "31032994f4e6d0a30848a2bc1fbc4111",
"assets/assets/images/terminal.png": "508459133faee31fe873e11f5a7afe75",
"assets/assets/images/seal.jpg": "5ec236644cbf4907cd3aebf1aea78c90",
"assets/assets/images/MainLogo.png": "8443917eb9055e54be2f9a6ade4761a3",
"assets/assets/images/loginback_white.png": "f13d3ba7df6f16623198cd6c8bfa55e8",
"assets/assets/images/mastercard.png": "0d7605e7ea9fad890b30215a72490860",
"assets/assets/images/bom.png": "6cce4c9b5fe1b0817b2d834abbdd4563",
"assets/assets/images/device.png": "13f2fab0632f3ab6c30b2ea069891a0b",
"assets/assets/images/blueprint.png": "55a1c4ac374642e20c227e801a8ac1c7",
"assets/assets/images/payment.png": "ce25a8bff9db591fadf8b84c5b5da4b8",
"assets/assets/images/sub3.png": "0f9541e727217e339b674d798ce57723",
"assets/assets/images/favicon.png": "ff02bdcc7eda9404459f3596d247fac8",
"assets/assets/images/loginback.png": "a9aa35d5e61e33db51d39ea7abf30643",
"assets/NOTICES": "41209417f2c81762b5869247e9ee3058",
"index.html": "f0e57c903bdc7658d292f74e0fa5a36d",
"/": "f0e57c903bdc7658d292f74e0fa5a36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "7caa85bc768f43590d085e55a8279374"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
