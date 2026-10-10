# Reflex Haber Pro 3.3.4 · 4 Tema

PHP 8.1+ haber sitesi ve Türkçe yönetim merkezi. MySQL/MariaDB veya SQLite; Composer/Node derlemesi gerekmez.

- **[Mevcut Pro 3.0–3.3.3 için tam güncelleme ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-3-4-tam-guncelleme.zip)**
- **[Yeni cPanel için SQL içeren tam kurulum ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-3-4-cpanel-sql.zip)**
- [Ayrı kurulum SQL ZIP](downloads/reflex-haber-sql.zip) · [SQL dosyası](downloads/reflex-haber-pro.sql)

[3.3.4 güncelleme adımları](GUNCELLEME-3-3-4.md) · [Yeni cPanel kurulumu](CPANEL-KURULUM-3-3-4.md) · [Doğrulama](DOGRULAMA-3-3-4.md) · [Veri taşıma](VERI-TASIMA.md) · [Sosyal medya](SOSYAL-MEDYA.md) · [SHA-256](downloads/reflex-haber-pro-3-3-4-tam-guncelleme.sha256)

## Bu güncelleme

SQL+ZIP seçiliyken yüklemenin başlamaması giderildi. SQL, ZIP ve klasör görselleri sunucu sınırının altında parçalar hâlinde yüklenir; yüzde/boyut ve kesinti sonrası devam gösterilir. Eski toplam dosya/kayıt/görsel sayısı sınırları kaldırıldı. Büyük SQL analizi ve ZIP / ZIP64 çıkarımı aşamalar hâlinde yapılır. Sunucu disk kotası ve çalışma kaynakları geçerlidir.

Footer yazıları ve haber içi sağ sütun başlıkları büyütüldü, blok aralıkları düzenlendi. Boş sosyal bant ve tekrarlanan ikinci manşet kaldırıldı. Son Dakika bandı ana sayfanın ana manşet bölümünde bir kez görünür; başlık ve numaralara dikey bant bindirilmez. Dört temada kategori menüsü satıra yayılır.

**Sosyal Medya Merkezi** footer profil menüsünü ve Meta/Facebook Sayfası ile X otomatik paylaşımını yönetir. Kuyruk cron ile gönderir; metin/bağlantı önizlemesi, platform ID’si ve hata kaydı sunar. Aynı haber/platform tekrar gönderilmez; belirsiz gönderimler otomatik tekrar denenmez. Gerçek hesap anahtarları, izinleri ve API planları kullanıcı tarafından panelde ayarlanır.

## Korunan araçlar

Türkiye Gündemi ana kategori seçimi, değişken kategori düzenleri, Teknoloji/Magazin blokları, ana sayfa kategori/sıralama yönetimi, dört tema ve özelleştirilebilir reklam alanları; haber listesinde toplu seçim, filtreler, kaynak, konum, yayın, görüntülenme, SEO ve sosyal paylaşım menüsü; düzenli editör adımları ve SEO araçları.

**Canlı Veri Merkezi**, anonim gerçek ziyaretçi dağılımı, **BİK kod alanı**, kullanıcının URL/kategori/saat seçtiği bot kaynakları ve cron, piyasa ve lig veri entegrasyonları korunur. OpenAI Sol/Terra/Luna seçenekleri ve özel model ID alanı vardır; gerçek model erişimi kullanıcı API hesabında test edilmelidir.

## Kurulum / güncelleme

Yeni site: tam ZIP’i yeni web köküne açın. İsterseniz `database/reflex-haber-pro.sql` dosyasını boş phpMyAdmin veritabanına aktarın, ardından `/kurulum.php` ile kendi yönetici hesabınızı oluşturun. SQL 25 tablo tanımı içerir; haber/veri veya kullanıcı parolası içermez.

Mevcut site: tam güncelleme ZIP’ini mevcut köke açın; **SQL’i tekrar içe aktarmayın veya kurulum başlatmayın**. Mevcut `.env`, `storage`, hesaplar, kategori ilişkileri, API anahtarları ve uploads korunur. Panelde **Sistem Kontrolü → 3.3.4 → Güncelleme dosyaları eksiksiz** kontrolünü yapın. Eski 104 KB güncelleme paketini kullanmayın.

Eski site arşivi: yeni kurulumdan sonra **Veri Taşıma** ekranına veri içeren SQL ve ayrı uploads klasörünü yükleyin, alan/kategorileri eşleştirin, önizleyip taslak aktarın. Boş eski kategori ID’si korunur; çakışmada mevcut kategori ezilmez. Eski hesaplar/parolalar taşınmaz.

## Doğrulama ve sınırlar

2 MB PHP yükleme/POST sınırı, 64 MB bellek ve 10 saniye istek süresiyle 32 MB’tan büyük SQL, tek INSERT içinde 160.005 kayıt, 64 MB’tan büyük ZIP ve 5.002 görsel doğrulandı. Tarayıcıda klasör seçmeden SQL+ZIP, 3 MB klasör görseli, ilerleme, hata ve devam çalıştı. Dört tema 320–1440 px genişlikte kontrol edildi. Ayrıntılar [DOGRULAMA-3-3-4.md](DOGRULAMA-3-3-4.md).

Canlı hosting’e yükleme veya gerçek Meta/X hesabına gönderim yapılmadı. Canlı sağlayıcılar, OpenAI modelleri ve abonelikli ajanslar için hosting üzerinde hesap/plan erişimi doğrulanmalıdır; SSRF veya TLS denetimleri kapatılmaz. [Nginx ayarları](NGINX.md).
