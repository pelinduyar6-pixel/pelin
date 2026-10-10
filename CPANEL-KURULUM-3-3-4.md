# Yeni cPanel kurulumu · Reflex Haber Pro 3.3.4

**reflex-haber-pro-3-3-4-cpanel-sql.zip** dört temayı, tüm uygulamayı ve `database/reflex-haber-pro.sql` dosyasını birlikte içerir. SQL, 25 tabloluk boş kurulum şemasıdır; eski sitenizin haberleri, parolaları veya API anahtarları pakete eklenmez. Yönetici hesabınızı kurulumda kendiniz oluşturursunuz; örnek haberleri isteğe bağlı ekleyebilirsiniz.

1. cPanel → **MultiPHP Manager / Select PHP Version**: PHP 8.1 veya üzerini seçin. PDO MySQL, DOM, Fileinfo, Mbstring, cURL ve OpenSSL uzantıları açık olsun. Görsel ZIP aktarımı için Phar veya ZipArchive gerekir; doğrudan klasör yükleme ZIP uzantısı gerektirmez.
2. **Dosya Yöneticisi** ile ZIP’i alan adının belge köküne yükleyip açın. `index.php`, `kurulum.php`, `app`, `assets`, `views`, `storage` ve `uploads` aynı seviyede olmalıdır. Ana alan adında genellikle `public_html`, ek alan adında ise cPanel’de o alan adı için yazan klasördür. `.htaccess` dosyalarını da yükleyin. Çalışan başka sitenin üzerine yeni kurulum yapmayın.
3. **MySQL Database Wizard** ile yeni veritabanı ve kullanıcı oluşturun; kullanıcıyı veritabanına **Tüm Yetkiler** ile ekleyin. İsimleri cPanel hesap ön ekiyle birlikte kullanın.
4. **phpMyAdmin** → yeni veritabanı → **İçe aktar**: paketteki `database/reflex-haber-pro.sql` dosyasını UTF-8 olarak içe aktarın. Bu adım isteğe bağlıdır; kurulum ekranı aynı tabloları kendisi de oluşturabilir. Mevcut başka sitenin SQL dosyasını bu boş kurulum şemasının yerine kullanmayın.
5. Tarayıcıda `https://ALAN-ADINIZ/kurulum.php` açın. MySQL’i seçin; host bilgisini hostingin verdiği şekilde girin (çoğunlukla `localhost`, port `3306`). Tam veritabanı adını, kullanıcıyı ve şifreyi yazın. Site adresinizi, kendi yönetici e-postanızı ve güçlü şifrenizi belirleyin. **Bağlantıyı test et** sonrasında şifre alanlarını tekrar doldurup kurulumu tamamlayın. Eski haberleri taşıyacaksanız örnek haber seçimini kapatın.
6. Yönetim paneline `/panel.php` ile girin. **Sistem Kontrolü** ekranında sürümün **3.3.4** ve “Güncelleme dosyaları eksiksiz” olduğunu kontrol edin. Kurulum tamamlanınca kurulum ekranı yeniden hesap oluşturulmasına kapanır.

`storage` ve `uploads` PHP kullanıcısı tarafından yazılabilir olmalıdır; genellikle klasörler 755/775, dosyalar 644 yeterlidir. `storage` içindeki bağlantı/anahtar dosyaları HTTP üzerinden erişilmemelidir; paketteki `.htaccess` bu erişimi kapatır. Kurulum `storage/site.php` bağlantı dosyasını oluşturur. Veritabanı şifresi ile haber paneli şifresi farklıdır.

## Eski SQL ve uploads klasörünüzü taşımak

Kurulum tamamlandıktan sonra **Veri Taşıma** menüsünü açın. Eski SQL dosyanızı ve ayrı `uploads` / resim klasörünü seçin; klasörü doğrudan veya ZIP olarak yükleyebilirsiniz. SQL ve görselleri farklı zamanlarda da ekleyebilirsiniz. Tablo/alanları eşleştirin, kategori ID’lerini ve görselleri önizlemede kontrol edin, haberleri taslak olarak aktarın. Boş kategori ID’leri korunur; çakışmalarda mevcut kategori ezilmez. Haber kapakları ve içerik resimleri eski alt klasör yollarına göre eşleştirilir. Kesilen görsel yüklemesi tekrar denenebilir.

Desteklenen SQL biçimleri ve eşleştirme sınırları [VERI-TASIMA.md](VERI-TASIMA.md) içindedir. Test sitenizde aktarılan taslakları inceleyip ardından yayına alın; eski hesap ve parolalar bu haber aktarımına dahil değildir.

## Bot, canlı veri ve BİK

- **Botlar**: kendi kaynak URL’nizi, kategorinizi, günlük Türkiye saatini veya tarama aralığını seçin. Hazır öneriler yeni kurulumda duraklatılmıştır. **Cron Ayarları** bölümündeki bu kurulum için üretilen komutu cPanel Cron Jobs’a 5 dakikada bir çalışacak şekilde ekleyin. Kaynak saatleri bundan sonra uygulanır. Panelde URL ve API bağlantı testlerini yapın; anahtarları özel panel alanlarına girin.
- **Canlı Veri Merkezi**: bu kurulumdan sonra gerçekleşen anonim ziyaretleri gösterir; sayfa açıkken 15 saniyede bir yenilenir. Ziyaretçisi olmayan yeni sitede sıfır görünmesi normaldir.
- **Özel Kodlar → BİK takip kodu**: kurumun verdiği kodu bu alana yapıştırıp kaydedin. Kod ziyaretçi sayfalarında gövde kapanışından önce bir kez eklenir.

1044 hatasında kullanıcıyı doğru veritabanına tüm yetkilerle bağlayın. 1045 hatasında cPanel ön ekli kullanıcı adını ve MySQL şifresini kontrol edin. Yükleme sonrası eski görünüm kalırsa Ctrl+F5 kullanın; Sistem Kontrolü’ndeki eksik/farklı dosyaları yeniden yükleyin.

**Sosyal Medya Merkezi**: Facebook Sayfa veya X kullanıcı erişim anahtarlarını özel panel alanlarına girin. Profil menüsünü buradan düzenleyin. Hesapları etkinleştirmeden otomatik gönderim yapılmaz. Mevcut cron görevi paylaşım kuyruğunu da işler. Ayrıntılar [SOSYAL-MEDYA.md](SOSYAL-MEDYA.md).
