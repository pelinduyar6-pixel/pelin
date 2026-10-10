# Sosyal Medya Merkezi

Yönetici menüsünden **Sosyal Medya Merkezi** açılır. Footer’daki Facebook, X, Instagram ve YouTube profil adresleri buradan düzenlenir. Boş profiller için bağlantı veya boş sosyal bant oluşturulmaz.

Otomatik haber paylaşımı **Meta / Facebook Sayfası** ve **X** için uygulanmıştır. Instagram otomatik gönderimi bu sürümde yoktur; Instagram profil bağlantısı eklenebilir.

- Facebook için Sayfa ID, geçerli Graph API sürümü ve `pages_manage_posts` yetkili Page Access Token girin. Meta uygulamasının gereken erişim/inceleme izinlerini tamamlayın.
- X için `tweet.write` yetkili OAuth 2.0 **kullanıcı** erişim anahtarı girin. Uygulama Bearer Token tek başına gönderim yetkisi sağlamaz. API planı ve hesap izinleri gerekir; süresi dolan anahtarı panelde yenileyin. OAuth hesap bağlama/yenileme sihirbazı bu sürümde yoktur.
- Hesapları ve **Yeni yayımlanan haberleri otomatik paylaş** seçeneğini etkinleştirin. Yeni yayımlanan gerçek haberler kuyruğa alınır; demo, taslak, gelecekteki ve ilk etkinleştirmeden önceki haberler otomatik paylaşılmaz. Eski gerçek haberler Haber ID ile elle kuyruğa eklenebilir.
- cPanel’de **Cron Ayarları** ekranındaki mevcut komutu 5 dakikada bir çalıştırın. Kuyruk cron sırasında en fazla beş gönderim işler; haber botunun bu çalışmada eklediği haber sonraki cron sırasında paylaşılır.
- Kuyrukta gönderilecek metin/bağlantı, durum, platform paylaşım ID’si ve hata gösterilir. X başlığı emoji ağırlığına da yer bırakacak şekilde 120 karaktere kısaltılır; bağlantı korunur. Kuyruğa alınan metin değişmez. Haber gönderimden önce taslağa çevrilirse gönderim iptal edilir.
- Aynı haber ve platform çifti tek kayıt olarak tutulur. Bağlantı kesilip gönderim sonucu belirsiz kalırsa otomatik tekrar gönderilmez. Platformda paylaşım bulunmadığını kontrol edip kutuyu işaretledikten sonra tekrar kuyruğa alınabilir. Mevcut platform paylaşımını silmek yeni otomatik paylaşım başlatmaz.

Anahtarlar `storage/integrations.php` özel dosyasında saklanır. Boş şifre alanları kayıtlı anahtarları korur; anahtarlar HTML’de, hata kaydında veya dağıtım ZIP’inde gösterilmez. HTTPS doğrulaması ve dış adres denetimleri korunur.

Kuyruk, izinler ve hata davranışı yerel testlerde doğrulandı. Gerçek Meta/X hesabıyla gönderim testi yapılmadı; canlı API planı, anahtar ve izinleri hosting üzerinde doğrulayın. Hesap anahtarlarını sohbetten paylaşmayın.
