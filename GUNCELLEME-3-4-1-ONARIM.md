# Pro 3.4.1 görünümüne dönüş ve aktarım onarımı

Bu paket **3.4.1-r1** olarak tanımlanır. Panel görünümü ve ilk dört tema 3.4.1 temelinde korunur. Kullanıcının son açıklamasına göre temalar 5–8, kendi demo kaynaklarının ayrı kategori profillerini kullanır; ilk dört temanın alt kategori şablonuna bağlanmaz. Temalar 5–8 ve önizlemeleri pakettedir: Medyabar, İmza Gazetesi, Kulga, EsenHaber Demo 3.

Gönderilen `920c0e9b24ee` kaydı, `migration.php:86` içindeki `JsonException`, kod 3 ve `admin-migration.php:42` çağrısını gösterir. 3.4.3’te bu ekran çağrısı 48. satıra taşınmıştı. Log, onarımdan önceki kodun çalıştığına işaret eder; dosyaların diskte eski kalması, farklı web kökü veya OPcache ayrı kontrol edilmelidir. Canlı hosting erişimi bulunmadığından hangisinin devrede olduğu doğrulanmamıştır.

SQL incelemesindeki yanlış append dosyası konumu düzeltilmiştir. Eski tamamlanmamış aktarım, saklanan kaynak SQL’den geçici kayıtlarını yeniden oluşturur. SQL, görsel eşleştirmeleri, alan/kategori seçimleri, aktarım ilerlemesi ve önceden aktarılmış taslaklar korunur. Sosyal medya modülünün yükleme bağımlılığı da düzeltilmiştir.

## Uygulama

1. Site ve veritabanının yedeğini alın. `reflex-haber-pro-3-4-1-onarim.zip` dosyasını **bu alan adının gerçek `index.php` klasörüne** çıkarın; aynı isimli dosyaların üzerine yazılmasını seçin. Mevcut `.env`, `storage`, hesaplar, SQL arşivi ve görseller pakette bulunmaz ve yenilenmez. Mevcut siteye SQL şemasını yeniden aktarmayın.
2. `/reflex-panel-kurtarma-341r1.php` adresini açın. **Diskteki 3.4.1-r1 dosyaları eksiksiz**, **8 / 8 tema** ve **0 sorun** görünmelidir. Farklı dosya listelenirse yalnız gösterilen dosyaları ZIP’ten yeniden çıkarın. Bu bağımsız araç diskteki kaynakları denetler; ana uygulamanın önbellekteki sürümüne bağlı değildir.
3. Mevcut yönetici oturumuyla araçtaki **Güncelleme önbelleğini yenile** düğmesine basın. Yönetici doğrulaması ve CSRF gerekir; yalnız bu sitenin manifestteki PHP dosyaları yenilenir. Hosting işlevi kapatmışsa bu sitenin PHP sürecini hosting desteğine yeniden başlatın.
4. Panelde **Tema ve Logo** ekranını `/index.php?route=%2Fpanel%2Ftema` adresinden açın. Sekiz tema seçeneği bulunmalıdır. Sistem Kontrolü’nde **3.4.1-r1 / Güncelleme dosyaları eksiksiz** kontrolünü yapın.
5. Veri Taşıma’da hata veren **aynı aktarımı** açın ve **SQL incelemesine devam et** düğmesine basın. Kaynak SQL veya görselleri tekrar yüklemeyin. İnceleme sonrası eşleştirmeler ve önizleme açılır; devam eden aktarım varsa taslak sayacı korunur. Kontrol sonrası taslak aktarımını sürdürün.

İsteğe bağlı kurtarma dosyasını işlem sonunda kaldırabilirsiniz. Araç genel OPcache sıfırlaması yapmaz. Bu paket canlı siteye tarafımızdan yüklenmemiştir; diskteki sürüm/tema ve çalışan sürüm kontrolleri yükleme sonrası yapılmalıdır.

## Temalar 5–8

Medyabar dörtlü kartlar; İmza büyük haber + dört küçük kart ve sporda üç sütun; Kulga büyük vitrin + yan haberler + üçlü alt sıra; EsenHaber kategoriye göre üçlü kartlar, çift büyük haber veya listeler kullanır. Kategori arşivleri de ilgili tema profilini kullanır. Kendi kategori ID’leriniz, paneldeki görünürlük/sıralama ve manuel düzenler korunur. Dört kaynağın ana sayfa ve kategori HTML yapıları incelendi. Bazı CDN stilleri/fontları/görsellerine erişim engellendiğinden tam görsel eşleşme doğrulanmamıştır.
