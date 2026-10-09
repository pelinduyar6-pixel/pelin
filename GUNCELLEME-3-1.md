# Reflex Haber Pro 3.1 güncelleme

**Mevcut çalışan Pro 3.0 kurulumu:**

1. Hostingde proje klasörünü ve veritabanını yedekleyin.
2. `reflex-haber-pro-3-1-guncelleme.zip` içeriğini bilgisayarınızda çıkarın. İçindeki `app`, `assets`, `views`, `database` ve belge dosyalarını sitenizin `index.php` dosyasının bulunduğu klasöre yükleyin; uygulama dosyaları için üzerine yazmayı seçin.
3. Mevcut `.env`, `storage/site.php`, `storage/integrations.php`, diğer `storage` verileriniz ve `uploads` dosyalarınızı koruyun. Bu küçük ZIP özel dosyaları içermez.
4. Paneli açın. 3.1 sütunları otomatik eklenir; haberleriniz, yazarlarınız, hesaplarınız ve API ayarlarınız korunur. Veritabanı kullanıcınızda CREATE/ALTER yetkileri olmalı.
5. Tarayıcıda Ctrl+F5 ile yenileyin. SQL’i tekrar içe aktarmayın ve `/kurulum.php` ile yeniden kurulum yapmayın.

**Pro 2.x, daha eski veya sürümü belirsiz mevcut PHP sitesi:** Tam `reflex-haber-pro-4-tema.zip` içindeki uygulama dosyalarını aynı proje köküne yükleyin. Gerçek `.env`, `storage` ve `uploads` dosyalarınızı silmeyin. Kurulu siteyi tekrar kurmayın; mevcut veritabanı uygulama açılışında güncellenir. Farklı tablo yapısına sahip başka yazılımdan otomatik veri dönüştürme yapılmaz.

**Sıfır kurulum:** Tam ZIP'i çıkarın; proje kökündeki tüm dosyaları ve gizli `.htaccess` dosyalarını hostingde site klasörüne yükleyin. `/kurulum.php` ile kendi veritabanınıza bağlanıp kendi yönetici hesabınızı oluşturun. SQL isteyen hostinglerde paketin `database/reflex-haber-pro.sql` dosyası veya ayrı SQL ZIP'i kullanılabilir; yönetici hesabı oluşturmak için yine kurulum ekranını tamamlayın.

## Panelde kullanacağınız yerler

- **Header / Üst Bant ve Son Dakika:** şehir, bant rengi/hızı, yanıp sönme ve 3 saniyelik manşet süresi.
- **Makaleler ve Köşe Yazıları:** yazar seçip yayımlayın; orta yazar kaydırıcısı son makaleyi gösterir.
- **Piyasalar:** değerleri ve yüzde değişimleri girin veya kaynağı seçip kaydedin, ardından şimdi güncelle/test et. TCMB dolar/euro ve CoinGecko Bitcoin sağlar; altın/BIST için kendi veri kaynağınızı seçin.
- **Haber Botları:** kaynak URL’si, otomatik/RSS/sayfa biçimi, tam metin seçeneği, kategori, taslak/yayın ve çalışma süresi. Önce bağlantıyı test edin.
- **Türkiye Gündem Merkezi:** TRT/NTV/CNN Türk/Sözcü seçimlerini kaydedip tarayın. Haber satırında AI + SEO hazırla, sonra önizleme/editör. OpenAI anahtarını yalnızca **API Merkezi**'nde girin.
- **Yeni haber / makale:** SEO doldurma, PDF/video yükleme ve video embed alanları.

Dört kaynağın gerçek RSS kayıtları ayrıştırıldı. Uygulamanın güvenli DNS denetimi bu bulut makinesinde çözümlenemediği için bağlantıları hostinginizde panelden test edin. Kaynak adresi değişirse panelden güncellenebilir. Zamanlı bot için hosting cron gerekir. Bu paket canlı sunucuya kendiliğinden yüklenmez.
