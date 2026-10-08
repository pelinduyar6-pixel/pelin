# Nginx kurulumu

PHP-FPM sürümü 8.1+ olmalı. Aşağıdaki örnek ana dizin kurulumudur. Alt klasörde kurulum yapılıyorsa yolların önüne o klasörü ekleyin; örneğin `/haber-yeni/(app|views|storage|tests)`.

Bu koruma blokları genel PHP-FPM çalıştırma bloğundan **önce** tanımlanmalıdır. Mevcut PHP-FPM socket/upstream ayarlarınız korunur.

```nginx
index index.php;

location ~ ^/(app|views|storage|tests)(/|$) {
    deny all;
}

location ~ (^|/)\.(?!well-known(?:/|$)) {
    deny all;
}

location ~* ^/uploads/.*\.(php[0-9]*|phtml|phar|cgi|pl|sh)$ {
    deny all;
}

location = /README.md { deny all; }
location = /NGINX.md { deny all; }

location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```

Panel ve haber bağlantıları `index.php?route=...` biçiminde çalışır. Nginx'in Apache `.htaccess` dosyalarını okumadığını dikkate alarak `storage` klasörünü doğrudan erişime açmayın.
