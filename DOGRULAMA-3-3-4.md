# Pro 3.3.4 doğrulaması

Testler gerçek uygulama üzerinde, üretim bağlantılarından ayrı yerel SQLite ve MariaDB kurulumlarında yapıldı. Kullanılan hesap ve anahtarlar yerel test değerleridir.

## Veri taşıma

PHP `upload_max_filesize=2M`, `post_max_size=2M`, `memory_limit=64M`, `max_execution_time=10` koşullarında:

- 32 MB’tan büyük SQL, tek uzun INSERT içinde **160.005 kayıt**: 512 KB veya daha küçük isteklerle yükleme ve aşamalı SQL analizi geçti.
- 64 MB’tan büyük ZIP, **5.002 görsel** ve 66 MB tek görsel: parçalı gönderim, aşamalı çıkarım, orijinal dosya SHA-256 / CRC doğrulaması geçti.
- 66 MB doğrudan klasör görseli: PHP tek dosya sınırından küçük parçalarla aktarım geçti.
- CSRF reddi, editörün aktarım erişiminin engellenmesi, tekrarlanan parça bildirimi, kaldığı byte’tan devam, yanlış parça sırası, ZIP dizin geçişi reddi ve veri içermeyen SQL’in açık hata mesajı geçti.
- Tarayıcıda **klasör seçmeden SQL+ZIP**: her ikisi 3 MB’tan büyükken yükleme başladı, yüzde gösterildi ve kapak önizlemede açıldı.
- Gerçek klasör seçimi, alt klasör yolları, görsel dışı dosyaları atlama, 3 MB tek görsel ve 503 kesintisi sonrası hata / devam düğmesi doğrulandı. Tekrar yüklemede kayıtlı yollar çoğalmadı.
- SQL çalıştırılmadan parse edilir. Önizleme, boş eski kategori ID’lerini koruma, dolu ID çakışmalarını eşleştirme, görselleri kapak/içeriğe bağlama, taslak aktarımı, işlem tekrarında haber çoğaltmama ve kullanıcıya özel aktarım erişimi için 18 entegrasyon kontrolü geçti.

Sunucu disk kotası, dosya sistemi ve çalışma kaynakları geçerlidir. Tek SQL kaydının boyutu hâlâ bir isteğin belleğinde işlenir; sınırsız kaynak garantisi verilmez.

## Görünüm ve sosyal medya

Dört tema 320, 390, 768, 900 ve 1440 px genişlikte kontrol edildi: yatay sayfa taşması yok; ana manşette Son Dakika bandı bir kez görünüyor; footer bağlantıları en az 16 px, haber içi sağ sütun başlıkları en az 16 px, blok boşluğu 18 px. Sosyal medya ayarları 320 px’e sığıyor. Profil menüsü isimlerle görünüyor; boş profil listesinde boş bant üretilmiyor. Tarayıcı JavaScript hatası görülmedi.

Sosyal paylaşımın 14 entegrasyon kontrolü geçti: kapalı otomasyon, taslak/demo/gelecek tarih reddi, Facebook ve X istek verisi, API ID kaydı, emoji karakter sınırı, tekrarlama önleme, kuyruğa alınan metni gönderme, açık API hatası, belirsiz sonuçta otomatik tekrar yapmama, taslağa dönen haberi iptal ve kapalı hesap kuyruğunun açık hesabı engellememesi. Hesap anahtarları 0600 özel dosyada saklanır. HTTP kontrollerinde yönetici sayfası, boş şifre alanları, CSRF, geçersiz hesap/haber ve editör erişim reddi doğrulandı.

Gerçek Meta/X hesabına haber gönderilmedi. Canlı API erişimi, plan, anahtar ve izinler hosting üzerinde ayrıca doğrulanmalıdır. Instagram otomatik gönderimi bu sürüme dahil değildir.

Standart/deflate ZIP ve ZIP64 metaverisi, hatalı CRC, görselsiz ZIP, yarım yükleme silme ve aynı dosyayla sıfırdan başlatma için altı ek HTTP kontrolü geçti. Dokuz PHP entegrasyon grubunda toplam **154 kontrol** geçti.

## Paket ve veri koruması

Pro 3.0 ve 3.3.2’den daha önce yükseltilmiş 3.3.3 kurulumlarına gerçek 3.3.4 güncelleme ZIP’i iki kez uygulandı. Orijinal haber, hesap/parola, kategori ID/URL, kaynak, reklam ve ayar snapshot’ları; `.env`, özel bağlantı dosyası ve örnek uploads dosyasının SHA-256 değerleri korundu. Güncel dosya manifesti ayrıca gerçek Pro 3.0 ZIP’ine güncelleme bindirilerek karşılaştırıldı.

Sistem Kontrolü tam paketi tanır; eski veya eksik CSS’i dosya adıyla bildirir ve doğru dosya geri konunca hata kalkar. Üretim `.env`, bağlantı/anahtar dosyaları, geçici SQL/aktarım verisi ve yüklenen medya dağıtım ZIP’lerine konulmaz. ZIP CRC ve SHA-256 kontrolleri uygulanır. Yeni SQL 25 tablo tanımı içerir, kullanıcı parolası veya haber kaydı içermez.

Canlı hosting’e dağıtım yapılmadı. Kullanıcının gerçek eski SQL/uploads arşivi bu çalışma alanında bulunmadığından o şemaya özel eşleştirme yapıldığı iddia edilmez.

Son tam ZIP’ten ayrı, boş SQLite ve SQL’i önceden aktarılmış MariaDB kurulumları açıldı. Her ikisinde kurulum, giriş, CRUD, görsel yükleme, HTML temizleme, yorum, taslak/yayın görünürlüğü ve kurulum kilidi kontrolleri geçti. Anahtar/erişim HTTP testleri hem SQLite hem MySQL’de geçti.
