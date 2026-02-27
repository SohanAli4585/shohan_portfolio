'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7d263b7881ee8950a07fd865b7ce312e",
"assets/AssetManifest.bin.json": "3c844da5f7f58a6c07191412ecf90835",
"assets/assets/chat/eight.jpg": "82897948f5c11856d067ba8c232c6ff4",
"assets/assets/chat/five.jpg": "4d4765bf95313d465ef80fb801ce03d1",
"assets/assets/chat/four.jpg": "f5ede0bd79e484f0630f5c3b45f31918",
"assets/assets/chat/one.jpg": "a13c72151e6951182f36ae787712b913",
"assets/assets/chat/siven.jpg": "c8d19b2eb65ccdcaf833f8a9884bb3e2",
"assets/assets/chat/six.jpg": "d51bace665525c232d12fa78baaf7e47",
"assets/assets/chat/thare.jpg": "075dd4cef8ecf671d4f85f4bdd79ec5a",
"assets/assets/chat/tow.jpg": "10bc7f016d3d72116458fd05f0fca201",
"assets/assets/ecomas/1.png": "2544904bee9787ffb87ed0b6de9f2c58",
"assets/assets/ecomas/10.png": "eac966d60d0af0c34abf925a2fb25228",
"assets/assets/ecomas/11.png": "c99b0a2b5ef48d67e848765165dfe389",
"assets/assets/ecomas/2.png": "9e1eaf68cd58e83c71c66ac302c57df8",
"assets/assets/ecomas/3.png": "8906122d1bfb5c252054bf24d5401e9c",
"assets/assets/ecomas/4.png": "7a549dea5a40b4f04564853453dde830",
"assets/assets/ecomas/5.png": "e49cafe59a2b55bd91d3f224ed2c69ba",
"assets/assets/ecomas/6.png": "c0d18e1c7be47ba9d3fbd6d7e2e66ff4",
"assets/assets/ecomas/7.png": "de58608f1749a9fff984cfebf34ffb70",
"assets/assets/ecomas/8.png": "8c707454b73679dfd4d6f98fcc38de8d",
"assets/assets/ecomas/9.png": "a01fe0c88e335aefccfc1b9f6a4bdb08",
"assets/assets/images/loading.gif": "0833ebdeb30e191e3d649fe564f941ee",
"assets/assets/images/my_cv.pdf": "b587e5ccda7d14c3541e9635a5ddf47c",
"assets/assets/images/new.png": "be180304a24779b17a64be786fdf2863",
"assets/assets/images/restapi.png": "891399f67692d884806eddb47a68f5b5",
"assets/assets/images/sohandev.png": "7853c25b522f99b6260b3b3d43eed53a",
"assets/assets/images/video.png": "979d0d4e8446185414807b8c70c165b0",
"assets/assets/images/vscode.png": "3919e5b2f737f142a45921320e666382",
"assets/assets/images/weather.png": "072c0de397a0602a972e0999addf88ba",
"assets/assets/news/newsa.jpg": "a2277c03fd526fba8ca9664fd544cb4f",
"assets/assets/news/newsb.jpg": "3457d6c9de8f0f66c5561bb24703a7a9",
"assets/assets/news/newsc.jpg": "663d95fe20ce06c8fba12d7f4a1533fa",
"assets/assets/news/newsg.jpg": "10957f4ebbbb17af93a44c8dfe657d48",
"assets/assets/news/newss.jpg": "b1b1b986fd788fdaa75d4005a996f16a",
"assets/assets/weather/weatherapp.jpg": "5e420f9f6aaa9de417d71969753e39d3",
"assets/assets/weather/weatherserch.jpg": "1cc2af975fba9a4bfa8a1796f248618f",
"assets/assets/weather/weatherseting.jpg": "4fff7ff0d077be54634bd2cf08b31327",
"assets/assets/wlak/wlakg.jpg": "fb3068294f938b9fec07da03faab94c9",
"assets/assets/wlak/wlakm.jpg": "53f6d1f9f7fdd890a6cbe52b58d3a705",
"assets/assets/wlak/wlakn.jpg": "3dba27b08ef335ffa59d7d6d1a695166",
"assets/assets/wlak/wlakp.jpg": "39c6cc9d65c0b5c7d55316e7069ee66a",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/fonts/MaterialIcons-Regular.otf": "c73e3e06bc80cd8850d8b110ee3fdb5f",
"assets/NOTICES": "8452dfcca9aec42bf3bb2e978fc68527",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "61764d13302a5a581fe29d66e18d292f",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "134095a577ffc7c8f6bbca486916f12f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9cc67e5242e2d8c2836b0ac6dd73a8d3",
"/": "9cc67e5242e2d8c2836b0ac6dd73a8d3",
"main.dart.js": "5f6970cf7116e4605b7e266ed97bdbf2",
"manifest.json": "7b6312f8965d7b68e60972674de97456",
"my_cv.pdf": "c506ec96331ca7a02e7110e974d10a5f",
"version.json": "c31b6f9a5f3c61a3ef27ef4145e65cf8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
