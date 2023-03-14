# ÖDEV

Oluşturacağınız YENİ bir **SUNUCU** üzerinde

- 3 adet alan adının host edilecektir
- Host edilecek her bir sitenin dosyaları kendi isminde bir klasörde durmaktadır
- İşlem adımları aşağıdadır

## **SUNUCU** Bilgisayarın Kurulması

- `virtualbox.org` adresinden `Virtualbox` programını kişisel bilgisayarınıza kurunuz

- `Ubuntu Desktop 20.04` kurulumu için gerekli `.iso` dosyasını terminal ekranını kullanarak indirin
  - axel paketi ile: `axel -k -n 10 https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-desktop-amd64.iso`
  - wget paketi ile: `wget -O ubuntu2004.iso https://releases.ubuntu.com/20.04.4/ubuntu-20.04.4-desktop-amd64.iso`
    - Uzak bilgisayar ile bağlantı kurabilmek için "Seetings/Network/Enable Network Adapter/" başlığının altında "Attached to: Bridged Adapter" şeklinde ayarlanmalı.
    - Ana ve uzak bilgisayarlar arasında kopyalama vb işlemlerin daha rahat yapılabilmesi için "Settings/General/Advanced" alt başlığında "Shared Clipboard: Bidirectional" ve "Drag'n'Drop: Bidirectional" şeklinde ayarlanmalı.
    - Yükleme sırasında `ubuntu-20.04.4-dektop-amd64.iso` dosyası disk olaral eklenmeli.
    - Kurulum sırasında https://www.youtube.com/watch?v=x5MhydijWmc referans olarak kullanılabilir.
- Virtualbox kullanarak 50GB HDD ve 1 GB RAM ayarı ile `Ubuntu Desktop 20.04` işletim sistemini kurunuz (**SUNUCU**)

- Kurulum sırasında `güncellemeleri kur` seçeneğini seçmediğinize emin olun

- Kurulum aşamasında kullanıcı adınızı `UZAK` olarak belirleyin

- **SUNUCU**'yu başlatın ve kurulum sırasında tanımladığınız kullanıcı ile login olun

- **SUNUCU**'nun root kullanıcısının şifresini değiştirin

  1. `sudo passwd` komutu ile parola değiştirebilir.
  2. `sudo su` komutu ile root kullanıcısna geçilir. Sonrasında ise;

  - `passwd` komutu ile parola değiştirebilir.

- Kurduğunuz **SUNUCU**'nun IP adresini öğreniniz (SUNUCUIP)

  - Eğer sunucunuzda net-tools yüklü değilse öncelikle `sudo apt install net-tools` komutu ile yüklenmelidir.

  1. `ifconfig` komutu ile genel görünüm elde edilip çıktının içerisinden ip adresi gözle ayırt edilebilir.
  2. `ifconfig|grep "broadcast"|cut -d t -f 2|cut -d n -f 1` komutu ile direkt olarak ip adresi elde edilir(192.168.1.200).
     - `-d` : "delimiter" yani çıktıyı parçalara bölmemizi sağlayan komuttur. Bu komuttan sonra herhangi bir karakter referans olarak yazılabilir. Yukarıdaki örnekte gösterilen "t" ve "n" harfleri gibi. TAB karakteri için \t ve yeni satır karakteri için \n kullanılabilir.
     - `-f` : "field" yani çıktıyı böldükten sonra kaçıncı parçayı ele alacağımızı belirttiğimiz komuttur. Bu komuttan sonra herhnagi bir sayı referans olarak yazılabilir. Yukarıdaki örnekte gösterilen "2" ve "1" gibi.

- **SUNUCU**'ya erişimde şifre kullanmamak için, **KENDI BILGISAYARINIZ**'da üreteceğiniz **BENIMSSH** adındaki `public ssh-key`i **SUNUCU**'ya ekleyin

  - **BENIMSSH** key üretimi için **KENDI BILGISAYARINIZ**'da:
    - `ssh-keygen` komutu girilir ve "Enter file in which to save the key (/home/osman/.ssh/id_rsa): **BENIMSSH**" yazılır.
      ```
      Generating public/private rsa key pair.
      Enter file in which to save the key (/home/osman/.ssh/id_rsa): **BENIMSSH**
      ```
    - Çıkan ekranda şifra kısmının boş bırakılması ve sadece <kbd>Enter</kbd> a basılması tercih edilir.
    - Bu işlem sonucunda **BENIMSSH** ve **BENIMSSH**.pub dosyaları oluşur.
    - Sonrasında `/home/osman/.ssh` dizinine gidilir.
    - Kontrol etmek için: `ll` komutu kullanılır.
  - Sunucuya eklemek için \***\*SUNUCU\*\***'da yapılacak işlemler:
    - Sanal sunucuya geçilir.
    - Terminal ekranı açılır ( <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd> ).
    - `sudo apt-get install openssh-server openssh-client` komutu ile openssh-server ve openssh-client yüklenir. Yüklenmezse kopyalama gerçekleşmez.
    - `sudo apt install vim` komutu ile vim editör yüklenir.
      - **NOT:** Bazı bilgisayarlarda farklı editörlerde ok tuşları çalışmadığı için vim editör tercih edilir.
    - `sudo vim /etc/ssh/sshd_config` komutu ile `sshd_config` dosyasının içine girilir.
    - `PermitRootLogin prohibit-password` satırı bulunur ve başındaki `#` işareti silinir.
    - vim ekranındayken `i` tuşuna basılır ve `insert` modu aktif hale getirilir.
    - `PermitRootLogin yes` olarak değiştirilir ve kaydedilip çıkılır ( <kbd>:</kbd><kbd>w</kbd><kbd>q</kbd> + <kbd>Enter</kbd> ).
    - `sudo service sshd restart` komutu ile serviste yapılan değişikliklerin uygulanması için sshd yeniden başlatılır.
    - ROOT kullanıcısı ile ŞİFRESİZ olarak UZAKPC'ye bağlanabilmek için **KENDI BILGISAYARINIZ**'da:
    - `ssh-copy-id -i ~/.ssh/BENIMSSH.pub root@192.168.1.200` komutu ile uzak bilgisayardaki root kullanıcısı `/root/.ssh/authorized_keys` dosyasının içine eklenir.
      - Komut çalıştırıldığında **UZAK BILGISAYAR**'ın root kullanıcısı şifresi istenmektedir. Şifresi yukarıda belirlenmiştir.
    - Bu işlemlerin doğru bir şekilde yapılıp yapılmadığı ise **KENDI BILGISAYARINIZ**'da `ssh root@192.168.1.200` komutu çalıştırılarak kontrol edilebilir. ("Welcome to Ubuntu" yazısı şifre istemeden karşımıza çıkacak.)
    - **UZAK BILGISAYAR**'ın IP adresi her açılışta değişebilir. `ifconfig` komutu ile kontrol etmekte fayda var.

- **SUNUCU**'daki oturumunuzu kapatın (**SUNUCU** açık kalacak)

- Aşağıdaki işlemleri **KENDI BILGISAYARINIZ**'dan **SUNUCU**'ya `ssh` ile bağlanarak yapın:

  - `ssh root@192.168.1.200` komutu ile **UZAK BILGISAYAR**a bağlanılır.

- **SUNUCU**'ya web SUNUCUsu için gerekli ilk işlemleri yapınız (update ve upgrade)

  - `apt update`
  - `apt upgrade -y`
    - **NOT:** Komutun sonunda bulunan `-y` ifadesi gelen `(y or n)` sorularına otomatik olarak `y` cevabını vermemizi sağlar.

- Gerekli paketleri yükleyiniz (vim, git, apache2, php)

  - `sudo apt install vim `
  - `sudo apt install git`
  - `sudo apt install apache2`
  - `sudo apt install php`
    ya da kısaca:
  - `sudo apt install vim git apache2 php`

- **SUNUCU**'nun şu siteleri barındırması (domainleri host etmesi) beklenmektedir:
  - Varsayılan dosyalar `/var/www/html` dizinindedir
  - aaa.com.tr (Sitenin dosyaları `/var/www/aaa` dizinindedir)
  - bbb.com.tr (Sitenin dosyaları `/var/www/bbb` dizinindedir)
  - ccc.com.tr (Sitenin dosyaları `/var/www/ccc` dizinindedir)
- **SUNUCU**'ya domain adı olmadan (IP adresi ile) erişilmesi halinde (http://SUNUCUIP/):
  - Ekranda Türk bayrağı altında `Yurtta Barış, Dünyada Barış` mesajını gösteriniz
  - `adminer.org` sitesindeki adminer programını indirerek `http://SUNUCUIP/adminer` adresinden çalışmasını sağlayınız

## Kendi Bilgisayarınızda Yapılacaklar

- Size ait **BENIMSSH** adında bir `ssh-key` üretiniz

  - `ssh-keygen` komutu ile isim kısmına **BENIMSSH** yazılarak üretilir.

- `/etc/hosts` dosyasına şu kayıtları ekleyiniz:

```
[SUNUCUIP]  aaa.com.tr
[SUNUCUIP]  bbb.com.tr
[SUNUCUIP]  ccc.com.tr
[SUNUCUIP]  www.aaa.com.tr
[SUNUCUIP]  www.bbb.com.tr
[SUNUCUIP]  www.ccc.com.tr
```

- `sudo vim /etc/hosts` komutu ile **SUNUCU**'nun ip adresi ve istenilen form girilerek kayıt edilir.

  ```
  192.168.1.200    aaa.com.tr
  192.168.1.200    bbb.com.tr
  192.168.1.200    ccc.com.tr
  192.168.1.200    www.aaa.com.tr
  192.168.1.200    www.bbb.com.tr
  192.168.1.200    www.ccc.com.tr
  ```

- Host edilecek her bir sitenin dosyaları `/var/www/html/sitelerim` adlı dizin altında kendi isminde bir klasörde olmalıdır.

  - `cd /var/www/html` komutu ile klasörün oluşturulacağı dizine gidilir.
  - `mkdir sitelerim` komutu ile klasör oluşturulur.
    - "Sitelerim" adlı bir klasörün oluşturulma amacı lokaldeki ve sunucudaki dosyaları ayırt etmektir.

- Host edilecek her bir site için uygun dizinler (folder) oluşturun

  - `cd /var/www/html/sitelerim` komutu ile klasörlerin oluşturulacağı dizine gidilir.
  - `mkdir aaa`
  - `mkdir bbb`
  - `mkdir ccc`
    ya da kısaca:
  - `mkdir aaa bbb ccc`

- Oluşturdğunuz bu dizinlerde içlerine gerekli dosyaların bulunmasını sağlayın

  - Host edilecek domainlere ait dizinlerde sadece `index.php` adlı dosya vardır. İçeriği ise şöyledir:
    ```
    <?php
      echo "<h1>AAA.COM sitesine hoşgeldiniz</h1>";
    ?>
    ```
  - aaa.com için:

    - `cd /var/www/html/sitelerim/aaa` komutu ile dosyanın oluşturulacağı dizine gidilir.
    - `vim index.php` komutu ile index.php dosyası bulunduğumuz konumda oluşturulur ve yukarıdaki içerik vim text editor sayesinde index.php dosya içeriğine eklenir.

  - bbb.com için:

    - `cd /var/www/html/sitelerim/bbb`
    - `vim index.php`

  - ccc.com için:
    - `cd /var/www/html/sitelerim/ccc`
    - `vim index.php`

- SUNUCUIP adresinden sitenin açılması, Türk bayrağı ve mesajın görünmesi için:

  - `cd /var/www/html/sitelerim`
  - `mkdir html`
  - `cd /html`
  - "bayrak adındaki bir ".jpg" dosyasını bu dizine at.
  - `vim index.php` komutu ile mevcut dizine index.php dosyasını oluştur ve aşağıdaki kodu ekle.
  - `rm index.html` komutu ile hali hazırda varolan default apache2 sayfasının çalıştığı html dosyasını sileriz ki index.php dosyası çalışsın ve bayrak resmi ile birlikte isteğimiz yazı sayfada görünsün.

    ```
      <center>
      <img src="bayrak.jpg">
      <p>Yurtta Barış, Dünyada Barış</p>
      </center>
    ```

- SUNUCUIP/adminer adresinden site açılması için:

  - `cd /var/www/html/sitelerim/html`
  - `mkdir adminer`
  - `cd /adminer`
  - `wget -O index.php https://www.adminer.org/latest.php` komutu ile gerekli adminer dosyasını indir.

- Host edilecek sitelere ait dosyaları **SUNUCU**'ya kopyalayınız
  - `scp` ile nasıl kopyalanır?
    - `scp -r kaynak/* hedef:kopyanın oluşturulacağı klasör` komutu ile kaynak dizinindeki (tüm = "/\*") dosya ve klasörleri hedef klasöre kopyalarız.
    - `scp -r /var/www/html/sitelerim/* root@192.168.1.200:/var/www`
  - `rsync` ile nasıl kopyalanır?
    - `rsync -ravz kaynak/* hedef:kopyanın oluşturulacağı klasör` komutu ile kaynak dizinindeki (tüm = "/\*") dosya ve klasörleri hedef klasör ile senkronize ederiz.
    - `rsync -ravz /var/www/html/sitelerim/* root@192.168.1.200:/var/www`

## **SUNUCU** Bilgisayarınızda Yapılacaklar

- `ssh` ile kendi bilgisayarından **SUNUCU**'ya uzaktan bağlanın

- Apache config dosyası tanımlarını oluşturun
  - Host edilecek her bir domaine `DOMAIN.com.tr` ve `www.DOMAIN.com.tr` örneğine göre erişilebilmelidir
- Oluşturduğunuz tanım dosyalarını etkinleştirin

- Apache servisini yeniden başlatın

  - `cd /etc/apache2/sites-available/` komutu ile ilgili klasöre geçilir.

    - aaa.com.tr için:

      - `cp 000-default.conf aaa.com.tr.conf` komutu "000-default.conf" dosyasını "aaa.com.tr.conf" adı ile kopyalar.
      - `vim aaa.com.tr.conf` komutu "aaa.com.tr.conf" dosyasını düzenler.

        ```
        <VirtualHost *:80>
                # The ServerName directive sets the request scheme, hostname and port that
                # the server uses to identify itself. This is used when creating
                # redirection URLs. In the context of virtual hosts, the ServerName
                # specifies what hostname must appear in the request's Host: header to
                # match this virtual host. For the default virtual host (this file) this
                # value is not decisive as it is used as a last resort host regardless.
                # However, you must set it for any further virtual host explicitly.
                ServerName aaa.com.tr
                ServerAlias www.aaa.com.tr

                ServerAdmin osmankayi06@gmail.com
                DocumentRoot /var/www/aaa
        ```

      - `a2ensite aaa.com.tr.conf` komutu site aktivasyonu yapar.
      - `service apache2 restart` komutu değişikliklerin uygulanması için apache'yi yeniler.

    - bbb.com.tr için:

      - `cp 000-default.conf bbb.com.tr.conf` komutu "000-default.conf" dosyasını "bbb.com.tr.conf" adı ile kopyalar.
      - `vim bbb.com.tr.conf` komutu "bbb.com.tr.conf" dosyasını düzenler.

        ```
        <VirtualHost *:80>
                # The ServerName directive sets the request scheme, hostname and port that
                # the server uses to identify itself. This is used when creating
                # redirection URLs. In the context of virtual hosts, the ServerName
                # specifies what hostname must appear in the request's Host: header to
                # match this virtual host. For the default virtual host (this file) this
                # value is not decisive as it is used as a last resort host regardless.
                # However, you must set it for any further virtual host explicitly.
                ServerName bbb.com.tr
                ServerAlias www.bbb.com.tr

                ServerAdmin osmankayi06@gmail.com
                DocumentRoot /var/www/bbb
        ```

      - `a2ensite bbb.com.tr.conf` komutu site aktivasyonu yapar.
      - `service apache2 restart` komutu değişikliklerin uygulanması için apache'yi yeniler.

    - ccc.com.tr için:

      - `cp 000-default.conf ccc.com.tr.conf` komutu "000-default.conf" dosyasını "ccc.com.tr.conf" adı ile kopyalar.
      - `vim ccc.com.tr.conf` komutu "ccc.com.tr.conf" dosyasını düzenler.

        ```
        <VirtualHost *:80>
                # The ServerName directive sets the request scheme, hostname and port that
                # the server uses to identify itself. This is used when creating
                # redirection URLs. In the context of virtual hosts, the ServerName
                # specifies what hostname must appear in the request's Host: header to
                # match this virtual host. For the default virtual host (this file) this
                # value is not decisive as it is used as a last resort host regardless.
                # However, you must set it for any further virtual host explicitly.
                ServerName ccc.com.tr
                ServerAlias www.ccc.com.tr

                ServerAdmin osmankayi06@gmail.com
                DocumentRoot /var/www/ccc
        ```

      - `a2ensite ccc.com.tr.conf` komutu site aktivasyonu yapar.
      - `service apache2 restart` komutu değişikliklerin uygulanması için apache'yi yeniler.

## Kendi Bilgisayarınızda TARAYICI Üzerinden Yapılacaklar

- `aaa.com.tr` ve `www.aaa.com.tr` adreslerinden site açılıyor mu?
- `bbb.com.tr` ve `www.bbb.com.tr` adreslerinden site açılıyor mu?
- `ccc.com.tr` ve `www.ccc.com.tr` adreslerinden site açılıyor mu?
- SUNUCUIP adresinden site açılıyor, Türk bayrağı ve mesaj görünüyor mu?
- SUNUCUIP/adminer adresinden site açılıyor mu?

# VİZE SORULARI

- HOST ettiğiniz sitenin sayfa sonunda "&#169; 2021-2022. Made with &#9829;" mesajı görünsün.

- `2022` bölümü içinde bulunduğumuz olacak şekilde dinamik olsun. Yani, `2024` yılında açıldığında `2021-2024` olarak görünsün.

- Bu şekilde değiştirdiğiniz dosyaları **SUNUCU**'ya `rsync` komutu ile yükleyiniz.

- **SUNUCU**'nun saat dilimini (TimeZone) `Europe/Istanbul` olarak ayarlayın

- **SUNUCU**'nun `root` kullanıcısının şifresini `123` olarak değiştirin

- **SUNUCU**'ya `ssh` komutu ve "şifreniz" ile erişim sağlayın

- `mariadb-server` ve `mariadb-client` paketlerini kurun

- Şu MySQL komutları çalıştırın: (MySQL shell ekranına girmeden çalıştırın!)

  - `use mysql;update user set plugin='' where User='root';flush privileges;`

- MySQL'e `dbadmin` adında ve `QAZ123` şifresi ile yeni bir kullanıcı ekleyin

  - `GRANT ALL ON *.* TO 'dbadmin'@'localhost' IDENTIFIED BY 'QAZ123' WITH GRANT OPTION; FLUSH PRIVILEGES;`

- `mysql_secure_installation` programını kullanarak MySQL sunucusunun `root` kullanıcısının şifresini `root123` olarak değiştirin

# FİNAL SORUSU

- Yukarıdaki tüm işlemleri sırasıyla yapacak `.sh` dosyalarını hazırlayın.

- For more information, you can visit [Digital Ocean Community](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-22-04)
