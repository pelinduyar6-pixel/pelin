# Reflex Haber · Demo 6 · Sıfırdan yeni sürüm

Referans: https://esenhaber.cizoglubilisim.com/demo6/

Bu proje yeni PHP kodlarıyla hazırlanmıştır. Eski Laravel projesini, `.env` dosyasını veya `vendor` klasörünü kullanmaz. Referanstaki beyaz üst menü, dört üst haber kartı, sarı başlıklı manşet, sağ haber sütunu, yazarlar ve kategori bölümleri yeniden uygulanmıştır. Marka **REFLEX HABER** olarak bırakılmıştır.

## Hosting kurulumu

1. Hosting panelinden **PHP 8.1 veya üzerini** seçin. `pdo_mysql`, `dom`, `fileinfo`, `mbstring` uzantılarını etkinleştirin.
2. Yeni ve boş bir klasör oluşturun. Örnek: `public_html/haber-yeni`. ZIP'in içindeki dosyaları bu klasöre açın; `index.php` ve `kurulum.php` doğrudan burada bulunmalı.
3. Hosting panelinde yeni bir **MySQL/MariaDB veritabanı ve kullanıcı** oluşturun. Kullanıcıya bu veritabanı için tüm yetkileri verin. Hostingin eklediği hesap ön ekleri dahil tam adları kullanın.
4. Tarayıcıda `https://alanadiniz.com/haber-yeni/kurulum.php` adresini açın. Site adresini, veritabanı sunucusunu, adını, kullanıcısını ve şifresini girin. Ayrı sunucu belirtilmediyse veritabanı adresi genellikle `localhost`, port `3306` olur.
5. Yönetici e-postasını ve en az 12 karakterli şifresini **kendiniz belirleyin**. Tasarım dolu görünsün diye "örnek haberleri ekle" seçeneğini açık bırakın. "Kurulumu tamamla" düğmesine basın.
6. Site: `https://alanadiniz.com/haber-yeni/` · Panel: `https://alanadiniz.com/haber-yeni/panel.php`. Kurulumda belirlediğiniz e-posta ve şifreyle giriş yapın.

Ana alan adında kurulum için dosyalar `public_html` içinde olmalı ve adreslerde `/haber-yeni` bulunmamalıdır. Mevcut sitenin üzerine yüklemeden önce yeni klasörde kurup kontrol edin.

Kurulum veritabanında `rh6_` tablolarını oluşturur. Aynı tablolarla kurulmuş başka bir siteyi değiştirmez. Gerçek bağlantı bilgileri kurulum sırasında `storage/site.php` dosyasına yazılır; ZIP içinde hazır şifre veya gerçek `.env` yoktur. Kurulum tamamlanınca kurulum ekranı otomatik kapanır.

## İlk haberinizi yayınlama

Panel → **Haber Yönetimi → Haber ekle**. Başlık, özet, içerik ve görseli girin. Kategoriyi ve yazarı seçin. Ana sayfada görünmesini istediğiniz yerleri işaretleyin:

- **Son Dakika:** üstteki haber bandı.
- **Ana Manşet:** büyük sarı başlıklı kaydırıcı.
- **Üst Manşet:** üstteki dört görsel kart.
- **Öne Çıkan:** sağdaki kaydırıcı ve haber listesi.
- **Kutu Haber:** manşet altındaki haber kartları.

Durumu **Yayında** seçip kaydedin. Taslaklar ziyaretçilere görünmez. Gelecek yayın tarihi otomatik olarak planlanır; tarih geldiğinde siteye yapılan ilk istekte yayımlanır. Saat dilimi Türkiye'dir. Planlama için sürekli çalışan bir görev gerekmiyor.

Zengin metin editörü, kapak görseli, çoklu görselli foto galeri, video bağlantısı, haber SEO başlığı/açıklaması, yazar profilleri, kategoriler, görsel reklamlar, sayfalar ve onaylı yorumlar kullanılabilir. Video bağlantısı "Videoyu izle" düğmesiyle açılır.

**Dashboard → Örnek içerikleri kaldır** yalnızca örnek haber ve yazarları siler. Eklediğiniz haberler korunur. Düzenleyip kaydettiğiniz örnek haberler de özgün içerik olarak işaretlenir ve korunur. Örnek görsel dosyaları diskten silinmez.

**Yazarlar ve Kullanıcılar:** Yönetici tüm modülleri kullanır; editör haberleri ve yorumları yönetir; yazar profili panel erişimi sağlamaz. **Hesabım** bölümünden şifre değiştirebilirsiniz. Varsayılan yönetici hesabı/şifresi yoktur.

**Genel Ayarlar:** Site adı, sosyal medya adresleri, iletişim bilgisi, hava durumu ve piyasa kutusu düzenlenir. Hava ve piyasa değerleri editör tarafından elle güncellenir; canlı veri servisine bağlı değildir. Haber botu, ajans aktarımı veya yapay zekâ servisi içermez.

## Sunucu notları

- Apache/LiteSpeed için `.htaccess` dosyalarını da yükleyin; hosting dosya yöneticisinde gizli dosyaları göstermeyi açın. Bağlantılar sorgu parametresiyle çalıştığı için URL yeniden yazma şart değildir.
- `storage`, `storage/sessions`, `storage/logs` ve `uploads` klasörlerine PHP'nin yazma izni olmalı. Hosting hesabının sahipliğine uygun `755` veya `775` kullanın; `777` kullanmayın.
- Görseller JPG/PNG/WebP/GIF olarak, dosya başına en fazla 5 MB kabul edilir. PHP'nin `upload_max_filesize` ve `post_max_size` değerleri yükleme boyutuna uygun olmalı.
- Nginx kullanıyorsanız [.htaccess yerine uygulanacak kuralları](NGINX.md) hosting yöneticinize iletin. Özel klasörlerin ve yüklenen çalıştırılabilir dosyaların web erişimi kapalı olmalıdır.
- Tasarım CSS ve JavaScript kodları sayfada sunulur. Fontlar ve görseller pakettedir. Ana tasarım için CDN, Tailwind derlemesi veya Composer kurulumu gerekmez.

500 hatasında önce PHP sürümünü ve yukarıdaki uzantıları kontrol edin. Apache `.htaccess` yönergelerine izin vermiyorsa hosting hata günlüğündeki ilgili yönergeyi kontrol edin; sorgu bağlantıları `.htaccess` olmadan da çalışır, özel klasörlerin erişim koruması sunucu tarafından uygulanmalıdır. Veritabanı bağlantısı kurulamazsa uygulama ayrıntı/şifre göstermeden 503 ekranı açar. Yerel uygulama kayıtları `storage/logs/app.log` içinde hata sınıfı ve kod konumunu tutar; hosting PHP hata günlüğü ayrıntılı tanı için kullanılabilir.

Yedek: veritabanı, `uploads` ve `storage/site.php` birlikte yedeklenmelidir. `storage/site.php` yayımlanacak ZIP veya Git deposuna eklenmemelidir.

## Doğrulama

Bu sürüm yerel PHP 8.4.24 ve MariaDB 11.8 ile kurulup test edildi. Alt klasörde SQLite kurulumu da test edildi. Yönetici girişi, erişim yetkileri, haber ekleme/düzenleme/silme, görsel ve galeri yükleme, taslak gizliliği, planlı yayın, yorum onayı, reklam, kategori, yazar ve sayfa işlemleri kontrol edildi. Masaüstü/mobil Chromium kontrolleri 320, 390, 768, 1024 ve 1440 piksel genişliklerde yapıldı. Kullanıcının canlı sunucusuna dağıtım yapılmadı.

`tests/smoke.py` yeni ve boş bir **yerel deneme veritabanında** kurulum ve yayın akışlarını doğrular. `tests/browser.cjs` aynı deneme kurulumunda Playwright/Chromium ile görünümü ve editörü kontrol eder. Şifreler ortam değişkenlerinden alınır. Testleri canlı veritabanında çalıştırmayın.

## Örnek görseller ve fontlar

Örnek haber metinleri bu proje için yazılmıştır ve gerçek haber iddiası taşımaz. Tasarım karşılaştırması için kullanılan görseller referans sitenin herkese açık demo görselleridir. Kaynak adresleri `assets/v6/demo/SOURCES.txt` dosyasındadır. Örnek içeriklerin yerine kendi haberlerinizi ve görsellerinizi kullanabilirsiniz.

Roboto fontları `@fontsource/roboto` 5.3.0 paketinden alınmıştır; lisansı `assets/v6/fonts/LICENSE` içindedir.
