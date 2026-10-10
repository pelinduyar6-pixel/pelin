# Pro 3.0 ve sonrası → 3.3.3

Tek güncelleme: **reflex-haber-pro-3-3-3-tam-guncelleme.zip**. Önceki paketleri sırayla yüklemeniz gerekmez.

1. Site dosyalarınızın ve veritabanınızın yedeğini alın.
2. ZIP’i açıp içindekileri **index.php bulunan site köküne** yükleyin. `app`, `assets`, `views` ve kök PHP dosyalarını birlikte değiştirin; `release-files.json` kökte bulunmalıdır.
3. Mevcut `.env`, `storage` ve `uploads` dosyalarını silmeyin. Güncelleme ZIP’inde bunlar bulunmaz. SQL’i yeniden içe aktarmayın ve yeniden kurulum yapmayın; gereken iki canlı trafik tablosu panel/site ilk açılışında eklenir.
4. Ctrl+F5 ile yenileyin. **Sistem Kontrolü** ekranında 3.3.3 ve “Güncelleme dosyaları eksiksiz” görünmelidir. Eksik/farklı dosyaları paketle karşılaştırın. OPcache dosya zamanlarını denetlemiyorsa hosting panelinden bu sitenin PHP sürecini yeniden başlatın.

## İstenen düzen ve araçlar

- Dört temada kategori menüsü masaüstünde satıra yayılır; yatay kaydırma çubuğu ve kesilen ilk kategori yazısı kaldırılır. Mobil menü bütün kategorileri gösterir.
- Manşet resminin üzerindeki dikey Son Dakika şeridi kapatılır. Üstteki ayrı son dakika haber akışı, panelde Üst Bant & Son Dakika ayarından yönetilir.
- Haber listesinde ayrı **ID, kapak, başlık, kaynak, konum, görüntülenme, yayın, durum, SEO ve işlemler** sütunları vardır. Toplu seçim/silme/yayına alma korunur. Paylaş menüsü sekiz servis + link kopyalama sunar.
- Haber editörünün 1–4 adımları numara ve etiket olarak ayrılır; sayfalama aralıklı, bağımsız düğmeler kullanır.
- **Canlı Veri Merkezi** ve kontrol panelindeki **Şu Anda Sitede** alanı: son 5 dakikadaki anonim ziyaretçiler, haber/ana sayfa/diğer sayfa dağılımı, ilgi gören gerçek sayfalar ve son 30 dakika görüntülenme. 15 saniyede bir yenilenir. Heartbeat görüntülenme sayısını artırmaz; panel ve giriş yapmış kullanıcılar sayılmaz. IP kaydedilmez; anonim trafik kayıtları en fazla bir gün tutulur. Ölçüm bu sürüm kurulduktan sonra başlar; eski veriden anlık ziyaretçi tahmini üretilmez.
- **Özel Kodlar → BİK takip kodu**: kurumun verdiği HTML/JS kodunu yapıştırın. Ziyaretçi sayfalarında `</body>` öncesinde bir kez çalışır; panelde çalışmaz.
- **Botlar**: kendi URL’nizi, kategori/yazarınızı, günlük Türkiye saatini veya aralığı seçin. Hazır kaynaklar öneridir; yeni kurulumda duraklatılmış başlar. Her kaynak açılabilir/duraklatılabilir. Kaynak URL’sini kaydetmek dış bağlantı başlatmaz; URL testi ve cron sırasında DNS/özel ağ/TLS denetimleri uygulanır. Erişim hatası kayıt altına alınır. Önceden seçtiğiniz kaynaklar ve ayarlar güncellemede korunur.

## SQL ve uploads entegrasyonu

**Veri Taşıma** ilk ekranında eski SQL dosyasını ve ayrı uploads / resim klasörünü seçin; klasörü doğrudan veya ZIP olarak yükleyin. SQL ve görseller farklı zamanlarda da yüklenebilir.

1. SQL ve görseller yüklenir; görseller küçük gruplarla gönderilir, kesinti sonrası devam edilebilir.
2. Eski haber/kategori tablolarını ve alanlarını eşleştirin. Boş kategori ID’si korunur; mevcut ID çakışmasında eşleştirme gösterilir, var olan kategori ezilmez.
3. Önizlemede kapaklar ve haber içi resimler eski uploads alt yollarıyla eşleştirilir. Eşleşmeyenler ayrıca gösterilir.
4. Önizlemeyi onaylayıp taslak aktarımını başlatın. Haberler 100’lük gruplarla arşive eklenir; aynı SQL yeniden yüklense de çoğalmaz.
5. Haber Merkezi’nde taslakları kontrol edip yayına alın. Geçici aktarım dosyalarını temizlediğinizde haberler ve bağlı resimler kalır.

Desteklenen SQL biçimleri ve kapsam: [VERI-TASIMA.md](VERI-TASIMA.md). Klasör aktarımı JPG/PNG/GIF/WebP görseller içindir. Eski sitenin hesapları, parolaları ve ayarları bu arşiv aktarımıyla otomatik taşınmaz.

[Doğrulama sonuçları](DOGRULAMA-3-3-3.md). Canlı hosting’e otomatik yükleme yapılmamıştır; yeni sürümün orada açıldığını Sistem Kontrolü’nden doğrulayın.
