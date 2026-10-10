# Reflex Haber Pro 3.3 güncelleme

**Güncel paket 3.3.1’dir. Son tema tasarımı geri alınmıştır; SQL/ZIP/doğrudan klasör yükleme eklenmiştir. Güncel adımlar: [GUNCELLEME-3-3-1.md](GUNCELLEME-3-3-1.md).**

Çalışan **Pro 3.2** sitesi için `reflex-haber-pro-3-3-guncelleme.zip` kullanın. Önce dosyaları ve veritabanını yedekleyin. ZIP’in uygulama dosyalarını mevcut `index.php` ile aynı proje köküne yükleyin; `app`, `assets`, `views` ve `cron.php` dosyalarının üzerine yazın. Yeni CSS/JS ve görünüm dosyalarının da yüklenmesi gerekir.

**`.env`, `storage/site.php`, `storage/integrations.php`, diğer storage verileri ve uploads dosyalarınızı koruyun.** Güncelleme ZIP’i bunları içermez. Paneli açıp Ctrl+F5 yapın. Haber kaynağı takvimi için iki alan, taşıma tekrarlarını önlemek için haber tablosuna `migration_key` alanı ve benzersiz indeks otomatik eklenir; hosting veritabanı kullanıcısının ALTER/indeks oluşturma yetkisi gerekir. Haberler, hesaplar, parola özetleri, anahtarlar ve yüklemeler korunur. **SQL’i yeniden içe aktarmayın, kurulum ekranını tekrar çalıştırmayın.**

Pro 3.1 veya daha eski/belirsiz sürümde tam `reflex-haber-pro-4-tema.zip` içindeki uygulama dosyalarını kullanın; özel dosyaları yine koruyun. Eski güncelleme ZIP’lerini yeni sürümün üzerine uygulamayın. Yeni kurulumda tam ZIP’i boş klasöre açıp `/kurulum.php` kullanın. Başka yazılımların veritabanı otomatik dönüştürülmez.

## Panelden kullanılacak kontroller

- **Ana Sayfa & Kategoriler → Ana haber kategorisi:** Türkiye Gündemi ana manşet ve haber alanıdır. Eski Gündem adı güncellenir; `gundem` adresi ve kategori ID’si korunur. Özel kategori adları değiştirilmez. Ana kategori seçimini siz değiştirebilirsiniz; alt bölüm kategori sıraları/görünümleri korunur. Boş ana kategori yerine son yayımlanmış haberler gösterilir. Sağdaki En çok okunanlar kayıtlı görüntülenme sayılarını kullanır; taslak/gelecek tarihli haberler görünmez.
- **Haber Yönetimi → Paylaş:** Facebook, X, WhatsApp, Telegram, LinkedIn, Pinterest, Reddit, e-posta ve Linki kopyala. Menü tablo sınırlarında kesilmez; klavye okları, Escape ve dışarı tıklama çalışır. Sosyal ağda gönderiyi siz tamamlarsınız.
- **Haber Botları → Genel ayarlar:** otomatik bot, hedef kelime, ortak model ve API anahtarı. GPT-5.6 **Sol, Terra, Luna** üç seçenektir. API anahtarını boş bırakmak kayıtlı anahtarı korur. Model adları API hesabınızda erişilebilir olmalıdır; hesabınız farklı kimlik kullanıyorsa Özel API model kimliğini girin. Kaydedip **Kayıtlı anahtar ve modeli test et** düğmesini kullanın. Test başarılı olmadan bağlantı başarılı etiketi gösterilmez. Bu sürüm API aboneliği/model erişimi sağlamaz; erişim başarısızsa başka modele sessiz geçiş yapılmaz. AI seçili bot haberleri AI hatasında taslakta tutulur. Güncellemede eski GPT-4 ayarı GPT-5.6 Sol tercihine geçer; API anahtarı korunur.
- **Haber Botları → Kaynak ekle:** kendi RSS, kategori veya haber sayfası URL’si, hedef kategori/yazar, haber limiti ve Taslak/Yayında durumunu belirleyin. **Belirli aralıklarla** seçeneğinde dakika ve ilk çalışma zamanını; **Her gün seçtiğim saatte** seçeneğinde Türkiye saatini belirleyin. Aktif kaynaklar ve son/sonraki kontrol tablodadır. URL’yi test et kaynak başlıklarını kontrol eder; Şimdi çalıştır elle import eder.
- **Hosting cron:** paneldeki PHP komutunu `*/5 * * * *` sıklığıyla ekleyin. CLI yoksa gizli HTTP görev adresini kullanın; tokenı paylaşmayın. Kaynak seçilen saatten sonraki ilk cron çağrısında alınır; 5 dakikalık görev en fazla yaklaşık 5 dakika gecikme ekler, hosting gecikmesi buna eklenebilir. Botu kapatmak otomatik kaynak/ajans importunu durdurur. Cron kurulmadan normal sayfa ziyaretleri kaynak botunu çalıştırmaz.
- **Reklam Alanları:** Haber metni içi, Haber sağ sütunu üst/orta/alt seçenekleri eklendi. Metin içi reklam üçüncü paragraf sonrası, kısa haberlerde son paragraf sonrası görünür. Cihaz, başlangıç/bitiş ve öncelik kuralları kullanılır. Atanmamış reklam için boş kutu bırakılmaz. Genel sağ sütun reklamları da çalışmaya devam eder.
- **Veri Taşıma:** Başka sitenin UTF-8 MySQL SQL dosyası ve görsel ZIP’i ayrı yüklenir. Haber/kategori alanlarını eşleştirin, önizlemeyi kontrol edin; kategori ID boşsa korunur, çakışıyorsa eşleştirme kullanılır. Haberler 100 kayıtlık adımlarla taslak olarak aktarılır. SQL komutları mevcut veritabanında çalıştırılmaz. [Taşıma adımları ve desteklenen biçimler](VERI-TASIMA.md).

## Görünüm

Dört tema canlı renklerle yenilendi: magazin mor/pembe, teknoloji turkuaz, spor yeşil, ekonomi mavi vitrinler; belirgin kartlar ve tema bazında farklı renkli zeminler. Paneldeki marka renkleri korunur. Manşet numaraları görselin altındadır; başlık/etiket ile çakışmaz. Kategori manşetinin beyaz bandı kaldırıldı. Tekrarlanan ikinci manşet, içeriği olmayan video/galeri bölümleri ve sosyal adres girilmemiş boş footer bandı gösterilmez. Site/panel/footer yazıları biraz büyütüldü. Haber detayı görselli son haberler, ilgili haberler ve en çok okunanlarla yenilendi; kapaksız haberlerde büyük yer tutan boş kapak gösterilmez.

Yazarların altındaki piyasalar ve güncel Süper Lig altyapısı korunur. Otomatik veriler için Piyasalar ve Lig & Puan Durumu ekranlarından kaynağı seçip şimdi güncelle/test et düğmesini kullanın. Son başarılı veri ve zamanı kesintide korunur. Sağlayıcı erişimi/HTML biçimi hosting ortamında ayrıca kontrol edilmelidir.

## Doğrulama sınırları

SQLite ve MySQL üzerinde kaynak URL/saat kaydı, ortak AI ayarı, CSRF, reklamın metin içinde görünmesi ve toplu işlem/izin kontrolleri çalıştırıldı. Dört tema 320–1440 pikselde; kategori beyaz bandı, manşet çakışması, paylaşım bağlantıları/klavye/clipboard ve yazı boyutları tarayıcıda doğrulandı. Gerçek 3.2 → 3.3 ZIP geçişinde veri ve özel dosya korunması kontrol edildi.

OpenAI model payload testleri ücretli çağrı yapmadan çalışır; sizin API hesabınızda Sol/Terra/Luna erişimi test edilmedi. Kaynak sitelerde üyelik, JS ile çizilen sayfa veya erişim kısıtı varsa URL testi açık hata gösterebilir. Bu işlem canlı hostinge otomatik dosya yüklemez.
