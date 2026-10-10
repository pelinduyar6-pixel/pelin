# Pro 3.4.0 güncellemesi · Sekiz tema

Çalışan Pro 3.0–3.3.4 için **reflex-haber-pro-3-4-0-tam-guncelleme.zip** kullanın. Yeni cPanel kurulumu için **reflex-haber-pro-3-4-0-cpanel-sql.zip** vardır.

1. Dosyaları ve veritabanınızı yedekleyin.
2. Güncelleme ZIP’ini uygulamanın kurulu olduğu klasörde açıp aynı isimli uygulama dosyalarını değiştirin. Pakette `storage`, `uploads`, `.env` veya bağlantı/parola dosyaları yoktur. Mevcut haberler, görseller, hesaplar ve ayarlar korunur.
3. Siteyi/paneli açın. **Sistem Kontrolü** sürüm **3.4.0** ve “Güncelleme dosyaları eksiksiz” göstermelidir. Tarayıcı önbelleğini yenileyin.
4. **Tema ve Marka** menüsünden Tema 5, 6, 7 veya 8’i seçip kaydedin. Güncelleme mevcut tema seçiminizi kendiliğinden değiştirmez. Tema 1–4 korunur.

**Mevcut veritabanınıza kurulum SQL’ini yeniden yüklemeyin.** Gereken şema güncellemeleri uygulama tarafından yürütülür. Bu sürüm yeni tablo eklemez; boş kurulum SQL’i önceki sürümdeki 25 tabloyu içerir.

| Tema | Adı | Düzen |
| --- | --- | --- |
| 5 | Medyabar | Manşet yanında yayın akışı ve üst haber kartları |
| 6 | İmza Gazetesi | Ortalanmış marka, gazete başlıkları, çift vitrin |
| 7 | Kulga | Üç parçalı vitrin, renkli kartlar, mozaik kategoriler |
| 8 | EsenHaber Demo 3 | Bölünmüş lacivert manşet, yatay numaralar, dörtlü şerit |

Tema 8’in referans sayfası incelendi. Medyabar, İmza Gazetesi ve Kulga adresleri geliştirme ortamında ağ erişim engeline takıldı; Tema 5–7 için bu ilk düzenler hazırlandı ancak referanslarla görsel eşleşme doğrulanmadı. Site isimleri tema eşlemesini belirtir; üçüncü taraf yazılım/marka/görselleri pakete kopyalanmadı.

Ana sayfa kategori seçimi/sıralaması, reklamlar, footer, haber içi sağ sütun, canlı veriler, bot URL/saat/cron ayarları, BİK alanı, SQL/görsel taşıma ve Meta/X paylaşım kuyruğu bütün temalarda aynı haber merkezine bağlıdır. Son Dakika akışı ana manşetin içinde bir kez gösterilir; manşet kapatılırsa üst alana döner. Panelden kapatılan öğeler boş bir kutu bırakmaz.

[Yeni cPanel kurulumu](CPANEL-KURULUM-3-4-0.md) · [Veri taşıma](VERI-TASIMA.md) · [Sosyal medya](SOSYAL-MEDYA.md) · [Doğrulama](DOGRULAMA-3-4-0.md)
