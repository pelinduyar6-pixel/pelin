# Reflex Haber · Demo 6 · Yeni proje

Demo 6 referansının düzenine göre sıfırdan hazırlanmış PHP haber portalı ve yönetim paneli.

**[Yeni proje ZIP’ini indir — 7,5 MB](https://github.com/pelinduyar6-pixel/pelin/raw/refs/heads/main/downloads/reflex-haber-demo6-sifirdan.zip)**

- [Kurulum adımları](KURULUM.md)
- [Ana sayfa görünümü](previews/demo6-ana-sayfa.png)
- [Mobil görünüm](previews/demo6-mobil.png)
- [Yönetim paneli görünümü](previews/demo6-panel.png)
- [ZIP SHA-256](downloads/reflex-haber-demo6-sifirdan.zip.sha256)

## Kurulum

PHP **8.1+**, PDO MySQL, DOM, Fileinfo ve Mbstring gerekir. Dosyaları sunucuda yeni ve boş bir klasöre açın. Hosting panelinden MySQL veritabanı ve yetkili kullanıcı oluşturun. Tarayıcıda bu klasördeki **`kurulum.php`** adresini açıp bağlantı bilgilerini ve kendi yönetici e-posta/şifrenizi girin.

Panel adresi **`panel.php`**. Tasarımın örnek haberlerle dolu görünmesi için kurulumda örnek içerik seçeneğini açık bırakın. Örnek haber ve yazarlar daha sonra panelden kaldırılabilir.

Bu yeni proje `.env`, Composer veya `vendor` kullanmaz. ZIP’te gerçek sunucu şifreleri, kurulu veritabanı, oturumlar veya günlükler yoktur. Önceki arşivler `downloads` dizininde korunmuştur; güncel kurulum yukarıdaki **sifirdan** paketidir.

## Doğrulama

Yerel PHP 8.4.24/MariaDB 11.8 ve alt klasörde SQLite kurulumu test edildi. Haber işlemleri, görsel ve galeri yükleme, taslak gizliliği, otomatik planlı yayın, yorum onayı ve editör yetkileri doğrulandı. Chromium ile 320–1440 piksel genişliklerde görünüm ve yayınlama işlemleri kontrol edildi. Teslim ZIP’i ayrıca açılıp yeniden kurulup test edildi. Canlı hosting sunucusuna dağıtım yapılmadı.

Referans: https://esenhaber.cizoglubilisim.com/demo6/
