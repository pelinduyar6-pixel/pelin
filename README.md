# Reflex Haber — Düzeltilmiş paketler

Orijinal pakette kurulum sonrası oluşan HTTP 500 hatası yerelde yeniden üretildi ve düzeltildi. Tarayıcı kurulumu ve migration/seeder yolunda 11 işlev testi geçti. Gerçek hosting sunucusuna dağıtım yapılmadı.

- [Tam proje ZIP (28 MB)](downloads/reflex-haber-duzeltilmis-demo6.zip)
- [Mevcut proje için düzeltme ZIP (48 KB)](downloads/reflex-haber-duzeltme-dosyalari.zip)
- [Tam ZIP SHA-256](downloads/reflex-haber-duzeltilmis-demo6.sha256)

Dosya sayfasında **Download raw file** düğmesini kullanın. Arşivler gerçek `.env`, gizli anahtar, test veritabanı veya çalışma önbelleği içermez.

PHP 8.3+ gerekir. Mevcut `.env` ve yüklenen resimleri koruyun; dosyaları proje köküne uyguladıktan sonra `/kurulum.php` üzerinden onarımı çalıştırın. Başarılı onarımın ardından `kurulum.php` ve `public/kurulum.php` dosyalarını silin. Ayrıntılı kurulum ve test notları ZIP içindeki `README.md` dosyasındadır.

Ana sayfaya haber kartları, manşet geçişleri ve mobil menü eklendi. Demo 6 referansı erişim engeli nedeniyle görüntülenemediği için birebir görsel karşılaştırma yapılmadı.
