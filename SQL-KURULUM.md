# Reflex Haber Pro · SQL içe aktarma

1. phpMyAdmin'i açın. Sol menüden bu site için kullanacağınız MySQL veritabanını seçin. Önce mevcut verilerin yedeğini alın.
2. Üst menüden **İçe aktar (Import)** seçeneğine tıklayın.
3. **Dosya seç** ile bu paketteki `reflex-haber-pro.sql` dosyasını seçin. Biçim SQL, karakter kodlaması UTF-8 olsun.
4. **Git/Uygula (Go)** düğmesine basın. Yeni veritabanında 22 adet `rh6_` tablosu oluşur.
5. Sitenizde `/kurulum.php` sayfasını açın. Aynı veritabanının tam adını, MySQL kullanıcısını ve şifresini girin. Kendi yönetici e-postanızı ve şifrenizi belirleyip kurulumu tamamlayın. İsterseniz örnek haberleri ekleyin.

Kurulum sayfası tabloları kendisi de oluşturabilir. SQL dosyası phpMyAdmin üzerinden önceden oluşturmak isteyenler içindir. SQL tek başına yönetici hesabı, bağlantı dosyası veya örnek içerik oluşturmaz; bunlar kurulumda hazırlanır.

Mevcut Reflex Haber hesapları/verileri varsa tabloları silmeyin, yeniden hesap oluşturmayın. `storage/site.php` varsa normal site/paneli açın. Bu dosya kaybolmuşsa güncel kurulum sayfasındaki **Mevcut kurulumu bağla** seçeneğini mevcut yönetici e-posta/şifresiyle kullanın.

Dosya CREATE TABLE IF NOT EXISTS kullanır; DROP/DELETE/TRUNCATE, parola, API anahtarı veya canlı veriler içermez. Mevcut tabloların alanlarını değiştirmez ve eski Laravel verilerini dönüştürmez. SQL dosyasını web köküne yüklemeniz gerekmez; doğrudan bilgisayarınızdan phpMyAdmin'e seçin.

**1044:** Hosting → MySQL Veritabanları → kullanıcıyı doğru veritabanına ekleyin → Tüm Yetkiler.

**1045:** MySQL kullanıcı adını hesap ön ekiyle birlikte kullanın ve hosting panelinden bu kullanıcının şifresini doğrulayın/yeniden belirleyin. MySQL şifresi ile haber yönetim paneli şifresi farklıdır. SQL içe aktarma bu erişim sorunlarını gidermez.

22 tablonun alanları ve indeksleri uygulamanın oluşturduğu MySQL şemasıyla karşılaştırıldı. Yerel MariaDB üzerinde SQL içe aktarma, ardından web kurulum/yönetici girişi ve haber yayınlama akışı doğrulandı. Canlı hostinginizde işlem yapılmadı.
