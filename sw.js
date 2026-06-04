/* サービスワーカー：オフラインでも開けるようにアプリ一式をキャッシュする。
   方式：ネットワーク優先（オンライン時は必ず最新を取得、取れたらキャッシュ更新。
   オフライン時のみキャッシュを使う）。これにより更新が即反映される。 */
const CACHE = 'eiken5-v3';
const ASSETS = ['./','./index.html','./words.js','./exam.js','./manifest.json','./icon.svg'];

self.addEventListener('install', e=>{
  e.waitUntil(caches.open(CACHE).then(c=>c.addAll(ASSETS)).then(()=>self.skipWaiting()));
});
self.addEventListener('activate', e=>{
  e.waitUntil(caches.keys().then(keys=>Promise.all(
    keys.filter(k=>k!==CACHE).map(k=>caches.delete(k))   // 古いキャッシュを削除
  )).then(()=>self.clients.claim()));
});
self.addEventListener('fetch', e=>{
  if(e.request.method!=='GET') return;
  e.respondWith(
    fetch(e.request).then(res=>{
      // 取得成功 → キャッシュを最新に更新してから返す
      const copy = res.clone();
      caches.open(CACHE).then(c=>c.put(e.request, copy)).catch(()=>{});
      return res;
    }).catch(()=> caches.match(e.request))  // オフライン時はキャッシュから
  );
});
