# Pro 3.3.4 güncellemesi

Çalışan Pro 3.0–3.3.3 için **reflex-haber-pro-3-3-4-tam-guncelleme.zip** kullanın. Yeni cPanel kurulumu için ayrı **reflex-haber-pro-3-3-4-cpanel-sql.zip** vardır.

1. Mevcut dosya ve veritabanı yedeğinizi alın.
2. Güncelleme ZIP’ini `index.php` bulunan mevcut kök klasöre açıp dosyaların tamamını değiştirin. `app`, `views`, `assets` ve `release-files.json` birlikte güncellenmelidir. ZIP mevcut `storage`, `.env`, bağlantı/anahtar dosyalarını ve `uploads` arşivinizi değiştirmez. Güncelleme için kurulum SQL’ini tekrar içe aktarmayın veya kurulum başlatmayın.
3. Siteyi ve paneli açın. Gerekli yeni sosyal medya tablosu otomatik oluşturulur. **Sistem Kontrolü** sürüm **3.3.4** ve “Güncelleme dosyaları eksiksiz” göstermelidir. Tarayıcı önbelleğini yenileyin.

## Değişiklikler

- SQL+ZIP seçiliyken yüklemenin başlamaması giderildi. SQL, ZIP ve doğrudan görsel klasörü parçalı yükleme kullanır; yüzde/boyut, hata ve devam düğmesi görünür. Eski toplam 32/64/256 MB, 150 bin kayıt ve 5 bin görsel sınırları kaldırıldı. Büyük SQL analizi ve ZIP çıkarımı aşamalar hâlinde sürer; sunucu disk ve çalışma kaynakları geçerlidir.
- Footer bağlantıları ve haber içi sağ sütun başlıkları büyütüldü. Sağ sütun blok aralıkları düzenlendi; boş reklam başlığı, boş sosyal bant ve tekrarlanan ikinci manşet kaldırıldı. Kategori menüleri dört temada satıra yayılır.
- Son Dakika bandı ana sayfanın ana manşetinin üst bölümünde bir kez görünür. Başlık ve numaraların üzerine dikey bant gelmez. Diğer sayfalarda üst akış korunur; panelin Üst Bant & Son Dakika ayarları uygulanır.
- **Sosyal Medya Merkezi**: footer profil menüsü, Facebook Page ve X otomatik paylaşım kuyruğu, cron, gönderim ID’leri ve hata takibi. Gerçek hesap anahtarları ve yetkileri kullanıcı tarafından panelde girilir. Bkz. [SOSYAL-MEDYA.md](SOSYAL-MEDYA.md).

Eski haberler, kategori ilişkileri, hesaplar, bot kaynakları, canlı trafik araçları ve BİK alanı korunur. [Veri taşıma ayrıntıları](VERI-TASIMA.md) · [Yeni cPanel kurulumu](CPANEL-KURULUM-3-3-4.md) · [Doğrulama](DOGRULAMA-3-3-4.md).
