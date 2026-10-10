# Pro 3.3.3 doğrulaması · 10 Ekim 2026

Yerel ve ayrı test kurulumlarında PHP 8.4.24, SQLite, MariaDB 11.8 ve Chromium kullanıldı. Üretim veritabanına bağlanılmadı, canlı hosting dosyaları değiştirilmedi.

## Tam kurulum ve gerçek sürüm güncellemesi

- Yeni cPanel ZIP’inin içindeki SQL boş MariaDB veritabanına aktarıldı: **24 tablo, sıfır hesap ve özel kayıt**. Ardından web kurulumu, yönetici girişi, haber yayınlama/düzenleme, görsel yükleme, yorum onayı, zamanlanmış yayın ve yetki kontrolleriyle 30 HTTP kontrolü geçti.
- Aynı yeni kurulumda eski SQL + ayrı görsel ZIP ile taslak aktarımı, kategori ID korunması, kapak/önizleme, yetkisiz erişimin engellenmesi ve özel geçici dosyaların temizlenmesi geçti.
- Gerçek Pro 3.0 arşivinden kurulan sistem 3.3.3 ZIP’iyle birden fazla kez güncellendi. **47 haber, 7 hesap/parola hash’i, 11 kategori ve reklam kaydı** korundu. `.env`, `storage/site.php` ve yüklenen PDF’nin SHA-256 değerleri değişmedi.
- Gerçek Pro 3.3.2 kurulumunda aynı tekrar uygulama geçti: **56 haber, 7 hesap/parola hash’i, 11 kategori, 4 seçilmiş bot kaynağı ve reklam kaydı** korundu. Manuel ayarlar ve özel dosyalar değişmedi.
- Sistem Kontrolü doğru paketi doğruladı; eski CSS dosyası ve eksik sayfalama CSS’i doğru dosya yoluyla raporlandı. Dosya geri konunca uyarı kalktı. Editörün bu yönetici ekranına erişimi engellendi. SQLite ve MySQL’de toplam 12 kontrol geçti.

## Menü, haber yönetimi ve gerçek trafik

- Dört tema **1720, 1440, 1100, 900, 768, 390 ve 320 piksel** genişliklerde tarayıcıdan kontrol edildi. Kategori menüsünde yatay taşma/çubuk yok; mobil menü açıldığında bütün bağlantılar erişilebilir. Manşet resminin üzerindeki dikey Son Dakika şeridi görünmüyor.
- Altı panel ekranında beş farklı genişlikte sayfanın yatay taşmadığı doğrulandı. Çok sütunlu haber tablosu dar ekranlarda kendi kapsayıcısında kaydırılır.
- Haber tablosunun referans sütun sırası, paylaş menüsündeki sekiz servis + bağlantı kopyalama, sayfa 2’ye geçiş ve sayfa düğmeleri arasındaki boşluk doğrulandı. Haber editöründe 1–4 numaraları kendi etiketleriyle aynı sırada ve çakışmadan görüntüleniyor.
- Gerçek anonim tarayıcı ziyaretinden sonra panelin 15 saniyelik yenilemesinde ziyaretçi ve ilgili sayfa göründü. Canlı kartın başlık/zemin okunaklılığı ayrıca kontrol edildi.
- Tarayıcı senaryosunda **160 kontrol geçti; JavaScript hatası yok**. Önizleme görselleri test kurulumundan alındı.
- SQLite ve MySQL’de **32 HTTP kontrolü** geçti: canlı ekran, panelin sayılmaması, gerçek sayfa görüntülenmesi, CSRF, sahte sayfa heartbeat’inin reddi, heartbeat’in görüntülenme artırmaması, BİK kodunun kaydedilip ziyaretçi sayfasında bir kez ve panelde hiç çalışmaması, özel kaynak URL’si/günlük saat kaydı, kaynağı duraklatma/yeniden açma ve ayarların korunması.
- Yeni kurulumdaki hazır bot önerilerinin kullanıcı seçene kadar duraklatılmış olduğu doğrulandı. URL kaydetme ağ bağlantısı başlatmaz; gerçek fetch, DNS/IP/özel ağ ve TLS denetimlerini kullanmayı sürdürür.

## SQL, uploads ve diğer denetimler

SQLite/MySQL üzerinde SQL yükleme, alan eşleştirme, kategori ID çakışması, doğrudan uploads klasörü, alt yolları koruma, aynı dosya adının farklı alt klasörlerde doğru eşleşmesi ve tekrar yüklemede çoğalmama geçti. Tarayıcıdan gerçek klasör seçimi ve küçük grup yüklemeleri denendi; kesilen yüklemenin tekrarında dosya eşleştirmeleri korunuyor. ZIP içindeki yol aşımı ve sahte resim dosyaları reddediliyor.

Mevcut PHP entegrasyon senaryolarında **140 kontrol** geçti; trafik penceresi, eski kayıt temizliği, URL yapılandırma denetimi, SEO, bot zamanlaması, kategoriler, reklamlar, veri taşıma ve sürüm dosyası denetimi kapsandı. **104 PHP dosyasında sözdizimi hatası yok**.

Tam kurulum ve güncelleme ZIP’lerinin bütünlüğü, dosya özetleri ve özel dosya/anahtar dışlama kontrolleri geçti. Güncelleme ZIP’i `.env`, `storage` ve `uploads` içermez. Tam ZIP özel bağlantı dosyalarını, kayıtlı API anahtarlarını ve kullanıcı yüklemelerini içermez; kurulum bunları ilgili sitede oluşturur.

## Doğrulamanın sınırları

Gerçek ücretli OpenAI/ajans çağrıları ve canlı hosting cron çalışması yapılmadı. GPT-5.6 Sol/Terra/Luna seçeneklerinin API erişimi kullanıcının hesabıyla panelde sınanmalıdır. Dış sağlayıcı bağlantılarında bulut PHP DNS pinleme katmanının çözümleme sınırı devam ediyor; güvenlik denetimleri kapatılmadı. Hosting bağlantıları ayrıca test edilmelidir.

Aktarım testleri örnek eski SQL/görsel arşivleriyle yapıldı; kullanıcının gerçek eski veritabanı henüz verilmedi. Desteklenen SQL biçimleri ve alan eşleştirme sınırları [VERI-TASIMA.md](VERI-TASIMA.md) içinde açıklanır. Kurulum SQL’i eski sitenin haber arşivinin yerine geçmez.
