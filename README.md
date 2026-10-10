# Reflex Haber Pro 3.4.1 · 8 Tema

Pro 3.4.1, güncel sürüm işaretine rağmen eksik yardımcı tablo veya güncelleme sütunu nedeniyle panelin hata vermesini düzeltir. Ekrandaki hata kodu güvenli sunucu kaydıyla eşleşir. Canlı sitedeki kesin hata nedeni henüz doğrulanmadı.

PHP 8.1+ haber sitesi ve Türkçe yönetim merkezi. MySQL/MariaDB veya SQLite; Composer/Node derlemesi gerekmez.

- **[Mevcut Pro 3.0–3.4.0 için güncelleme ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-4-1-tam-guncelleme.zip)**
- **[Yeni cPanel için SQL içeren tam kurulum ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-4-1-cpanel-sql.zip)**
- [Ayrı kurulum SQL ZIP](downloads/reflex-haber-sql.zip) · [SQL dosyası](downloads/reflex-haber-pro.sql)

[Güncelleme adımları](GUNCELLEME-3-4-1.md) · [Yeni cPanel kurulumu](CPANEL-KURULUM-3-4-1.md) · [Doğrulama](DOGRULAMA-3-4-1.md) · [SHA-256](downloads/reflex-haber-pro-3-4-1-tam-guncelleme.sha256)

Tema 1–4 korunur. **Tema 5: Medyabar**, **Tema 6: İmza Gazetesi**, **Tema 7: Kulga**, **Tema 8: EsenHaber Demo 3** panelden seçilebilir. Her tema aynı haber, kategori, reklam ve sosyal medya ayarlarını kullanır. Yeni düzenlerin masaüstü ve mobil ekranları [önizlemeler](previews/reflex-v340) içindedir.

Tema 8 referansı incelendi; diğer üç referans geliştirme ortamının ağ engeli nedeniyle görüntülenemedi. Tema 5–7 işlevsel ilk düzenlerdir; bu sitelerle görsel eşleşme henüz doğrulanmadı. Kaynak sitelerin logosu veya yazılımı kopyalanmadı.

## Korunan araçlar

Türkiye Gündemi ana kategori seçimi, değişken kategori düzenleri, Teknoloji/Magazin blokları, ana sayfa kategori/sıralama yönetimi, sekiz tema ve özelleştirilebilir reklam alanları; haber listesinde toplu seçim, filtreler, kaynak, konum, yayın, görüntülenme, SEO ve sosyal paylaşım menüsü; düzenli editör adımları ve SEO araçları.

**Canlı Veri Merkezi**, anonim gerçek ziyaretçi dağılımı, **BİK kod alanı**, kullanıcının URL/kategori/saat seçtiği bot kaynakları ve cron, piyasa ve lig veri entegrasyonları korunur. OpenAI Sol/Terra/Luna seçenekleri ve özel model ID alanı vardır; gerçek model erişimi kullanıcı API hesabında test edilmelidir.

## Kurulum / güncelleme

Yeni site: tam ZIP’i yeni web köküne açın. İsterseniz `database/reflex-haber-pro.sql` dosyasını boş phpMyAdmin veritabanına aktarın, ardından `/kurulum.php` ile kendi yönetici hesabınızı oluşturun. SQL 25 tablo tanımı içerir; haber/veri veya kullanıcı parolası içermez.

Mevcut site: tam güncelleme ZIP’ini mevcut köke açın; **SQL’i tekrar içe aktarmayın veya kurulum başlatmayın**. Mevcut `.env`, `storage`, hesaplar, kategori ilişkileri, API anahtarları ve uploads korunur. Panelde **Sistem Kontrolü → 3.4.1 → Güncelleme dosyaları eksiksiz** kontrolünü yapın. Eski 104 KB güncelleme paketini kullanmayın.

Eski site arşivi: yeni kurulumdan sonra **Veri Taşıma** ekranına veri içeren SQL ve ayrı uploads klasörünü yükleyin, alan/kategorileri eşleştirin, önizleyip taslak aktarın. Boş eski kategori ID’si korunur; çakışmada mevcut kategori ezilmez. Eski hesaplar/parolalar taşınmaz.

## Doğrulama ve sınırlar

2 MB PHP yükleme/POST sınırı, 64 MB bellek ve 10 saniye istek süresiyle 32 MB’tan büyük SQL, tek INSERT içinde 160.005 kayıt, 64 MB’tan büyük ZIP ve 5.002 görsel doğrulandı. Tarayıcıda klasör seçmeden SQL+ZIP, 3 MB klasör görseli, ilerleme, hata ve devam çalıştı. Sekiz tema 320–1440 px genişlikte kontrol edildi. Ayrıntılar [DOGRULAMA-3-3-4.md](DOGRULAMA-3-3-4.md).

Canlı hosting’e yükleme veya gerçek Meta/X hesabına gönderim yapılmadı. Canlı sağlayıcılar, OpenAI modelleri ve abonelikli ajanslar için hosting üzerinde hesap/plan erişimi doğrulanmalıdır; SSRF veya TLS denetimleri kapatılmaz. [Nginx ayarları](NGINX.md).
