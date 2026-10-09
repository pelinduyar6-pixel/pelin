# Reflex Haber Pro · 4 tema · 2.0.0

PHP 8.1+ ile çalışan haber sitesi ve yönetim merkezi. Composer, Node, Laravel veya `vendor` kurulumu gerekmez. Türkçe arayüz, Türkiye saat dilimi ve MySQL/MariaDB desteği bulunur. SQLite küçük kurulumlar ve yerel denemeler için kullanılabilir.

## Kurulum

1. Hostingde PHP **8.1 veya üzerini** seçin. `pdo_mysql`, `dom`, `fileinfo`, `mbstring`, `curl`, `openssl` uzantıları açık olmalı.
2. Yeni, boş bir klasör oluşturun: örneğin `public_html/haber-yeni`. ZIP içindeki dosyaları buraya açın. `index.php`, `panel.php`, `kurulum.php` doğrudan bu klasörde bulunmalı. Gizli `.htaccess` dosyalarını da yükleyin.
3. Hosting panelinde MySQL veritabanı ve kullanıcı oluşturun; kullanıcıya veritabanı yetkilerini verin. Mevcut veritabanınızı da kullanabilirsiniz: uygulama **rh6_** tablolarını kullanır, diğer isimli tabloları değiştirmez. Daha önce oluşturulmuş rh6_ tabloları varsa aşağıdaki güncelleme yöntemini kullanın.
4. `https://alanadiniz.com/haber-yeni/kurulum.php` adresini açın. Site adresi alanına aynı klasörün adresini, sonunda `/kurulum.php` olmadan girin.
5. Veritabanı sunucusu, adı, kullanıcı adı ve şifresini girin. Hosting başka bilgi vermediyse sunucu `localhost`, port `3306` olur. Hesap ön ekleri dahil tam veritabanı/kullanıcı adlarını kullanın.
   **Veritabanı bağlantısını test et** düğmesiyle kontrol edebilirsiniz; bu kontrol tabloları veya yönetici hesabını oluşturmaz. Güvenlik için şifre alanları cevapta boşalır, kurulum için tekrar girin.
6. Yönetici e-postasını ve en az 12 karakterli şifresini **siz belirleyin**. Tasarımı dolu görmek için örnek içerikleri ekleyebilirsiniz. Kurulumu tamamlayın.
7. Site: `/haber-yeni/` · Panel: `/haber-yeni/panel.php`. Kurulumda belirlediğiniz bilgilerle giriş yapın.

Ana alan adında kurulum yapacaksanız dosyaları `public_html` içine açın ve adreslerde `/haber-yeni` kullanmayın. Mevcut siteyi değiştirmeden önce yeni klasörde kontrol edin. Varsayılan yönetici şifresi yoktur. Gerçek `.env`, veritabanı bilgileri ve API anahtarı ZIP içinde bulunmaz.

`storage`, `storage/sessions`, `storage/logs`, `uploads` PHP tarafından yazılabilir olmalı. Hosting hesabına uygun 755/775 izinlerini kullanın. Nginx kullanıyorsanız **NGINX.md** dosyasındaki erişim kurallarını uygulayın.

## Veritabanı hataları ve yarım kurulum

### phpMyAdmin ile SQL içe aktarma

Paketin `database/reflex-haber-pro.sql` dosyası 13 tablonun tüm alanlarını ve indekslerini içerir. phpMyAdmin'de kendi veritabanınızı seçin → **İçe aktar** → SQL dosyasını seçin → **Git/Uygula**. Sonra `/kurulum.php` sayfasında aynı veritabanı bilgileriyle yönetici hesabınızı ve isterseniz örnek haberleri oluşturun. Kurulum formu normalde tabloları zaten otomatik oluşturur; SQL önceden içe aktarılmışsa mevcut tablo yapısını kullanır.

SQL dosyası kullanıcı/parola, API anahtarı veya örnek haber içermez. CREATE TABLE IF NOT EXISTS kullanır; kayıt silmez ve mevcut `rh6_` tablolarını yeni sürüme dönüştürmez. Güncelleme veya kayıp ayar dosyası için aşağıdaki güncelleme/yeniden bağlama yöntemini kullanın. İçe aktarmadan önce yedek alın. SQL içe aktarma 1044/1045 MySQL erişim sorunlarını çözmez; kullanıcı yetkisi ve şifre hosting panelinde düzeltilmelidir. SQL dosyasını web sitesinin herkese açık köküne yüklemeniz gerekmez.

9 Ekim kurulum düzeltmesi, bağlantı ve kayıt hatalarını ayrı gösterir; genel hata mesajı yerine güvenli hata kodunu verir. Şifre veya ham PDO hata mesajı ekrana/günlüğe yazılmaz.

- **1045:** MySQL kullanıcı adı/şifre ile girişi reddeder. Hosting → MySQL Veritabanları bölümünden kullanıcı şifresini kontrol edin veya yeniden belirleyin. Kurulumda hesap ön ekiyle tam kullanıcı adını ve bu şifreyi girin. Panel yönetici şifresi ayrı bir alandır.
- **1044:** Kullanıcının seçilen veritabanına erişimi yoktur. Hosting → Veritabanına Kullanıcı Ekle bölümünde doğru kullanıcı ve veritabanını eşleyip tüm veritabanı yetkilerini verin.
- **1142:** Bağlantı kurulmuştur ancak tablo oluşturma/değiştirme gibi işlem yetkisi yoktur. İlgili veritabanı yetkilerini tamamlayın.
- **1049:** Veritabanı adı bulunamıyor. Hosting panelindeki adı hesap ön ekiyle tam kullanın.
- **2002/2003:** MySQL sunucusuna ulaşılamıyor. Hostingin verdiği sunucu/port/soket bilgisini doğrulayın.

`storage/site.php` mevcutsa yeniden kurulum yapmayın; normal güncelleme yöntemini uygulayın. Bu dosya kaybolmuş fakat `rh6_` tablolarında hesaplar/haberler duruyorsa: yedek alın, doğru veritabanı bilgileri ile **mevcut** yönetici e-postasını ve şifresini girip **Mevcut kurulumu bağla** düğmesine basın. Bu işlem yeni kullanıcı/örnek haber oluşturmaz; yönetici şifresi doğrulanmadan bağlanmaz. Unutulmuş şifreyi sıfırlamaz. Diğer yazılımların veritabanını otomatik dönüştürmez.

Yeni kurulumda ayar dosyası kaydedilemezse o denemedeki hesap/haber kayıtları geri alınır; geçici parola dosyası temizlenir. Kurulum kilidi bırakılıncaya kadar site istekleri kısa süreli 503 alır. Disk/sunucu sorunu düzelince aynı kurulum tekrar denenebilir. **Tablolarınızı veya veritabanınızı silmeyin.**

## Daha önceki “Demo 6 sıfırdan” sürümünü güncelleme

Bu yöntem daha önce gönderilen `reflex-haber-demo6-sifirdan.zip` ile kurulan PHP sürümü içindir.

1. Veritabanınızın SQL yedeğini alın. `uploads` klasörünü ve `storage/site.php` dosyasını bilgisayarınıza yedekleyin. Varsa `storage/integrations.php` dosyasını da koruyun.
2. Pro ZIP'ini mevcut projenin klasörüne açın; uygulama dosyalarının üzerine yazın. **Mevcut `storage/site.php`, `storage/integrations.php` ve uploads içeriğini silmeyin.** Paket bu özel dosyaları içermez.
3. Siteyi veya paneli açın. Yeni tablolar/alanlar otomatik eklenir. Kurulum formunu yeniden çalıştırmayın. Önceki hesap, şifre, haber, kategori ve görseller korunur.
4. Panel → Tema ve Logo'dan temanızı seçin. Panel → Örnek içerikleri kaldır, sadece örnekleri kaldırır; kendi eklediğiniz ve düzenleyerek kaydettiğiniz haberler korunur.

Eski Laravel ZIP'inin üzerine bu paketi açmayın. Eski Laravel veritabanındaki haberlerin bu sisteme otomatik aktarımı dahil değildir; farklı tablolar kullandığı için ayrıca eşleme gerekir.

## Dört arayüz

Panel → **Tema ve Logo** bölümünden seçilir. Tema değiştirmek haberleri veya hesapları silmez.

| Tema | Referans düzeni | Yerleşim |
|---|---|---|
| 1 | Demo 6 | Dört üst kart, sarı manşet, sağ haber/yazar sütunu |
| 2 | Demo 8 | Ortada manşet, iki yanda kartlar, iki büyük haber |
| 3 | Demo 5 | Geniş logo, kırmızı menü, beş kart ve geniş manşet |
| 4 | Demo 1 | Vitrin banner, dikey sayfalama, beş kart ve haber sütunu |

Tema önizlemeleri, ana logo, ayrı footer logosu, favicon, renkler, sayfa genişliği, kart yoğunluğu, üst başlık düzeni ve koyu tema ayarlanabilir. Footer açıklaması, adres, telefon ve sosyal bağlantılar uygulanır. Manşet geçişi açılıp kapatılır; süre 3–20 saniye seçilir. Sarı “Son Dakika” alanı yumuşak yanıp söner. Hareket azaltma tercihinde animasyon ve otomatik geçiş durur; duraklatma düğmesi her zaman kullanılabilir.

**Ana Sayfa Öğeleri:** Üst manşet, ana manşet, sağ sütun; alt bölümlerin görünürlüğü ve sırası yönetilir. Foto/video vitrini, kategoriler, son haberler ve yazarlar gerçek yayımlanmış içeriklerle dolar.

## Haber ve medya merkezi

Haber Merkezi → Haber ekle: başlık, özet, metin, kapak ve kategoriyi girin. Durumu **Taslak**, **Yayında** veya **Planlandı** seçin. Son Dakika, Ana Manşet, Üst Manşet, Öne Çıkan ve Kutu Haber konumlarını işaretleyin. İleri tarihli “Yayında” seçimi otomatik planlanır. Taslak ve gelecekteki haberler ziyaretçiye, RSS'e veya site haritasına görünmez.

Foto Galeri türünde çoklu fotoğraf ekleyin; ziyaretçi fotoğrafları büyütüp gezebilir. Video türünde YouTube bağlantısı girin veya **MP4/WebM dosyası yükleyin**. Yüklenen video öncelikli gösterilir. YouTube, oynat düğmesine basılınca gizlilik alan adı üzerinden açılır. Medya Kütüphanesi'nde yüklemeler listelenir; haber kapağı için yeniden kullanılabilir.

Görseller en fazla 5 MB, videolar en fazla 100 MB. Hostingin `upload_max_filesize` ve `post_max_size` sınırları da yeterli olmalı; büyük videolar için örneğin 100M / 128M. PHP video dönüştürme yapmaz; yüklenen dosya tarayıcıların oynatabileceği H.264 MP4 veya WebM olmalı.

Haber detayında sosyal paylaşım, yazdırma, bağlantı kopyalama, yazı boyutu, okuma ilerlemesi, sıradaki haber, destekleyen tarayıcılarda Türkçe sesli okuma ve emoji tepkileri bulunur. Tepkiler gerçek veritabanı sayımlarıdır; aynı tarayıcı seçimini değiştirebilir. Tarayıcılar arasında tek kişi doğrulaması yapılmaz. Yorumlar editör onayıyla yayınlanır.

Kategori ve “Tümü” sayfaları büyük manşet, üç sütunlu kartlar, sağ son haber listesi ve sayfalama kullanır. Foto/video listeleri ayrı görüntülenir. Haber yönetiminde durum/tür/başlık filtresi ve sayfalama bulunur.

## OpenAI ve SEO

Panel → **OpenAI Ayarları**: kendi API anahtarınızı girin. Varsayılan model `gpt-4.1-mini`; hesabınızda kullanılabilen bir Responses API ve JSON şeması destekleyen model seçebilirsiniz. Anahtar private `storage/integrations.php` içinde saklanır ve panelde geri gösterilmez.

Haber editöründeki SEO skoru başlık, açıklama, kelime sayısı, ara başlık, görsel, odak kelime, slug ve özeti kontrol eder. **OpenAI ile otomatik SEO düzenle** butonu önerileri getirir. Önizlemede “Uygula” seçeneğiyle alanlar değiştirilir; isteğe bağlı haber metni düzenlemesi ayrıca seçilir. Yayınlamak için yine Kaydet gerekir. Metni ve doğruluğunu editör kontrol eder. OpenAI kullanım bedeli kendi hesabınıza aittir; botlar otomatik ücretli AI çağrısı yapmaz.

**SEO Merkezi:** Haber puanları ve puan dağılımı, indeksleme ayarı, canonical, Open Graph/Twitter kartları, NewsArticle/Breadcrumb JSON-LD, XML site haritası, son 48 saatlik Google News haritası ve RSS bulunur. Örnek haberler site haritalarına gönderilmez. Genel Ayarlar'a kendi Google News yayın takip bağlantınızı ekleyebilirsiniz.

Search Console'a `https://alanadiniz.com/haber-yeni/index.php?route=%2Fsitemap.xml` adresini gönderin. Haber haritası `index.php?route=%2Fnews-sitemap.xml`, RSS `index.php?route=%2Frss.xml` adresindedir. `/robots.txt` için Apache rewrite veya Nginx kuralı uygulanmalıdır. Alt klasördeki robots kuralları alan adının kökündeki robots.txt'e de eklenmelidir. SEO puanı Google sıralaması veya Google News kabul garantisi değildir.

## RSS/Atom haber botları ve zamanlama

Panel → **Haber Botları**: hazır kaynak seçin veya kullanmaya yetkili olduğunuz RSS/Atom adresini girin. Kategori, yazar, **5–10080 dakika** çalışma aralığı, sonraki çalışma saati, 1–20 haber limiti ve Taslak/Yayında seçeneğini kaydedin. “Şimdi çalıştır” ile deneme yapın. Tekrar eden kaynak kimlikleri atlanır; alınan habere kaynak bağlantısı eklenir. Son çalışma mesajı ve günlükleri panelde görülür. Kaynak görüntü veriyorsa kapak adresi alınır.

Sitenin ziyaret edilmesi RSS botunu sürekli çalıştırmaz. Hostingde aşağıdaki **cron görevini 5 dakikada bir** tanımlayın; gerçek PHP ve proje yolunuzu kullanın:

```cron
*/5 * * * * /usr/local/bin/php /home/HESAP/public_html/haber-yeni/cron.php
```

CLI kullanamıyorsanız bot panelindeki gizli HTTP görev adresini hosting zamanlayıcınıza girin. Bu adresin tokenını paylaşmayın; panelden yenilenebilir. Cron zamanı gelen kaynakları çalıştırır ve planlı haberleri yayınlar. Cron aralığı seçilen saate en fazla görev aralığı kadar gecikme ekleyebilir. Kaynaklar TLS, süre ve boyut sınırlarıyla okunur; yerel/özel ağlara erişim engellenir.

## Reklam, özel kodlar ve güvenlik

**Reklam Alanları:** 21 konum; logo üstü, menü altı, üst manşet, sağ sütunun üç konumu, ana sayfa bölüm araları, foto/video, kategori, haber görsel/metin altları, footer, masaüstü dış alanlar ve mobil sabit bant. Görsel veya reklam sağlayıcı kodu, cihaz seçimi, başlangıç/bitiş tarihi ve öncelik ayarlanabilir. Eşit öncelikteki reklamlar dönüşümlüdür. Konum ilgili sayfa/bölüm açıkken gösterilir.

**Özel Kodlar:** `head`, `body` başlangıcı, `body` sonu ve footer alanları vardır. Analytics ve benzeri yetkili entegrasyon kodları yalnızca sitede uygulanır, yönetim paneline eklenmez. Bu alanları ve reklam scriptlerini yalnızca yönetici değiştirebilir.

Parola hashleme, CSRF, yönetici/editör yetkileri, oturum yenileme/süre sınırı, giriş denemesi sınırı, hazırlanmış PDO sorguları, haber HTML temizliği, dosya MIME kontrolü, çalıştırılabilir yükleme engeli, özel dosya erişim kuralları, RSS SSRF/XXE koruması ve doğrulanan TLS bağlantıları uygulanmıştır. **Güvenlik** paneli yerel kontrolleri gösterir. Hosting SSL, yedekleme ve erişim kuralları da etkin olmalıdır.

`storage`, `app`, `views`, `tests` adresleri hostingde 403/404 vermeli. Nginx `.htaccess` okumaz; NGINX.md dosyasındaki kuralları hosting yöneticinizle uygulayın. Özel API anahtarı ve site.php dosyalarını Git/ZIP'e eklemeyin.

## Test ve kayıtlar

Yerel PHP 8.4, MariaDB 11.8 ve SQLite üzerinde kurulum/yayın/medya/yetki/SEO/kod/tema testleri yapılmıştır. Eski PHP sürümünden otomatik güncellemenin haber, hesap, parola hash'i, bağlantı ayarları ve uploads dosyalarını koruduğu doğrulanmıştır. Chromium'da dört tema 320/390/1440, panel 320/390/768/1440 genişliklerde; manşet otomatik geçişi, video ve tepki değişikliği test edilmiştir.

OpenAI için anahtar yokken hata davranışı, Responses API istek biçimi, örnek yanıtların ayrıştırılması ve hatalı yanıtlar yerel testlerle doğrulanmıştır. **Gerçek OpenAI hesabıyla çağrı yapılmadı**; anahtarınızı girdikten sonra hesabınızın kota/model izinleriyle deneyin. Canlı hostinginize dağıtım yapılmamıştır. Apache/Nginx erişim kuralları yerel PHP geliştirme sunucusunda çalıştırılmamıştır. RSS aktarımı ve zamanlama örnek RSS/Atom yanıtlarıyla test edilmiştir; bulut ortamının dış DNS kısıtı nedeniyle canlı RSS adresine bağlantı doğrulanamamıştır. Hostinginizde Şimdi çalıştır ile kontrol edin.

`tests/smoke.py`, `tests/pro-http.py`, `tests/pro-integrations.php`, `tests/browser-pro.cjs` yalnızca silinebilir yerel kurulumlarda çalıştırılmalıdır. Şifreler ortam değişkenlerinden alınır. Görüntülenme ölçümü Pro kurulumundan başlar, panel kullanıcıları sayılmaz. Bot/önizleme istekleri ayrıca filtrelenmediği için bu metrik tekil kullanıcı analitiği değildir. Hava ve piyasa değerleri Genel Ayarlar'dan elle güncellenir.

Kurulum düzeltmesi MySQL 1044/1045/1142/2002 hataları, dosya kaydetme başarısızlığı ve başarılı yeniden deneme için gerçek yerel MySQL/SQLite üzerinde test edilmiştir. Mevcut kurulum yeniden bağlandığında tüm tablo kayıtlarının ve parola hash'lerinin aynı kaldığı doğrulanmıştır. `tests/installer.py` yalnızca kendisine ayrılmış silinebilir yerel test kurulumunda çalıştırılır.

500/503 için PHP sürümü/uzantılar, hosting PHP hata günlüğü, veritabanı bilgileri ve yazma izinlerini kontrol edin. `storage/logs/app.log` hata sınıfını ve kod konumunu tutar; parola/anahtar yazmaz. Büyük dosya sınırı aşılırsa 413 mesajı verilir.

Örnek görsellerin kaynakları `assets/v6/demo/SOURCES.txt` içindedir; bunlar referans sitenin açık demo görselleridir. Örnek yazılar gerçek haber iddiası taşımaz. `reflex-video-demo.mp4` bu proje için oluşturulmuş tanıtım/test klibidir. Roboto lisansı `assets/v6/fonts/LICENSE` dosyasındadır. Yayına geçerken örnekleri kendi lisanslı içeriklerinizle değiştirin.
