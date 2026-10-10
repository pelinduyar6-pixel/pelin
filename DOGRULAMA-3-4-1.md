# Pro 3.4.1 doğrulaması

Yerel, geçici SQLite/MariaDB veritabanları kullanılmıştır. Canlı hosting’e giriş, canlı veritabanına bağlantı veya sunucuya güncelleme yapılmamıştır.

## Doğrulanan kusur

Değişiklik öncesi Pro 3.4.0’da `app_schema=3.4.0` korunurken canlı ziyaret, günlük istatistik veya iletişim tablosunun eksiltilmesi, yönetici girişinden sonra panelde HTTP 500 ve “İşlem tamamlanamadı. Lütfen tekrar deneyin.” ekranı oluşturdu. Her denemeden sonra gerçek test tablosu geri yüklendi.

## Düzeltme kontrolleri

- SQLite ve MariaDB’de aynı güncel sürüm işaretiyle dört yardımcı tablo ayrı ayrı eksiltilip panel açıldı: tablolar yeniden oluşturuldu, HTTP 200 ve eksiksiz şema doğrulandı. Eklenen haber sütunu eksiltildiğinde de tamamlandı.
- Her veritabanında 30 başarılı kurtarma/tanı kontrolü: haberler, hesaplar/parolalar, kategori ve kaynak ID’leri, reklamlar ve ayarlar korundu; on panel bölümü açıldı.
- Temel haber tablosu eksikken boş haber arşivi oluşturulmadı; HTTP 503, hata kodu ve iç kayıtta doğru tablo/çağrı konumu doğrulandı. Genel hata ekranında veritabanı ayrıntıları görünmedi.
- Eksik panel şablonu HTTP 500 ile izlenebilir hata kodu üretti; iç kayıt tam eksik şablonu gösterdi.
- Ham hata mesajına gömülen test parolası, API anahtarı, e-posta ve token URL’si günlüğe yazılmadı. Uygulama günlüğü yazılamadığında PHP error_log’da aynı hata kodu doğrulandı.
- Sağlanan 25 tabloluk SQL önce temiz MariaDB’ye aktarıldı; yeni cPanel kurulum akışı ve ayrı temiz SQLite akışı, her biri 30 başarılı kontrolle geçti. Haber/görsel ekleme, taslak/yayın, yorum, yetki/CSRF, reklam ve çıkış kontrol edildi.
- Dosya denetimi: 5 entegrasyon kontrolü, gerçek panelde eski/eksik CSS tespiti ve yönetici yetkisiyle 6 HTTP kontrolü. Editör test hesabı hazırlanarak yetki kontrolü tamamlandı.
- Haber botu/SEO/OpenAI yerel örnek yanıt entegrasyonları: 30 başarılı kontrol; dış API çağrısı yapılmadı.
- 117 PHP dosyası sözdizimi denetiminden geçti.
- Mevcut 3.4.0 SQLite ve MySQL kurulumlarına gerçek güncelleme ZIP’i ikişer kez uygulandı. Özgün 3.0/3.3.2 kayıtları, hesap/parolalar, kategori ID’leri, URL’ler, manuel ayarlar ve özel dosya hash’leri korundu. Özgün Pro 3.0 arşivi üstüne ZIP uygulandığında tüm çalışma dosyalarının manifest hash’leri eşleşti.
- 3.4.0 ile karşılaştırmada sekiz temanın şablonları, tüm CSS/JS ve medya aynı kaldı. Değişen çalışma dosyaları yalnız bootstrap, core, pro, index, genel hata ekranı ve yönetici sistem kontrolüdür.
- ZIP bütünlüğü, özel dosyaların dışarıda kalması, SHA-256 ve kaynak özel anahtar taraması tamamlandı. Boş kurulum SQL’inde 25 tablo vardır; kullanıcı parolaları/haber arşivi yoktur.
- Bulut hazırlama komutu iki kez çalıştı; mevcut çalışma dosyalarını korudu. Kaydedilecek başlatma komutuyla yeni kurulum ekranı HTTP 200 döndü.

## Sınırlar

`yesilbeyazbursa.com` canlı hata kaydı veya hosting erişimi mevcut değildir; bu ortamdan site erişimi ağ proxy’si tarafından engellenmiştir. Yerelde doğrulanan kusur canlı hatanın kesin nedeni olarak kabul edilemez. Yeni hata kodu, devam eden başka hataların sunucu günlüğüyle ayırt edilmesini sağlar. Şema tamamlama, kaybolmuş eski istatistik veya kayıtları geri getirmez; bunun için yedek gerekir.

Sekiz temanın önceki görsel kontrolleri [3.4.0 raporunda](DOGRULAMA-3-4-0.md) yer alır. Tema 5–7 referansları ve gerçek Meta/X gönderimi bu güncellemede yeniden canlı olarak denenmedi.
