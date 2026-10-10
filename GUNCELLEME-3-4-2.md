# Reflex Haber Pro 3.4.2 — Sosyal medya modülü ve PHP önbelleği

Gönderilen sunucu günlüğünde tekrar eden `Error ... app/admin-pro.php:19` kaydı vardı. Paketin bu satırı `social_admin_dispatch()` çağrısıdır. Sosyal medya modülünü yüklemeyen eski/eksik başlatıcıyla aynı sınıf ve satırda tanımsız fonksiyon hatası yerel testte oluşturuldu.

Çağrıyı yapan yönetim dosyası artık kendi sosyal medya modülünü açıkça yükler. 3.4.1’deki eksik tablo/sütun denetimi ve güvenli hata kodları korunmuştur. İlk dört tema ve eklenen 5–8 temaları değiştirilmemiştir.

## Mevcut sitenize uygulama

1. Site dosyalarını ve veritabanını yedekleyin.
2. `reflex-haber-pro-3-4-2-tam-guncelleme.zip` dosyasını bu alan adının `index.php` dosyasının bulunduğu klasöre çıkarın. **app, assets, views ve kök PHP dosyaları birlikte** yenilenmelidir. Mevcut `.env`, `storage/site.php`, `storage/integrations.php` ve `uploads` özel dosyaları paket dışında bırakılmıştır. Mevcut siteye boş kurulum SQL’i aktarmayın.
3. `/reflex-panel-kurtarma-342.php` adresini açın. Ekran gerçek disk sürümünü, dosya hash’lerini, gerekli PHP uzantılarını ve OPcache ayarlarını gösterir.
4. Mevcut yönetici hesabınızla giriş yaptıktan sonra kurtarma ekranında **Güncelleme önbelleğini yenile** düğmesine basın. Giriş sonrası panel hata verse bile giriş oturumu oluşmuş olabilir; kurtarma ekranını tekrar açın. Yenileme yalnız etkin yönetici hesabı ve CSRF doğrulamasıyla, manifestteki bu siteye ait PHP dosyalarına uygulanır; genel OPcache sıfırlaması yapılmaz. Haberler, görseller, ayarlar veya veritabanı kayıtları değiştirilmez.
5. `/panel.php` adresini yeniden açın. Sistem Kontrolü’nde Pro 3.4.2 ve dosyaların eksiksiz olduğunu doğrulayın. İşlem tamamlandığında yalnız `reflex-panel-kurtarma-342.php` dosyasını kaldırabilirsiniz. İsteğe bağlı kurtarma aracı uygulamanın zorunlu dosya manifesti dışında bırakılmıştır.

Disk dosyaları eksik/farklıysa kurtarma aracı önbellek yenilemesini reddeder ve dosyaları listeler. Hosting OPcache işlevlerini kısıtlıyorsa, yalnız bu sitenin PHP sürecini yeniden başlatmasını hosting desteğinden isteyin. PHP 8.1 veya üzeri gereklidir.

## Yeni cPanel kurulumu

Yeni site için `reflex-haber-pro-3-4-2-cpanel-sql.zip` kullanın. SQL 25 boş tablo tanımı içerir; `/kurulum.php` ile kendi yönetici hesabınızı oluşturun.

## Tanı ve sınır

Eski gönderilen günlük, ham hata mesajını içermiyordu. Satır/sınıf eşleşen kusur yerelde doğrulanmıştır; canlı sunucuda dosyalar veya OPcache henüz doğrudan denetlenmemiştir. Canlı güncelleme sonucu kullanıcı tarafından kurtarma ekranı ve panel açılışıyla doğrulanmalıdır. Devam eden hatalar yeni ekrandaki Hata koduyla `storage/logs/app.log` veya PHP error_log’da ayırt edilir; parolalar, API anahtarları ve ham SQL parametreleri günlüğe yazılmaz.
