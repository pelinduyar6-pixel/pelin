# Reflex Haber Pro 3.2 · 4 Tema

PHP 8.1+ haber sitesi ve Türkçe yayın yönetim merkezi. MySQL/MariaDB; küçük kurulumlar için SQLite. Composer veya Node kurulumu gerekmez.

**[Tam paket ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-4-tema.zip)** · **[Pro 3.1 → 3.2 güncelleme ZIP](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-pro-3-2-guncelleme.zip)**

[3.2 yükleme ve panel kullanım adımları](GUNCELLEME-3-2.md) · [Kurulum](KURULUM.md) · [Nginx](NGINX.md) · [SHA-256](downloads/reflex-haber-pro-4-tema.sha256)

Yeni kurulum için [SQL ZIP](downloads/reflex-haber-sql.zip) · [SQL dosyası](downloads/reflex-haber-pro.sql) · [phpMyAdmin adımları](SQL-KURULUM.md). **Çalışan siteyi güncellerken SQL’i yeniden içe aktarmayın.**

## 3.2 değişiklikleri

- Piyasalar dört temada yazarların hemen altındadır. Sözcü dolar/euro/gram altın/Bitcoin (USDT) fiyatları ve NTV BIST 100 otomatik kaynakları; TCMB/CoinGecko, özel JSON ve elle giriş seçenekleri.
- Anahtarsız NTV Spor Süper Lig tablosu; API-Football ve elle giriş seçenekleri. Piyasalar 10, lig 15 dakika varsayılan aralıkla yenilenir; bağlantı kesilirse son başarılı veri ve alım zamanı korunur.
- **Ana Sayfa & Kategoriler:** hangi kategoriler gösterilsin, sırası ve görünümü. Dört temada otomatik kategori düzeni değişir; magazin ve teknoloji özel vitrinlere sahiptir. Menü ve kategori arşivleri korunur.
- Magazin: iki büyük görsel + dört küçük kart, beyaz başlık alanları ve burç şeridi. Teknoloji: koyu vitrin ve görsel üzerine başlıklar. Haberi olmayan kategoriler boş kartlarla doldurulmaz.
- Manşet üzerindeki dikey Son Dakika şeridi kaldırıldı; bağımsız kayan üst bant ve 3 saniyelik otomatik geçiş korunur.
- Haber yönetiminde ID/kapak/kaynak/konum/okunma/tarih/durum/SEO; filtre, seçim, tüm filtre sonuçlarına işlem, toplu yayına alma/taslak/silme. Silme açık onay ister; yönetici hesabı korunur.
- Haber/makale editöründe bölüm bağlantıları, yayın sütunu ve kaydetme çubuğu. Reklam yönetiminde kampanya özeti, yerleşim haritası, görsel önizleme, özel kod ve yayın ayarları.
- Footer’da gündem/ekonomi/spor haberleri, siyah sosyal bant, logo ve kategori/servis/hakkımızda sütunları. Ayrı footer logosu ve gerçek uygulama mağazası bağlantıları panelden düzenlenir.

[Magazin](previews/pro/magazin.png) · [Teknoloji](previews/pro/teknoloji.png) · [Kategori ayarları](previews/pro/ana-sayfa-kategoriler.png) · [Haber editörü](previews/pro/editor.png) · [Reklam yönetimi](previews/pro/reklam-editor.png) · [Footer](previews/pro/footer-1.png)

![Haber yönetimi](previews/pro/panel.png)

## Dört tema, tek içerik

| Tema | Üst yerleşim | Otomatik kategori düzeni | Önizleme |
|---|---|---|---|
| 1 | Ana manşet ve sağ haber sütunu | Büyük haber + dört kart | [Tema 1](previews/pro/tema-1.png) |
| 2 | Merkez manşet ve yan haberler | İki büyük + dört küçük | [Tema 2](previews/pro/tema-2.png) |
| 3 | Kırmızı menü ve geniş manşet | Asimetrik mozaik | [Tema 3](previews/pro/tema-3.png) |
| 4 | Vitrin banner ve haber şeridi | Kompakt haber akışı | [Tema 4](previews/pro/tema-4.png) |

Temalar panelden değişir; haberler ve hesaplar korunur. Önizlemelerdeki fiyat/puanlar yerel test verileridir, pakete sabit güncel veri olarak eklenmez. Örnek haber ve görseller tasarım gösterimidir; yayında kendi lisanslı içeriklerinizi kullanın.

## Yayın araçları

Merkezi OpenAI anahtarıyla AI haber/makale oluşturma ve önizlemeli SEO; TRT/NTV/CNN Türk/Sözcü kaynak seçmeli Türkiye Gündem Merkezi; özel RSS/Atom veya haber/kategori URL botları; ANKA/DHA/İHA/İGFA/AA abonelik RSS/JSON bağlantı alanları bulunur. Ajansların özel bağlantı belgeleri ve abonelik bilgileri gerekir; sağlayıcıya özel giriş/SOAP protokolleri ayrıca uyarlanır.

Makale ve köşe yazarları, foto/video galeri, MP4/WebM/PDF yükleme, doğrulanmış video embed, canlı SEO skoru/boş alanları tamamlama, okuyucu tepkileri ve yorumlar desteklenir. Google Merkezi, sitemap/Google News/RSS, editör performansı, iletişim formundan gelen kutusu, içerik modülleri, 21 reklam konumu ve özel kod alanları vardır. Haberler taslak/yayın/planlı yayın olarak yönetilir.

## Kurulum ve güncelleme

Yeni klasöre tam ZIP’i açın; `/kurulum.php` ile kendi veritabanı ve yönetici hesabınızı oluşturun. Panel `/panel.php` adresindedir. Mevcut Pro 3.1 için küçük güncelleme ZIP’ini, daha eski PHP sürümünde tam paketin uygulama dosyalarını kullanın. **`.env`, `storage` ve `uploads` dosyalarını koruyun; çalışan siteyi yeniden kurmayın.** Eski Laravel paketinin üzerine açmayın.

Piyasalar ve Lig ekranlarında otomatik kaynağı seçin, kaydedin ve şimdi güncelle düğmesiyle hosting bağlantısını kontrol edin. Ana sayfa açıkken arka planda yenilenir. Ziyaretçi yokken de güncelleme ve zamanlı bot işleri için hosting cron görevini 5 dakikada bir çalıştırın. API anahtarları yalnızca panelin özel alanlarına girilir; ZIP’te varsayılan yönetici şifresi veya gerçek bağlantı bilgisi yoktur.

## Doğrulama

Gerçek Sözcü fiyat bandı, NTV BIST 100 ve 18 takımlı NTV Süper Lig yanıtı okunup ayrıştırıldı. Dört haber kaynağının resmi RSS akışlarından 20’şer kayıt okundu. Kaynaklar gecikmeli veri yayımlayabilir. PHP’nin DNS pinleme kontrolü bulut makinesinde dış alan adlarını çözemedi; koruma kapatılmadı, uygulama bağlantıları hostingde test edilmelidir.

SQLite/MySQL üzerinde kategori ayarları, toplu işlemler, CSRF/yetki, medya/SEO ve kurulum kontrolleri geçti. Dört tema ve yönetim ekranları 320–1440 pikselde; yazar kaydırma, manşet geçişi, kategori seçimi/sırası, silmeyi iptal etme ve footer doğrulandı. Gerçek Pro 3.1 → 3.2 delta testi 56 haber, 7 hesap/parola hash’i, özel ayarlar, anahtar dosyası, `.env` ve PDF’yi korudu. Şema 22 tablodur. Canlı hostinginize dağıtım ve gerçek OpenAI/ücretli ajans çağrısı yapılmadı.

Önceki paketler downloads klasöründe korunur. Eski küçük kurulum/3.0/3.1 yamalarını yeni 3.2 dosyalarının üzerine açmayın.
