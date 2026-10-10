# Pro 3.4.1-r1 onarım doğrulaması

Bu paket 3.4.1 tabanlıdır. Panel ve ilk dört temanın stilleri korunur. Temalar 5–8, kullanıcının son açıklamasına uygun olarak kendi referanslarının farklı kategori profillerini kullanır. İlk dört temanın alt kategori şablonunu kullanmazlar. Üretim hostingine veya veritabanına erişilmedi.

## Gönderilen hata

`app (3).log` içindeki `920c0e9b24ee` kaydı, `JsonException`, kod 3, `migration.php:86`, `admin-migration.php:42` gösterir. Orijinal 3.4.1/3.4.2 arşivlerinde ekran çağrısı 42. satırdadır; 3.4.3 arşivinde 48. satırdadır. Bu fark eski kodun çalıştığına işaret eder. Canlı sunucuda eski dosya, farklı web kökü veya OPcache seçeneklerinden hangisinin devrede olduğu uzaktan doğrulanmamıştır.

Yerel PHP 8.4 OPcache, dosya değişikliklerini denetlemeyecek şekilde çalıştırıldı. Eski bozuk JSONL önizlemesi aynı istisna türü/kodu ve eski 42. satırı üretti. Dört seçenekli eski tema ekranı da önbelleğe alındı. **Gerçek onarım ZIP’i çıkarılınca eski hata ve dört tema görünümü devam etti.** Bağımsız yeni araç diskteki doğru paket ve sekiz temayı tespit etti. Yönetici/CSRF doğrulamalı, bu siteye ait PHP dosyalarının yenilenmesi sonrası sekiz seçenek açıldı; aynı SQL ve görsel tekrar yüklenmeden aynı aktarım önizlemeye döndü.

Bu akışta 17 kontrol geçti. Kaynak SQL/görsel/alan seçimleri/ilerleme korunurken mevcut haberler, kullanıcı/parola özetleri, kategori ID’leri, ayarlar ve özel yapılandırma değişmedi. Manifest dışı bir önbellek dosyası yenilenmedi; anonim veya hatalı CSRF isteği reddedildi.

## Diğer kontroller

- Yeni SQLite ve MariaDB kurulumlarında ayrı ayrı 30 HTTP işlev kontrolü geçti.
- SQL alan/kategori eşleştirme, ayrı görsel ZIP’i, taslak aktarımı ve erişim kontrolü için her veritabanında 15 HTTP kontrolü geçti.
- Her veritabanında 7 bozuk önizleme/yarım aktarım kurtarma kontrolü geçti. 1.105 kaynak kayıtta 18 taslak korundu; tekrar aktarım veya kendiliğinden yayın olmadı.
- Append konumu, devam eden SQL incelemesi ve eski kayıtların yeniden hazırlanması için 10 CLI kontrolü geçti.
- Temalar 5–8’in seçim, kaydetme, manşet, mobil/masaüstü ve içerik akışında 164 tarayıcı kontrolü geçti. Son kategori profillerinde 320/390/768/1440 piksel, kategori/ilgili haber/sütun ölçüleri, panel görünürlüğü, kategori ID ve hesap korunması için ayrıca 126 kontrol geçti.
- SQLite ve MariaDB’de eksik/farklı paket dosyalarının tespiti, yetkilendirme ve çalışan sürüm bilgisi için altışar HTTP kontrolü geçti.
- 123 PHP dosyasının sözdizimi geçti. 3.4.1 panel/ilk dört tema stilleri ve etkilenmeyen görünümleriyle 189 arşiv girdisi bayt düzeyinde aynı kaldı. Yalnız temasına göre yönlendirme yapan ortak girişlerde 5–8 için yeni şablon çağrısı eklendi.
- Gerçek onarım ZIP’i mevcut yerel Pro 3.4.3 SQLite kurulumuna iki kez uygulandı; hesaplar/parola özetleri/haberler/kategori ID’leri/ayarlar/özel yapılandırma ve yüklenmiş dosyalar korundu.
- Güncelleme ZIP’i gerçek Pro 3.0 ve Pro 3.4.3 tam arşivlerinin üzerine uygulandığında tüm çalışma zamanı SHA-256 manifesti doğrulandı. Özel yapılandırma, kullanıcı verisi, günlükler, yüklenen SQL ve görseller ZIP dışında kaldı.

Dört referansın ana sayfa/kategori HTML yapıları incelendi. Bazı CDN CSS/font/görsel dosyalarının erişimi engellendiğinden birebir görsel eşleşme iddiası yoktur. Canlı siteye yükleme yapılmadı; sonuç diskteki ve çalışan sürüm kontrolüyle orada doğrulanmalıdır.
