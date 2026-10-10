# Pro 3.4.3 cPanel kurulumu

Mevcut siteye **tam güncelleme** ZIP’ini gerçek web köküne çıkarın. SQL’i tekrar aktarmayın. [Güncelleme ve bozuk aktarımı kurtarma](GUNCELLEME-3-4-3.md) adımlarını izleyin.

Yeni siteye `reflex-haber-pro-3-4-3-cpanel-sql.zip` yükleyip web köküne çıkarın. PHP 8.1+ ve PDO MySQL, mbstring, DOM, fileinfo, curl, OpenSSL, zlib uzantıları gerekir. cPanel’de yeni veritabanı/kullanıcı oluşturup bu veritabanı için yetki verin.

`/kurulum.php` üzerinden kendi veritabanı bilgilerinizi ve yönetici hesabınızı girin. İsterseniz paketteki `database/reflex-haber-pro.sql` dosyasını **yalnız yeni ve boş** veritabanına içe aktarın, sonra kurulum ekranını tamamlayın. SQL 25 boş tablo içerir; eski sitenizin haber arşivi veya yönetici şifreleri değildir.

Panel adresi `/panel.php` veya `/index.php?route=%2Fpanel` olur. Veri Taşıma menüsünden eski SQL ve uploads/resim klasörünü yükleyin; alanları eşleştirip taslak olarak aktarın. Toplam SQL/ZIP boyutu ve dosya sayısı için uygulama sınırı yoktur; hosting disk/kota/PHP kaynakları geçerlidir. Apache `.htaccess` korumalarını kullanmalıdır; Nginx için [NGINX.md](NGINX.md) kurallarını uygulayın.

Kurulum ve sistem kontrolü sonrası test ederek yayına alın. API ve cron ayarlarını panelde kendi hesabınızla yapın. Özel bilgilerinizi ZIP’e veya Git’e eklemeyin.
