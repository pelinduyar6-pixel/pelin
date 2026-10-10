# Pro 3.4.3 doğrulaması

Bu kontroller üretim hesabı veya üretim veritabanı kullanmadan, ayrı yerel kurulumlarda çalıştırıldı. Canlı cPanel’e yükleme yapılmadı.

## Aktarım hatası

Gönderilen `acae17044721` hata kaydı: `migration.php`, satır 86, `migration_rows()`, `JsonException`, kod 3. Gerçek PHP append akışı, yanlış ilerleme konumunu yeniden üretti; eski kod 1.105 satırlı kontrolü geçemedi. Bozulmuş JSONL aynı kod 3 hatasını verdi.

Düzeltme sonrası:

- Mutlak dosya sonu ve istekler arası kayıt ilerlemesi için 10 CLI kontrolü geçti.
- SQLite ve MariaDB’de ayrı yeni kurulumların her birinde 30 HTTP işlev kontrolü geçti.
- SQL alan eşleştirme, kategori ID’leri, ayrı görsel ZIP’i, taslak aktarımı ve yetkilendirme için her veritabanında 15 HTTP kontrolü geçti.
- Her veritabanında 7 ek kontrol, eski bozuk önizlemeyi ve yarım aktarımı aynı kaynak SQL’den kurtardı. SQL ve görseller yeniden yüklenmedi; önceki alan/kategori eşleştirmeleri ve aktarılmış taslaklar korundu. Haberler çoğaltılmadı veya kendiliğinden yayımlanmadı.
- SQLite üzerinde 11 büyük dosya kontrolü geçti: 32 MB üzeri tek INSERT’te 160.005 SQL satırı; 64 MB üzeri 5.002 görselli ZIP; 66 MB tek görsel. Parçalı yükleme ve kaldığı yerden sürdürme; 2 MB PHP yükleme/POST, 64 MB bellek ve 10 saniye çalışma koşullarında denendi.
- MariaDB üzerinde 6 ZIP uç durum kontrolü geçti; ZIP64, CRC hatası, tekrar deneme, boş arşiv ve temizlik doğrulandı.

## Temalar 5–8

Medyabar, İmza Gazetesi, Kulga ve EsenHaber Demo 3 ana sayfaları ile birer kategori sayfası HTTP 200 ile okunup blok yapıları karşılaştırıldı. Otomatik kategori profilleri `regional`, `flow`, `wind`, `esen` olarak ayrıldı. Panelden seçilen kategori görünürlüğü, sırası ve manuel düzenler korunur; kaynakların kategori adları/ID’leri sisteme aktarılmaz.

Tarayıcıda dört tema için 320, 390, 768 ve 1440 pikselde kategori blokları, kategori arşivleri, makale ve sağ sütun sınırları, manşet/listede yinelenen haberler, panelde kategori görünürlüğü, mevcut kullanıcılar/parola özetleri ve kategori ID’lerinin korunması doğrulandı. Bu akışta 126 kontrol geçti. Mevcut referans tema tarayıcı akışı da dört temanın navigasyonunu, manşet kontrollerini, kategori/haber sayfalarını ve farklı ekran genişliklerini geçti.

İlk dört temanın ana sayfa şablonları ve temel tema CSS’i önceki paketle bayt düzeyinde aynı kaldı. Özellikle İmza’nın `s.tblsm.com` CSS/fontları ve bazı kaynakların dış CDN görselleri ağ erişim engeline takıldı. HTML yapısı karşılaştırması tamamlandı; tam görsel eşleşme doğrulanmış değildir.

## Gerçek güncelleme paketi

- Gerçek 3.4.3 ZIP’i, Pro 3.0 ve 3.3.2’den kurulmuş mevcut SQLite/MariaDB yerel sitelerine ikişer kez uygulandı. Mevcut hesap/parola özetleri, haberler, kategori ID’leri, URL’ler, özel ayarlar, `.env`, yerel yapılandırma ve yüklenmiş dosyaların özetleri korundu.
- Orijinal Pro 3.0 arşivinin üstüne bu güncelleme açıldığında tam çalışma zamanı manifesti doğrulandı.
- SQLite ve MariaDB’de her birinde 6 HTTP paket kontrolü geçti. Eksik/farklı CSS dosyaları Sistem Kontrolü’nde gösterildi; doğru dosya geri konunca kontrol düzeldi. Yetkisiz editör tanılama ekranını açamadı.
- ZIP bütünlüğü, SHA-256 özetleri ve özel yapılandırma/hesap/veri/günlük dosyalarının pakete girmemesi denetlendi.

Güncellemeden sonra canlı sitenin Sistem Kontrolü’nde **3.4.3 / Güncelleme dosyaları eksiksiz** görünmelidir. Hata veren aynı aktarım açılıp **SQL incelemesine devam et** seçilmelidir. Canlı sunucu sonucu bu yerel doğrulamalarla eşdeğer kabul edilmemelidir.
