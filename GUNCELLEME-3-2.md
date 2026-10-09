# Reflex Haber Pro 3.2 güncelleme

## Çalışan Pro 3.1 siteniz için

1. Hostingde dosyaların ve veritabanının yedeğini alın.
2. `reflex-haber-pro-3-2-guncelleme.zip` dosyasını çıkarın. İçindeki `app`, `assets`, `views`, `cron.php` ve belge dosyalarını mevcut `index.php` dosyanızın bulunduğu proje köküne yükleyin; bu uygulama dosyalarının üzerine yazın.
3. **Mevcut `.env`, `storage/site.php`, `storage/integrations.php`, diğer `storage` verileri ve `uploads` dosyalarını koruyun.** Küçük güncelleme ZIP’i bu özel dosyaları içermez.
4. Paneli açın, tarayıcıda Ctrl+F5 yapın. Yeni ayarlar otomatik hazırlanır. **SQL’i yeniden içe aktarmayın; kurulum ekranını tekrar çalıştırmayın.** Haberler, hesaplar, API anahtarları ve yüklenen dosyalar korunur.

Bu küçük paket yalnızca Pro 3.1’den Pro 3.2’ye geçiş içindir. Pro 3.0, 2.x veya sürümü belirsiz mevcut PHP sitesinde tam `reflex-haber-pro-4-tema.zip` içindeki uygulama dosyalarını kullanın; yine özel dosyaları koruyun. Başka yazılım/Laravel veritabanı otomatik dönüştürülmez.

Yeni kurulumda tam ZIP’i boş klasöre çıkarın; `/kurulum.php` ile veritabanı ve kendi yönetici hesabınızı oluşturun. SQL dosyası yalnızca tablo yapısını önceden oluşturmak isteyenler içindir.

## Yeni panel kontrolleri

- **Ana Sayfa & Kategoriler:** ana sayfada gösterilecek kategoriler, sıra ve görünüm. Otomatik görünüm Tema 1’de büyük haber + dört kart, Tema 2’de vitrin, Tema 3’te mozaik, Tema 4’te kompakt akış kullanır. Magazin ve teknoloji özel renk/görsel düzenlerine sahiptir. Ana sayfadan kapatılan kategori menüde ve arşivinde kalır; yeni kategoriler varsayılan olarak açıktır. Haberi olmayan kategori boş kartlarla doldurulmaz.
- **Piyasalar:** otomatik kaynak için **Sözcü fiyatları + NTV BIST 100** seçin, kaydedin ve şimdi güncelle/test et düğmesini kullanın. Beş kalem ve değişim oranları okunur; Sözcü Bitcoin’i **USDT** olarak yayımlar. TCMB + CoinGecko seçeneğinde Bitcoin **TRY**, dolar/euro günlük referans kurudur; altın/BIST bu modda ayrıca güncellenmez. Özel JSON kaynağı ve elle giriş korunmuştur. Otomatik ayar kaydı fiyatları silmez.
- **Lig & Puan Durumu:** **NTV Spor puan tablosu** anahtar gerektirmez. API-Football seçeneği mevcut özel anahtarınızı/sezon erişiminizi kullanır. Kaynağı seçip kaydedin; şimdi güncelle düğmesi bağlantıyı test eder. Son başarılı tablo kesintide korunur.
- Varsayılan yenileme: piyasalar **10 dakika**, lig **15 dakika**. Ana sayfa açıkken arka planda kontrol edilir; kayıtlı yenileme aralığı dolmadan sağlayıcıya yeniden gidilmez. Ziyaretçi olmadan da güncellemek için mevcut hosting cron görevini **5 dakikada bir** çalıştırın. Görev bağlantısı/token panelin Haber Botları ekranındadır; token’ı paylaşmayın.
- Piyasalar dört temada **yazarların hemen altındadır**. Yazarlar kapatılırsa orta içerik başlangıcında görünür. Üst manşetlerdeki dikey Son Dakika şeridi kaldırılmıştır; üst kayan son dakika bandı bağımsız olarak çalışır.
- **Haber Yönetimi:** kategori/tür/durum/başlık filtreleri, ID, kapak, kaynak, okunma, yayın tarihi, SEO puanı ve konum düğmeleri. Ü: üst manşet, A: ana manşet, S: son dakika, Ö: öne çıkan, H: kutu haber. Konum düğmeleri kayıtlı seçimi değiştirir.
- **Toplu işlemler:** bu sayfadaki kayıtları seç veya filtredeki tüm kayıtları uygula. Silme için **SİL** onayı gerekir. Filtre temizken “tüm kayıtlar” bütün ilgili modülü kapsar. Kendi yönetici hesabınız silinemez; kullanıcı listesindeki tümünü sil işleminde yönetici hesapları korunur. Editörler yalnızca seçilen haberlere toplu işlem yapabilir. Silme medya dosyalarını kaldırmaz; ilişkili yorum ve tepkiler haberle birlikte silinir. Bot tekrar denetim geçmişi korunur.
- **Yeni haber / makale:** bölüm bağlantıları, içerik/medya/SEO alanları, yayın sütunu ve sabit kaydetme çubuğu. PDF, video, embed, canlı SEO ve merkezi AI çalışmaya devam eder.
- **Reklam Alanları:** kampanya özeti, yerleşim şeması, görsel önizleme, özel kod şablonları; cihaz/konum/tarih/öncelik sütunu ve toplu yönetim.
- **Footer:** gündem/ekonomi/spor haber bağlantıları, sosyal bant, logo ve kategori/servis/hakkımızda sütunları. Ayrı footer logosu ve gerçek uygulama mağazası adresleri **Tema ve Logo** ekranındadır. Adres girilmeyen mağaza rozeti görünmez; sosyal adresleri Genel Ayarlar’dan ekleyin.

## Doğrulama

Gerçek Sözcü piyasa bandı, NTV BIST kartı ve NTV’nin 18 takımlı Süper Lig yanıtı okunup ayrıştırıldı. Bu veriler ZIP’e sabit fiyat/puan olarak konulmaz. Kaynaklar gecikmeli veri yayımlayabilir; alım zamanı son kaynağa erişim zamanıdır. Kaynak biçimi veya erişimi değişirse önceki veri korunur; durum panelde gösterilir.

Bulut makinesinde HTTP istekleri proxy üzerinden doğrulandı. PHP’nin DNS pinleme denetimi bu makinede dış alan adlarını çözemiyor; koruma kapatılmadı. Hostingde panelin güncelle/test düğmeleriyle bağlantıyı kontrol edin. Canlı hostinginize yükleme yapılmadı.

SQLite ve MySQL üzerinde kategori ayarları, toplu işlemler, CSRF/yetki sınırları ve medya/SEO kontrolleri; dört tema ve yönetim ekranları 320–1440 pikselde doğrulandı. Pro 3.1 → 3.2 güncelleme özel dosyalar/veriler korunarak test edildi. Kurulum şeması 22 tablodur.
