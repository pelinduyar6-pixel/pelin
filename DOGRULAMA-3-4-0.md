# Pro 3.4.0 doğrulaması

Bu rapor yerel, geçici veritabanları ve Chromium içindir. Canlı cPanel üzerinde kurulum/yayın yapılmadı.

Sekiz temalık tarayıcı turu 1440, 900, 768, 390 ve 320 px genişliklerde menü/footer/son dakika/haber içi sağ sütunu denetler. Yeni dört tema ayrıca 1720, 1100, 900, 768, 390 ve 320 px’de başlık sınırları, numara düğmelerinin çakışmaması ve gerçek manşet geçişiyle kontrol edilir. Panelde seçim kaydedilir; 0 ve 9 tema değerleri reddedilir. Ana sayfa öğelerini kapatma, tam genişliğe geçiş ve son dakika bandının tek kalması doğrulanır. Ekranlarda gerçek veriler yerine yerel örnek haberler kullanılır.

Tema 8 referansının HTML/görselleri TLS doğrulaması korunarak alındı. Medyabar, İmza Gazetesi ve Kulga erişimi ağ proxy’sinden 403 aldı; görsel karşılaştırmaları yapılmadı. Adresler ortam izin taslağına eklendi. Taslağın kaydedilmesi erişimin bu çalışma ortamında uygulandığını göstermez.

Yeni sürümde önceki yükleme ve otomatik paylaşım uygulaması değiştirilmedi. Gerçek Meta/X gönderimi veya ücretli API çağrısı yapılmadı.

## Tamamlanan kontroller

- Sekiz tema, footer/sosyal menü ve haber içi sütun: 182 başarılı tarayıcı kontrolü.
- Yeni dört tema, panel seçimi, geçişler, başlık/numara sınırları ve öğe ayarları: 164 başarılı tarayıcı kontrolü.
- Boş, tek haber, uzun başlık ve 17 manşet: 96 başarılı kontrol; test verisi sonunda geri yüklendi.
- Sekiz temada menü, panel paylaşımı/sayfalama, editör adımları, gerçek anonim canlı ziyaret, BİK alanı: 272 başarılı tarayıcı kontrolü.
- Temiz SQLite ve sağlanan 25 tabloluk SQL ile temiz MariaDB: kurulum/yönetici girişi/haber yayını/görsel yüklemesi akışları, her biri 30 başarılı kontrol.
- PHP sözdizimi: 115 uygulama/şablon/test dosyası; son eklenen test dosyası ayrıca denetlendi.
- Pro entegrasyonları: 30; paket denetimi birim kontrolleri: 5; gerçek panelde eksik/eski CSS tespiti ve düzeltmesi: 6 başarılı kontrol.
- İlk dört ana sayfa şablonu, ortak manşet şablonu ve mevcut 9 site stil dosyası 3.3.4 arşiviyle aynı kaldı. Yeni CSS yalnız Tema 5–8’e uygulanır.
- 3.0 ve 3.3.2’den gelen mevcut 3.3.4 kurulumlarına gerçek güncelleme ZIP’i ikişer kez uygulandı. Eski satırlar, parolalar, kategori ID’leri, URL’ler, manuel ayarlar ve özel dosyaların SHA-256 değerleri korundu. Pro 3.0 üstüne uygulanan ZIP bütün runtime manifestini tamamladı.

Arşivler ZIP bütünlüğü ve SHA-256 ile kontrol edildi; güncelleme özel dosya/görsel/veritabanı içermez. Kurulum SQL’i boş şemadır. Otomatik dış paylaşım ve ücretli model erişimi bu tema sürümünde yeniden canlı servis üzerinde denenmedi.
