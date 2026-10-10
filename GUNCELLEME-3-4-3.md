# Reflex Haber Pro 3.4.3 — Aktarım kaydı ve kategori düzenleri

Gönderilen `acae17044721` kaydı `migration_rows()` içinde `JsonException`, kod 3 gösteriyordu. PHP append akışında `ftell()` toplam dosya uzunluğu yerine yeni yazılan bölümün uzunluğunu döndürüyordu. Bir sonraki SQL incelemesinde JSONL dosyasının bu yanlış uzunluğa kesilmesi, önizlemeyi bozan kontrol karakteri hatası oluşturabiliyordu. Bu davranış gerçek PHP ile yeniden üretildi.

Yazımdan önce gerçek dosya sonuna gidilir; kayıt ilerlemesi artık mutlak bayt konumunu saklar. Eski, tamamlanmamış aktarımlar yüklenmiş orijinal SQL’den yeniden incelenir. Görsel eşleştirmeleri, alan seçimleri, kategori hedefleri ve aktarılmış taslakların ilerlemesi korunur. Yeni SQL yüklemesi veya veritabanını sıfırlama gerekmez.

## Mevcut siteye uygulama

1. Site dosyaları ve veritabanını yedekleyin. `reflex-haber-pro-3-4-3-tam-guncelleme.zip` dosyasını bu alan adının gerçek `index.php` klasörüne çıkarıp dosyaları yenileyin. Paket `.env`, `storage/site.php`, `storage/integrations.php`, aktarım SQL’leri, görseller ve hesaplar içermez. Mevcut siteye boş SQL şemasını yüklemeyin.
2. Eski PHP kodu önbellekte kalmışsa mevcut yönetici oturumuyla `/reflex-panel-kurtarma-343.php` adresini açın ve **Güncelleme önbelleğini yenile** düğmesine basın. Araç yalnız manifestteki bu siteye ait PHP dosyalarını yeniler. Tam paket doğrulanmadan işlem yapmaz; genel OPcache sıfırlaması yapmaz. Tamamlandıktan sonra bu isteğe bağlı araç kaldırılabilir.
3. Panel → Veri Taşıma → Son aktarımlar’dan **aynı aktarımı** açın. Eski bozuk geçici kayıtlar için **SQL incelemesine devam et** düğmesine basın. Orijinal SQL kullanılır; aynı dosyayı veya görselleri yeniden yüklemeyin.
4. İnceleme tamamlanınca önceki eşleştirme/önizleme veya devam eden aktarım ekranı açılır. Önizlemeyi kontrol ederek devam edin. Haberler taslak kalır; otomatik yayımlanmaz ve önceden aktarılmış haberler çoğaltılmaz.
5. Sistem Kontrolü’nde **3.4.3 / Güncelleme dosyaları eksiksiz** kontrolünü yapın.

## 5–8 temalarının kategori yapıları

Dört gerçek ana sayfa ve kategori sayfası HTTP 200 ile okunup yapıları karşılaştırıldı. Eski uygulamada bu temalar kategori blokları ve kategori arşivleri için aynı ortak şablonu kullanıyordu. Otomatik düzenler ayrıldı:

| Tema | Ana sayfa kategori düzeni |
| --- | --- |
| 5 · Medyabar | Dörtlü haber kartları ve yerel haber akışı |
| 6 · İmza Gazetesi | Büyük haber + dört küçük kart; spor için üç sütun |
| 7 · Kulga | Büyük vitrin + iki yan haber; altında üçlü haberler |
| 8 · EsenHaber Demo 3 | Gündem/ekonomi üçlü kartlar, politika/magazin çift büyük haber, teknoloji/sağlık listeleri |

Kategori arşivleri tema profiliyle açılır. Manşette görünen haber aynı sayfanın alt listesinde yeniden gösterilmez. Haber içi ölçüler ve sağ sütun 5–8 temalarında uyarlanmıştır. Panelden seçilen kategori görünürlüğü, sırası ve elle seçilen düzen kullanılmaya devam eder. Kaynak sitelerin kategori adları/ID’leri mevcut veritabanınıza yazılmaz; kendi kategorileriniz korunur. İlk dört temanın ana sayfa şablonları ve temel tema CSS’i korunmuştur.

Kaynakların HTML yapıları doğrulanmıştır. Özellikle İmza’nın `s.tblsm.com` CSS/fontları ve bazı kaynakların dış CDN görselleri bu bulut ortamında ağ engeline takıldı. Bu yüzden birebir görsel eşleşme iddiası yoktur. Gerekli CDN adresleri geliştirme ortamı ağ taslağına eklendi; yayımlanıp erişim sağlanınca tam görsel karşılaştırma yapılabilir. Tema güncellemesi kapalı kaynak yazılımın kopyası değildir; kendi sistemimizin bağımsız şablonlarıdır.

Canlı hosting dosyaları ve veritabanına erişilmedi. Düzeltme ve kurtarma gerçek PHP, SQLite ve MariaDB yerel testlerinde doğrulandı; canlı uygulama sonucu güncellemeden sonra kontrol edilmelidir.
