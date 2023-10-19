# ÖDEV

Oluşturacağınız YENİ bir SUNUCU üzerinde

- 3 adet alan adının host edilecektir
- Host edilecek her bir sitenin dosyaları kendi isminde bir klasörde durmaktadır
- İşlem adımları aşağıdadır

## SUNUCU bilgisayarın kurulması

- `virtualbox.org` adresinden `Virtualbox` programını kişisel bilgisayarınıza kurunuz
- `Ubuntu Desktop 20.04` kurulumu için gerekli `.iso` dosyasını terminal ekranını kullanarak indirin
  - axel paketi ile: `axel -k -n 10 https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-desktop-amd64.iso`
  - wget paketi ile: `wget -O ubuntu2004.iso https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-desktop-amd64.iso`
- Virtualbox kullanarak 50GB HDD ve 1 GB RAM ayarı ile `Ubuntu Desktop 20.04` işletim sistemini kurunuz (SUNUCU)
- Kurulum sırasında `güncellemeleri kur` seçeneğini seçmediğinize emin olun
- Kurulum aşamasında kullanıcı adınızı `OSMAN` olarak belirleyin
- SUNUCU'yu başlatın ve kurulum sırasında tanımladığınız kullanıcı ile login olun
- SUNUCU'nun root kullanıcısının şifresini değiştirin
- Kurduğunuz SUNUCU'nun IP adresini öğreniniz (SUNUCUIP)
- SUNUCU'ya erişim için şifre kullanmamak için, kendi bilgisayarınızda üreteceğiniz BENIMSSH adındaki `public ssh-key`i SUNUCU'ya ekleyin
- SUNUCU'daki oturumunuzu kapatın (SUNUCU açık kalacak)

- Aşağıdaki işlemleri kendi bilgisayarınızdan SUNUCU'ya `ssh` ile bağlanarak yapın:
- SUNUCU'ya web SUNUCUsu için gerekli ilk işlemleri yapınız (update ve upgrade)
- Gerekli paketleri yükleyiniz (vim, git, apache2, php)
- SUNUCU'nun şu siteleri barındırması (domainlerin host etmesi) beklenmektedir:
  - Varsayılan dosyalar `/var/www/html` dizinindedir
  - aaa.com.tr (Sitenin dosyaları `/var/www/aaa` dizinindedir)
  - bbb.com.tr (Sitenin dosyaları `/var/www/bbb` dizinindedir)
  - ccc.com.tr (Sitenin dosyaları `/var/www/ccc` dizinindedir)
- SUNUCUya domain adı olmadan (IP adresi ile) erişilmesi halinde (http://SUNUCUIP/):
  - Ekranda Türk bayrağı altında `Yurtta Barış, Dünyada Barış` mesajını gösteriniz
  - `adminer.org` sitesindeki adminer programını indirerek `http://SUNUCUIP/adminer` adresinden çalışmasını sağlayınız

## Kendi bilgisayarınızda yapılacaklar

- Size ait BENIMSSH adında bir `ssh-key` üretiniz
- `/etc/hosts` dosyasına şu kayıtları ekleyiniz:

```
  [SUNUCUIP]  aaa.com.tr
  [SUNUCUIP]  bbb.com.tr
  [SUNUCUIP]  ccc.com.tr
  [SUNUCUIP]  www.aaa.com.tr
  [SUNUCUIP]  www.bbb.com.tr
  [SUNUCUIP]  www.ccc.com.tr
```

- Host edilecek her bir sitenin dosyaları `/var/www/html/sitelerim` adlı dizin altında kendi isminde bir klasörde olmalıdır.
- Host edilecek her bir site için uygun dizinler (folder) oluşturun
- Oluşturduğunuz bu dizinlerde içlerine gerekli dosyaların bulunmasını sağlayın
  - Host edilecek domainlere ait dizinlerde sadece `index.php` adlı dosya vardır. İçeriği ise şöyledir:
  ```
  <?php
    echo "<h1>AAA.COM sitesine hoşgeldiniz</h1>";
  ?>
  ```
- Host edilecek sitelere ait dosyaları SUNUCU'ya kopyalayınız
  - `scp` ile nasıl kopyalanır?
  - `rsync` ile nasıl kopyalanır?

## SUNUCU bilgisayarınızda yapılacaklar

- `ssh` ile uzaktan bağlanın
- Apache config dosyası tanımlarını oluşturun
  - Host edilecek her bir domaine `DOMAIN.com.tr` ve `www.DOMAIN.com.tr` örneğine göre erişilebilmelidir
- Oluşturduğunuz tanım dosyalarını etkinleştirin
- Apache servisini yeniden başlatın

## Kendi bilgisayarınızda TARAYICI üzerinden yapılacaklar

- `aaa.com.tr` ve `www.aaa.com.tr` adreslerinden site açılıyor mu?
- `bbb.com.tr` ve `www.bbb.com.tr` adreslerinden site açılıyor mu?
- `ccc.com.tr` ve `www.ccc.com.tr` adreslerinden site açılıyor mu?
- SUNUCUIP adresinden site açılıyor, Türk bayrağı ve mesaj görünüyor mu?
- SUNUCUIP/adminer adresinden site açılıyor mu?

# VİZE SORULARI

- HOST ettiğiniz sitenin sayfa sonunda "&#169; 2021-2022. Made with &#9829;" mesajı görünsün.
- `2022` bölümü içinde bulunduğumuz olacak şekilde dinamik olsun. Yani, `2024` yılında açıldığında `2021-2024` olarak görünsün.
- Bu şekilde değiştirdiğiniz dosyaları SUNUCU'ya `rsync` komutu ile yükleyiniz.

- SUNUCU'nun saat dilimini (TimeZone) `Europe/Istanbul` olarak ayarlayın

- SUNUCU'nun `root` kullanıcısının şifresini `123` olarak değiştirin
- SUNUCU'ya `ssh` komutu ve "şifreniz" ile erişim sağlayın

- `mariadb-server` ve `mariadb-client` paketlerini kurun
- Şu MySQL komutları çalıştırın: (MySQL shell ekranına girmeden çalıştırın!)
  - `use mysql;update user set plugin='' where User='root';flush privileges;`
- MySQL'e `dbadmin` adında ve `QAZ123` şifresi ile yeni bir kullanıcı ekleyin
  - `GRANT ALL ON *.* TO 'dbadmin'@'localhost' IDENTIFIED BY 'QAZ123' WITH GRANT OPTION; FLUSH PRIVILEGES;`
- `mysql_secure_installation` programını kullanarak MySQL sunucusunun `root` kullanıcısının şifresini `root123` olarak değiştirin

# FİNAL SORUSU

Yukarıdaki tüm işlemleri sırasıyla yapacak `.sh` dosyalarını hazırlayın.
