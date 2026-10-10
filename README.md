# Reflex Haber Pro 3.3.2 · 4 Tema

PHP 8.1+ haber sitesi ve Türkçe yayın yönetim merkezi. MySQL/MariaDB veya SQLite; Composer, Laravel ve Node kurulumu gerekmez.

**[Pro 3.0 / 3.1 / 3.2 / 3.3 için tek adımda tam güncelleme ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-3-2-tam-guncelleme.zip)**

**[Yeni kurulum için tam paket ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-4-tema.zip)**

[3.3.2 yükleme adımları](GUNCELLEME-3-3-2.md) · [Doğrulama sonuçları](DOGRULAMA-3-3-2.md) · [Veri taşıma](VERI-TASIMA.md) · [Kurulum](KURULUM.md) · [Nginx](NGINX.md) · [SHA-256](downloads/reflex-haber-pro-3-3-2-tam-guncelleme.sha256)

**104 KB’lık eski Pro 3.0→3.1 ZIP’i güncel değildir.** Güncel paket tüm gerekli uygulama, CSS ve JavaScript dosyalarını birlikte içerir. Güncellemeden sonra panelde **Sistem Kontrolü** ekranından eksik/karışık dosyaları görebilirsiniz.

Yeni kurulum için [SQL ZIP](downloads/reflex-haber-sql.zip), [SQL dosyası](downloads/reflex-haber-pro.sql) ve [phpMyAdmin adımları](SQL-KURULUM.md). **Çalışan siteyi güncellerken SQL’i yeniden içe aktarmayın.**

## 3.3.2 düzeltmesi ve korunan araçlar

- Dört temanın 3.2 ana sayfa ve footer görünümü geri alındı; son tema yeniden tasarımı kaldırıldı. Marka renkleri panelden seçilir. Kategori manşetinin beyaz bant ve başlık/numara çakışması düzeltmeleri korunur. Haber listesinde Önceki / 1 / 2 / 3 / Sonraki ayrı düğmelerle gösterilir.
- **Türkiye Gündemi** ana manşet ve haber alanıdır. Eski Gündem kategori ID’si ve `gundem` URL’si korunur. **Ana Sayfa & Kategoriler** ekranından ana kategori, alt bölümler, sıraları ve görünümleri seçilir. Ana sayfa ve haber içinde gerçek görüntülenme sayılarına göre **En çok okunanlar** sağ sütunu; içeriksiz video/galeri bölümleri gizlenir.
- **Paylaş** menüsü: Facebook, X, WhatsApp, Telegram, LinkedIn, Pinterest, Reddit, e-posta, bağlantı kopyala. Menü tablo sınırlarında kesilmez, klavyeyle kullanılabilir. Haber listesi başlıkları ve sayfa düğmeleri okunaklıdır.
- **Haber Botları**: kullanıcının URL’si, hedef kategori/yazar, aralık veya günlük Türkiye saati; genel ayarlar, kaynak tablosu, son/sonraki çalışma ve cron komutu. Otomatik kaynak/ajans importu hosting cron’uyla çalışır. Elle çalıştırma ayrı düğmedir.
- Ortak **GPT-5.6 Sol / Terra / Luna** seçimi ve özel API model kimliği alanı. SEO, haber/makale, bot ve bağlantı testi aynı modeli kullanır. Model erişimi gerçek API hesabında test edilmelidir; başarı etiketi yalnızca başarılı bağlantı testinden sonra gösterilir. Erişilemeyen model yerine sessizce başka model kullanılmaz.
- Haber detayı: görselli son haberler, ilgili haberler ve en çok okunanlar. **Reklam Alanları**: metin içi reklam ve haber sağ sütunu üst/orta/alt; cihaz/zaman/öncelik ayarları. Atanmamış reklam boş kutu bırakmaz.
- **Veri Taşıma**: ilk ekranda SQL, görsel ZIP ve doğrudan uploads / resim klasörü seçimi vardır. SQL ve görseller ayrı yüklenebilir; klasörler küçük gruplarla gönderilir. Alt yollar korunur, tablo/alan/kategori ID eşleştirmesi ve haber önizlemesi sunulur. Boş kategori ID’leri korunur; çakışmalarda mevcut kategoriler ezilmez. Haberler 100 kayıtlık, devam edebilen adımlarla **taslak** aktarılır. Aynı SQL’in tekrar işlenmesi haberleri çoğaltmaz. Eski hesaplar/parolalar ve çoklu kategori ilişki tabloları bu aktarımın kapsamı dışındadır; [desteklenen biçimler](VERI-TASIMA.md).

[Türkiye Gündemi](previews/pro/turkiye-gundemi.png) · [Paylaş menüsü](previews/pro/paylas-menu.png) · [Bot merkezi](previews/pro/bot-merkezi.png) · [Haber detayı](previews/pro/haber-detay.png) · [Kategori manşeti](previews/pro/kategori-slider.png) · [SQL / ZIP / klasör yükleme](previews/pro/veri-tasima-yukleme.png) · [Taşıma önizlemesi](previews/pro/veri-tasima-onizleme.png) · [Düzeltilen sayfalama](previews/pro/haber-sayfalama.png) · [Sistem Kontrolü](previews/pro/sistem-kontrolu.png)

![Tema 1](previews/pro/tema-1.png)

## Dört tema, tek içerik

| Tema | Üst yerleşim | Otomatik kategori düzeni | Önizleme |
|---|---|---|---|
| 1 | Ana manşet ve sağ haber sütunu | Büyük haber + dört kart | [Tema 1](previews/pro/tema-1.png) |
| 2 | Merkez manşet ve yan haberler | İki büyük + dört küçük | [Tema 2](previews/pro/tema-2.png) |
| 3 | Kırmızı menü ve geniş manşet | Asimetrik mozaik | [Tema 3](previews/pro/tema-3.png) |
| 4 | Vitrin banner ve haber şeridi | Kompakt haber akışı | [Tema 4](previews/pro/tema-4.png) |

Temalar panelden değişir; haberler ve hesaplar korunur. Önizlemelerdeki haberler, fiyatlar ve puanlar yerel test/demonstrasyon verileridir; pakete güncel veri olarak sabitlenmez.

## Korunan yayın araçları

Yazarların altında ince piyasalar bandı; Sözcü fiyat bandı/NTV BIST, TCMB/CoinGecko, özel JSON ve elle giriş. Anahtarsız NTV Spor Süper Lig; API-Football ve elle giriş. Son başarılı veriler bağlantı kesintisinde korunur. Yazarlar tek kaydırılabilir satırda; manşet 3 saniye varsayılan aralıkla geçer, azaltılmış hareket tercihi desteklenir.

TRT/NTV/CNN Türk/Sözcü kaynak seçmeli Türkiye Gündem Merkezi; özel RSS/Atom veya haber/kategori URL botları; ANKA/DHA/İHA/İGFA/AA abonelik RSS/JSON alanları. Ajansların özel bağlantı belgeleri ve abonelik bilgileri gerekir; sağlayıcıya özel giriş/SOAP protokolleri ayrıca uyarlanır.

Haber/makale yönetimi, filtreli toplu seçim ve yayına alma/taslak/silme; MP4/WebM/PDF yükleme, video embed, medya kütüphanesi, canlı SEO skoru ve boş SEO alanlarının tamamlanması. Reklam editörü, Google Merkezi, sitemap/Google News/RSS, editör performansı, iletişim formundan gelen kutusu, modüller ve logo/servis/sosyal/footer ayarları bulunur.

## Kurulum ve doğrulama

Yeni klasöre tam ZIP’i açın; `/kurulum.php` ile kendi veritabanı ve yönetici hesabınızı oluşturun. Panel `/panel.php` adresindedir. Çalışan Pro 3.2 için küçük güncelleme ZIP’i; daha eski PHP sürümünde tam paketin uygulama dosyaları kullanılır. **`.env`, `storage`, `uploads` korunur; çalışan site yeniden kurulmaz.** Eski Laravel paketinin üzerine açmayın.

Kaynak, piyasa, lig ve OpenAI bağlantılarını panelde test edin; gizli anahtarları yalnızca özel panel alanlarına girin. Hosting cron görevini 5 dakikada bir kurun. SQL/görsel taşıma önce test ortamında denenmelidir. Storage HTTP erişimine kapalı, PHP Phar uzantısı görsel ZIP işlemi için açık olmalıdır.

SQLite/MySQL üzerinde URL/saat ayarları, ortak model, reklam yerleşimleri, gerçek SQL/görsel ZIP ve doğrudan klasör aktarımı, taslaklar, kategori ID ilişkileri ve izin/CSRF kontrolleri geçti. Dört tema ve yönetim ekranları 320–1440 pikselde; paylaşım/clipboard, manşet, yazar kaydırma ve taşıma önizlemesi doğrulandı. Gerçek 3.2 → 3.3 delta testi **56 haber, 7 hesap/parola hash’i, kategori ID/URL’leri, özel ayarlar, anahtar dosyaları, .env ve PDF’yi korudu**. Yeni kurulum ve 22 tablolu şema doğrulandı.

Önceki doğrulamada resmi dört haber RSS’i, Sözcü fiyatları ve NTV lig/BIST verileri ayrıştırıldı. Bulut PHP DNS pinleme kontrolünde dış alan adları çözülemedi; koruma kapatılmadı. Hosting bağlantıları ayrıca test edilmelidir. Gerçek OpenAI model erişimi/ücretli ajans çağrısı ve canlı hosting dağıtımı yapılmadı. Önceki ZIP’ler downloads klasöründe korunur; eski yamaları 3.3.1 dosyalarının üzerine uygulamayın.
