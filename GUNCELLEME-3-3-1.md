> Güncel tek adımda paket: [Pro 3.0 ve sonraki sürümler → 3.3.2](GUNCELLEME-3-3-2.md). Aşağıdaki yönergeler önceki sürüm içindir.

# Reflex Haber Pro 3.3.1 düzeltme

Çalışan **Pro 3.3.0** sitesinde `reflex-haber-pro-3-3-1-duzeltme.zip` kullanın. Önce dosya ve veritabanı yedeğinizi alın. ZIP’in içindeki uygulama dosyalarını, sitenin mevcut `index.php` dosyasıyla aynı köke açın. **app, assets ve views içindeki dosyaların üzerine yazın; yeni dosyaları da yükleyin.** Paneli açıp Ctrl+F5 yapın.

**`.env`, `storage` ve eski/yeni `uploads` klasörlerinizi koruyun. SQL’i yeniden içe aktarmayın; kurulum ekranını tekrar çalıştırmayın.** Bu düzeltme ZIP’i bu özel dosyaları içermez. İçindeki tests ve Markdown dosyaları kurulum için zorunlu değildir.

Pro 3.2 kullanıyorsanız `reflex-haber-pro-3-3-guncelleme.zip` artık 3.3.1’e günceller. Daha eski veya belirsiz sürümde güncel tam `reflex-haber-pro-4-tema.zip` içindeki uygulama dosyalarını kullanın; özel dosyaları yine koruyun. Yeni kurulumda tam ZIP’i boş klasöre açın.

## Düzeltilenler

- Dört temanın ana sayfa ve footer düzeni 3.2 sürümündeki hâline döndü. 3.3’te eklenen renkli zeminler, kart çerçeveleri ve bölüm dolguları geri alındı. Paneldeki son genel görünüm değişiklikleri kaldırıldı. Kategori manşetindeki beyaz bant ve başlık/numara çakışması düzeltmeleri korunur.
- Haber Merkezi’ndeki sayfalama ayrık düğmelerle gösterilir. Önceki, 1, 2, 3 ve Sonraki birbirine yapışmaz; seçili sayfa belirgindir. Arama/filtre bilgileri sayfa değişirken korunur. Haber ekleme formundaki SEO, video, PDF ve embed araçları korunur.
- **Veri Taşıma’nın ilk ekranında SQL, görsel ZIP ve doğrudan klasör seçimi vardır.** Eski `uploads` veya resim klasörünü seçebilirsiniz. SQL ile birlikte ya da SQL’i yükledikten sonra aynı aktarımda görselleri yükleyin. ZIP veya klasör alternatiflerinden birini kullanın.
- Klasör seçiminde alt yollar korunur. Desteklenen görseller küçük gruplarla gönderilir; ilerleme görünür. Yükleme kesilirse aynı aktarımı açıp klasörü tekrar seçebilirsiniz; tamamlanmış dosya yolları çoğalmaz. Tarayıcıda klasör seçimi için JavaScript gerekir; ZIP yüklemesi JavaScript olmadan da çalışır.
- SQL’deki kapak yolları ve haber içindeki img kaynakları yüklenen görsellerle eşleştirilir. Örneğin `https://eski-site/uploads/2020/foto.jpg` veya `uploads/2020/foto.jpg`, seçilen uploads klasörünün aynı alt yoluna bağlanır. Farklı içerikli aynı dosya adları belirsizse rastgele görsel seçilmez; önizlemeyi kontrol edin.

Bot URL/cron ayarları, GPT-5.6 Sol/Terra/Luna seçenekleri, paylaşım menüsü, haber içi reklam yerleri, ana kategori seçimi ve taslak aktarımı korunur. Bu paket haberleri veya mevcut kategori ID’lerini silmez. Eski kategori ID boşsa korunur; çakışmada hedef kategori eşleştirmesi kullanılır. Ayrıntılar: [VERI-TASIMA.md](VERI-TASIMA.md).

SQL en fazla 32 MB; ZIP en fazla 64 MB. Görsel toplamı aktarım başına 256 MB / 5.000 görsel; görsel başına en fazla 10 MB. Hosting PHP sınırları ayrıca geçerlidir. Klasör yüklemesi sunucunun post/upload sınırlarına göre küçük gruplar gönderir; tek görsel sunucu sınırını aşamaz.

## Doğrulama

MySQL ve SQLite üzerinde SQL+ZIP ilk ekran yüklemesi, ayrı klasör yüklemesi, eski uploads yol eşleştirmesi, taslak aktarımı, kategori ID ilişkileri ve izin/CSRF kontrolleri geçti. Tarayıcıda gerçek klasör seçimi, 12 görselin iki grupta gönderilmesi, kesinti ve tekrar yükleme doğrulandı. Dört tema ve panel 320–1440 pikselde, haber sayfalama ve paylaşım menüsü kontrol edildi. Kurulu 3.3.0 arşivine düzeltme ZIP’i iki kez uygulandı; 56 haber, 7 hesap/parola özeti, kategori ID/URL’leri, bot/reklam ayarları ve özel .env/anahtar/PDF dosyaları korundu. Gerçek hosting dosyaları otomatik değiştirilmez.
