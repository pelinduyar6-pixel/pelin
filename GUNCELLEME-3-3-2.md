# Pro 3.0 / 3.1 / 3.2 / 3.3 → 3.3.2

**Tek adımda tam güncelleme:** `reflex-haber-pro-3-3-2-tam-guncelleme.zip`.

103.631 baytlık eski Pro 3.0 güncellemesi yalnızca 3.1 içerir. Taşıma, klasör yükleme ve son sayfalama düzeltmeleri bu eski pakette yoktur. 3.3.1 düzeltmesi de yalnızca 3.3 kurulumları içindir. Önceki ZIP’leri sırayla kurmak gerekmez; doğrudan bu paketi kullanın.

1. Mevcut dosyalarınızın ve veritabanınızın yedeğini alın.
2. ZIP’i bilgisayarda açın. İçindekileri sitenin **index.php bulunan kök klasörüne** yükleyin. `app`, `assets`, `views` klasörlerindeki dosyaları ve kök PHP dosyalarını birlikte değiştirin; paketi ayrı bir alt klasöre yüklemeyin.
3. `release-files.json` dosyasını da köke yükleyin. `.env`, `storage/site.php`, `storage/integrations.php`, oturumlar ve mevcut `uploads` dosyaları pakette yoktur; bunları silmeyin. Güncellemede SQL dosyası içe aktarmayın ve yeniden kurulum çalıştırmayın.
4. Paneli açın. Mevcut veritabanına gereken sütunlar otomatik eklenir. **Sistem Kontrolü** ekranında Pro 3.3.2, paket sürümü 3.3.2 ve “Güncelleme dosyaları eksiksiz” görünmelidir. Farklı/eksik dosya gösterirse o dosyayı paketten tekrar yükleyin. Özel değişiklikleriniz de farklı dosya olarak listelenir.
5. Tarayıcıda Ctrl+F5 ile yenileyin. PHP OPcache dosya zamanlarını denetlemiyorsa bu sitenin PHP sürecini hosting panelinden yeniden başlatın.

Kök `.htaccess` mevcut özel hosting kurallarınızı etkileyebilir; yedeğinizle karşılaştırarak bu kuralları koruyun. Uygulama manifesti `.htaccess` dahil paket dosyalarındaki özel değişiklikleri ayrıca gösterir.

## Bu sürüm

- Dört tema ve footer, son yeniden tasarımdan önceki 3.2 görünümünü kullanır.
- SQL + görsel ZIP + doğrudan uploads/resim klasörü seçimi ilk taşıma ekranındadır. Görseller ayrı yüklenebilir; eski yollar kapaklarla ve içerik görselleriyle eşleştirilir.
- Haber sayfalaması ayrı, aralıklı düğmelerle gösterilir; sayfa numaraları doğru adresi açar.
- Paylaş menüsünde sekiz servis ve bağlantı kopyalama bulunur.
- Ana sayfanın sağ sütununda gerçek görüntülenme sayılarına göre En çok okunanlar tekrar gösterilir.
- Güncelleme mevcut örnek içerik açık olsa da yeni demo haber/yazı oluşturmaz. Örnek içerik yalnızca yeni kurulumda eklenir.
- Eski taşınmış kategorilerin yüksek sıra değerleri düzenlenebilir aralığa uyarlanır; kategori ID’si ve görünürlük tercihi korunur.
- Sistem Kontrolü, eksik veya karışık sürüm dosyalarını listeler. Halka açık HTML’de `reflex-version` meta etiketi de sürümü gösterir.

Gerçek Pro 3.0 veritabanları üzerinde hem MySQL/MariaDB hem SQLite için doğrudan yükseltme ve tekrar yükleme doğrulanır. Hesaplar, parolalar, haberler, kategori ID/URL’leri ve yüklemeler korunur. Otomatik piyasalar, Süper Lig ve AI işlevleri için sağlayıcı erişimi/cron ayarları ayrıca gereklidir; yerel testlerde gerçek ücretli AI çağrısı yapılmaz.
