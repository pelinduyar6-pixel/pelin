# Reflex Haber Pro 3.0 güncelleme

Bu küçük ZIP yalnızca Pro 2.x sürümü içindir. Daha eski Demo 6 PHP sürümü, sürümü belirsiz mevcut PHP kurulumu veya yeni kurulum için tam 4 tema ZIP’ini kullanın. Tam ZIP de özel bağlantı dosyalarını içermez; güncellerken mevcut storage/site.php, storage/integrations.php ve uploads içeriğini koruyun.

1. Hostingden veritabanı yedeğinizi indirin. `storage/site.php`, varsa `storage/integrations.php` ve `uploads` klasörünü yedekleyin.
2. Güncelleme ZIP’indeki dosyaları **mevcut sitenin bulunduğu klasöre** açın; aynı isimli uygulama dosyalarının üzerine yazın. Gizli `.htaccess` dosyalarını da yükleyin.
3. **storage/site.php, storage/integrations.php ve uploads içeriğini silmeyin.** Paket bu özel dosyaları içermez. Yeniden kurulum yapmayın.
4. Siteyi veya paneli açın. 3.0 alanları ve yeni tablolar otomatik eklenir. Mevcut haberler, kullanıcılar, şifreler, bağlantı bilgileri ve görseller korunur. MySQL kullanıcısında CREATE/ALTER yetkileri gerekir.
5. Panelde şu alanları ayarlayın:
   - **Piyasalar:** bandı açık tutun; değerleri elle girin veya otomatik kaynağı seçin. Beş alan: dolar, euro, altın, BIST ve Bitcoin.
   - **Üst Bant & Son Dakika:** il, hava durumu, kayma hızı, yanıp sönme ve manşet geçişi.
   - **Makaleler / Köşe Yazıları:** Makale Ekle; yazar, durum ve yayın zamanı seçin.
   - **API Merkezi:** OpenAI anahtarınızı bir kez kaydedin. Diğer AI bölümleri aynı anahtarı kullanır.
   - **Ajans Botları / RSS Haber Botları:** yetkili abonelik adreslerini, giriş bilgilerini, kaynak/kategori, aralık ve taslak/yayın durumunu girin; bağlantıyı test edin.
   - **Lig & Puan Durumu:** gerçek sezon tablosunu girin veya API-Football anahtarınızla güncelleyin.
   - **Google Merkezi / Sitemap Kodları:** kendi Google kimliklerinizi kaydedin ve ana sitemap adresini Search Console’a ekleyin.
6. Otomatik bot, hava ve piyasa güncellemesi için hostingin cron görevini 5 dakikada bir çalıştırın. Gerçek PHP/proje yolunu kullanın:

```cron
*/5 * * * * /usr/local/bin/php /home/HESAP/public_html/cron.php
```

Yeni bölüm ve modüller aynı panel menüsündedir. İletişim formu mesajları **Gelen Kutusu**’na düşer. Yeni SQL dosyası 22 tablo içerir; **mevcut kurulumda SQL içe aktarmak gerekmez**, uygulama alanları kendisi ekler.

Ajansların özel SOAP/token/giriş protokolleri, verdikleri teknik belgeyle ayrıca uyarlanmalıdır. Genel RSS/Atom/JSON ve HTTP Basic/Bearer bağlantı desteği hazırdır. API-Football, OpenAI ve piyasa sağlayıcınızın kendi anahtar/abonelik izinleri gerekir.

Yerel MySQL ve SQLite işlevleri, eski sürümden veri koruyan güncelleme ve dört temanın mobil görünümü test edildi. Gerçek sunucuda dağıtım veya abonelik hesabıyla canlı API testi yapılmadı. Eski Laravel paketinin üzerine bu ZIP’i açmayın; tablo yapıları farklıdır.
