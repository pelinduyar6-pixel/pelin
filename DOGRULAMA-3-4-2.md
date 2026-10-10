# Pro 3.4.2 doğrulaması

Gönderilen sunucu günlüğünde tekrarlanan `Error ... app/admin-pro.php:19` kaydı, modülü yüklemeyen başlatıcıyla yerel testte aynı hata sınıfı ve satırda oluşturuldu. Güvenli yeni günlük, eksik işlevi `social_admin_dispatch` olarak doğruladı. Dispatcher kendi modülünü açıkça yükleyince panel/haberler/tema/sosyal medya açıldı.

Gerçek PHP OPcache, `validate_timestamps=0` ve `enable_cli=1` ile etkinleştirildi. İlk giriş eski başlatıcıyı belleğe aldı. Gerçek 3.4.2 güncelleme ZIP’i çıkarıldıktan sonra disk kaynakları yeni olduğu halde panel yine HTTP 500 verdi. Yeni adresteki kurtarma aracı disk dosyalarını ve kapalı zaman damgası denetimini belirledi. Yönetici oturumu ve geçerli CSRF ile yalnız paket PHP dosyaları yenilenince panel HTTP 200 açıldı ve çalışan uygulama 3.4.2 bildirdi.

- Gerçek OPcache akışı: 21 başarılı kontrol. Anonim işlem, geçersiz CSRF ve eksik/değişik paket reddedildi; manifest dışında kalan bir PHP dosyasının eski önbelleği korunarak genel sıfırlama yapılmadığı doğrulandı. Haberler, kullanıcı/parola kayıtları, kategori/kaynak ID’leri, ayarlar ve özel hosting dosyası hash’i korundu. İsteğe bağlı kurtarma dosyasının kaldırılması uygulama dosya denetimini bozmadı.
- SQLite ve MariaDB’de eksik tablo/sütun, temel arşiv tablosu, güvenli günlük/fallback ve on panel bölümü: her biri 30 başarılı kontrol. Önceki 3.4.1 korumaları sürer.
- Temiz MariaDB’ye sağlanan 25 tabloluk SQL aktarıldı. Yeni kurulum, giriş, haber/görsel ekleme, taslak/yayın, yorum, yetki/CSRF, reklam ve çıkış: 30 başarılı kontrol.
- 118 PHP dosyası sözdizimi denetiminden geçti.
- Mevcut SQLite/MySQL kurulumlarına gerçek güncelleme ZIP’i iki kez uygulandı. Özgün Pro 3.0/3.3.2 kayıtları, hesap/parolalar, kategori ID’leri, URL’ler, manuel ayarlar ve özel dosyalar korundu. Pro 3.0 arşivi üstüne ZIP uygulamasında çalışma manifesti tamamlandı.
- Sekiz temanın tüm şablonları, CSS/JS ve medya 3.4.1 ile aynıdır. Güncelleme panel bağımlılık yüklemesini ve günlükte göreli dosya yollarını düzeltir; isteğe bağlı bağımsız kurtarma ekranı ekler.
- ZIP bütünlüğü, SHA-256 ve özel dosyaların paket dışında kalması doğrulandı. SQL boş kurulum şemasıdır; mevcut haber veritabanına yeniden aktarılmaz.

Canlı hosting dosyalarına veya PHP sürecine doğrudan erişilmedi. Gönderilen eski günlük ham hata mesajı içermediğinden canlı sunucunun tüm nedenleri yerel bulguya eşit kabul edilmez. Canlı sonuç, yeni kurtarma ekranı ve panel açılışıyla doğrulanmalıdır. Ücretli API veya gerçek Meta/X gönderimi yapılmadı.
