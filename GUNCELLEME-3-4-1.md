# Reflex Haber Pro 3.4.1 — Panel açılışı düzeltmesi

Mevcut Pro 3.0 ve üzeri siteler için `reflex-haber-pro-3-4-1-tam-guncelleme.zip` kullanın. Yeni cPanel kurulumu için `reflex-haber-pro-3-4-1-cpanel-sql.zip` kullanın.

## Mevcut siteye yükleme

1. cPanel üzerinden site dosyalarını ve veritabanını yedekleyin.
2. Tam güncelleme ZIP’ini `index.php` dosyanızın bulunduğu site köküne yükleyip çıkarın. ZIP içindeki **app, assets ve views** klasörlerini ve kök dosyaları birlikte yenileyin.
3. Mevcut `.env`, `storage/site.php`, `storage/integrations.php` ve `uploads` dosyalarınızı koruyun. Paket bu özel dosyaları içermez. Mevcut siteye boş kurulum SQL’ini aktarmayın.
4. `/panel.php` adresini açın; ardından `/index.php?route=%2Fpanel%2Fsistem-kontrolu` adresinde dosya ve veritabanı kontrollerini yapın. PHP opcache dosya değişikliklerini izlemiyorsa cPanel’den bu sitenin PHP sürecini yeniden başlatın.

## Doğrulanan düzeltme

Veritabanındaki `app_schema` sürümü güncel olduğunda eski kontrol, eksik yardımcı tabloları veya güncelleme sütunlarını fark etmiyordu. Bu durum canlı trafik, istatistik veya iletişim tablosu eksikken panelde genel 500 hata ekranına yol açıyordu.

Panel açılışı artık sürümün yanında gerçek tablo ve güncelleme sütunlarını da denetler. Eksik yardımcı tablolar ve daha önceki güncellemelerin eklediği sütunlar, mevcut kayıtlar silinmeden idempotent şema güncellemesiyle tamamlanır. Haber/kullanıcı arşivinin temel tabloları eksikse boş arşiv oluşturulmaz; yedekten geri yükleme gerekir. Yeniden oluşturulan yardımcı tablo, kaybolmuş eski istatistik veya kayıtları geri getirmez.

Tema düzenleri, ilk dört tema, eklenen 5–8 temaları, SQL/görsel taşıma, bot kaynakları ve sosyal medya ayarları korunmuştur.

## Hata sürerse

Ekranda 12 karakterli **Hata kodu** görünür. Aynı kodu `storage/logs/app.log` içinde bulun. Kayıt; hata sınıfı, SQLSTATE/sürücü kodu, eksik uygulama tablosu/sütunu veya dosyası ve kod konumlarını içerir. Parolalar, API anahtarları, SQL parametreleri, ziyaretçi bilgileri ve ham hata mesajları kaydedilmez. Dosya günlüğü yazılamıyorsa kayıt PHP `error_log` çıktısına gönderilir.

Bu düzeltme yerel test ortamında doğrulanmıştır. `yesilbeyazbursa.com` sunucusuna erişim ve canlı hata kaydı mevcut olmadığı için canlı sitedeki kesin hata nedeni veya güncelleme sonrası sonuç henüz doğrulanmamıştır.
