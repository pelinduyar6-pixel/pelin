# Nginx erişim ve yönlendirme ayarları

PHP-FPM 8.1+ gerekir. Örnekler ana dizin kurulumudur. Alt klasörde kuruyorsanız `/haber-yeni/` ön ekini ekleyin ve son try_files hedefini `/haber-yeni/index.php?$query_string` yapın.

Bu engelleme blokları genel PHP-FPM bloğundan **önce** yer almalı. Mevcut hosting PHP-FPM socket/upstream ayarlarını koruyun.

```nginx
index index.php;

location ~ ^/(app|views|storage|tests|database)(/|$) { deny all; }
location ~ (^|/)\.(?!well-known(?:/|$)) { deny all; }
location ~* ^/uploads/.*\.(php[0-9]*|phtml|phar|cgi|pl|sh)$ { deny all; }
location = /README.md { deny all; }
location = /NGINX.md { deny all; }

location / {
    try_files $uri $uri/ /index.php?$query_string;
}

# Büyük video yüklemek istiyorsanız ilgili server/location bloğunda:
client_max_body_size 128m;
```

PHP'de ayrıca `upload_max_filesize=100M`, `post_max_size=128M` gerekebilir. Nginx sınırı PHP sınırını kendiliğinden değiştirmez.

URL'ler `index.php?route=...` olarak çalışır; `robots.txt` ve temiz adresler için try_files kuralı gerekir. Alt klasöre kurulan sitenin robot kurallarını alan adının kökündeki robots.txt dosyasına da ekleyin. `cron.php` HTTP üzerinden gizli token ister; CLI cron tercih edilebilir.

`/storage/`, `/storage/integrations.php`, `/app/`, `/views/`, `/tests/`, `/database/` ve gizli dosyaların doğrudan istekleri 403/404 dönmeli. Nginx Apache .htaccess dosyalarını okumaz. HTTPS sertifikasını hostingde etkinleştirin; kurulumdaki site adresini HTTPS olarak girin.
