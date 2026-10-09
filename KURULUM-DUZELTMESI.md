# 9 Ekim 2026 · Kurulum düzeltmesi

Bu küçük paket son gönderilen **Reflex Haber Pro dört tema** PHP paketine uygulanır. Eski Laravel paketi için değildir. Güncel tam Pro ZIP'i de bu düzeltmeleri içerir.

## Uygulama

1. Mevcut uygulama dosyalarınızın ve veritabanınızın yedeğini alın.
2. `reflex-haber-kurulum-duzeltmesi.zip` içindekileri sitenizin `index.php` dosyasının bulunduğu klasöre açın. `kurulum.php`, `cron.php` ve `app` içindeki dosyaların üzerine yazın. `app` klasörünü tamamen silmeyin.
3. **storage/site.php, storage/integrations.php, uploads ve mevcut veritabanını koruyun.** Düzeltme ZIP'i bunları içermez.
4. Kurulum henüz tamamlanmadıysa `/kurulum.php` sayfasını yenileyin. Veritabanı bağlantısını test et düğmesi artık açık hata kodu verir. Test sonrası güvenlik için şifreler yeniden girilir.
5. `storage/site.php` varsa kurulumu yeniden başlatmayın, siteyi/paneli açın. Bu dosya eksik fakat veritabanında Reflex Haber hesapları varsa mevcut yönetici hesabını doğrulayarak Mevcut kurulumu bağla seçeneğini kullanın. Yeni ve boş Reflex Haber kurulumu için Kurulumu tamamla düğmesini kullanın.

## Hosting veritabanı ayarları

- **1045:** Kullanıcı adı/şifre ile MySQL girişi reddedildi. Hosting → MySQL Veritabanları → kullanıcı şifresini kontrol edin veya yeniden belirleyin. Tam kullanıcı adını hesap ön ekiyle yazın. Kuruluma MySQL kullanıcısının şifresini girin; bu, haber paneli yönetici şifresinden ayrıdır.
- **1044:** Kullanıcının seçilen veritabanına erişim yetkisi yok. Hosting → Veritabanına Kullanıcı Ekle → doğru kullanıcı/veritabanını seçin → Tüm Yetkiler → kaydedin.
- **1142:** Bağlantı var ama tablo oluşturma/değiştirme gibi işlemler yetkisiz. İlgili veritabanı için gerekli yetkileri tamamlayın.
- **1049:** Veritabanı adı yanlış veya veritabanı oluşturulmamış. Hostingdeki tam adı hesap ön ekiyle kullanın.
- **2002/2003:** MySQL sunucusu/portu/soketine ulaşılamıyor. Hosting sağlayıcısının verdiği adresi kullanın. Sağlayıcı farklı bilgi vermediyse localhost / 3306 kullanılır.

Yeni kod yanlış hosting şifresini veya MySQL yetkisini kendi kendine değiştiremez. Bu bilgilerin hosting panelinde düzeltilmesi gerekir. Şifreleri sohbette veya destek ekran görüntüsünde paylaşmayın.

## Değişen dosyalar

- `kurulum.php`: ayrı bağlantı testi, güvenli hata açıklamaları ve mevcut kuruluma doğrulanmış yeniden bağlama.
- `app/installer-support.php`: hata sınıflandırması, mevcut yönetici doğrulaması, özel izinli geçici ayar dosyası.
- `app/core.php`, `app/bootstrap.php`, `cron.php`: kurulum kaydedilirken site/cron isteklerinin beklemesi.

Ayar dosyası kaydedilemezse yeni kurulumun hesap/haber kayıtları geri alınır ve geçici parola dosyası temizlenir. Yeniden bağlama yeni haber/hesap oluşturmaz ve mevcut parolayı değiştirmez. Unutulmuş yönetici parolasını sıfırlamaz.

Gerçek yerel MariaDB ve SQLite üzerinde giriş/yetki hataları, dosya kaydetme başarısızlığı, tekrar deneme, veri koruma, kurulum kilidi ve site/panel haber-yayın işlevleri test edildi. Canlı hostinginize yükleme veya MySQL yetki değişikliği yapılmadı.
