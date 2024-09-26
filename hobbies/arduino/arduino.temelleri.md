# Arduino’ya Yeni Başlayan Bir Kişinin Bilmesi Gerekenler ve Kullanması Gereken Malzemeler

## Bilinmesi Gerekenler

### 1. Arduino Nedir?
  
- **Mikrodenetleyici Kartı**: Temel olarak bir bilgisayar gibi çalışır, programlanabilir.
- **Giriş/Çıkış Pinleri**: Sensörlerden veri alır ve LED gibi bileşenleri kontrol eder.
- **USB Bağlantısı**: Programlama ve güç sağlama için kullanılır.
- **Güç Kaynağı**: 5V veya 3.3V olarak çalışır, harici güç kaynakları ile beslenebilir.
- **Kütüphaneler**: Özel işlevler eklemek için kullanılan yazılım paketleri.

### 2. Temel Elektronik Bilgisi
  
- **Devre**: Elektronik bileşenlerin bağlantılarının oluşturulduğu yapı.
- **LED**: Işık yayan küçük bir bileşen.
- **Direnç**: Akımın geçişini sınırlayan bileşen.
- **Kondansatör**: Elektrik yükünü depolayan ve salan bileşen.
- **Transistör**: Elektrik sinyallerini amplifiye eden veya anahtar olarak kullanılan bileşen.

### 3. Kodlama
  
- **C/C++ Dili**: Arduino kodları bu dillerde yazılır.
- **setup() Fonksiyonu**: Başlangıç ayarları ve yapılandırmalar için kullanılır.
- **loop() Fonksiyonu**: Programın sürekli olarak çalışmasını sağlar.
- **Fonksiyonlar**: Belirli görevleri yerine getiren kod blokları.
- **Değişkenler**: Verileri saklamak için kullanılır.

### 4. Temel Devre Kurulumu
  
- **Breadboard**: Komponentleri kolayca yerleştirip bağlamaya yarar.
- **Jumper Kabloları**: Devre elemanlarını breadboard'a bağlamak için kullanılır.
- **GND Bağlantısı**: Topraklama pinleri ile devreyi tamamlar.
- **VCC Bağlantısı**: Güç sağlamak için kullanılır.
- **Yüksek Voltajdan Kaçınma**: Güvenlik için düşük voltajlı devreler kullanılır.

## Kullanılması Gereken Malzemeler

### 1. Arduino Kartı
  
- **Arduino Uno**: Başlangıç için en yaygın ve uygun fiyatlı karttır.
- **Arduino Nano**: Küçük boyutlu, taşınabilir versiyon.
- **Arduino Mega**: Daha fazla pin ve bellek kapasitesi sunar.
- **Arduino Leonardo**: USB cihaz olarak çalışabilir.
- **Arduino Due**: Daha güçlü işlemci ve 32-bit özellikler sunar.

### 2. Breadboard
  
- **Küçük Breadboard**: Basit projeler için yeterli olabilir.
- **Orta Boy Breadboard**: Orta ölçekli projeler için idealdir.
- **Büyük Breadboard**: Daha karmaşık devreler için kullanılır.
- **Breadboard ile Jumper Kabloları**: Devre elemanlarını kolayca bağlamanızı sağlar.
- **Breadboard Adaptörü**: Kısıtlı alanlarda daha düzenli bağlantılar sağlar.

### 3. Jumper Kabloları
  
- **Kısa Jumper Kabloları**: Breadboard üzerindeki kısa mesafeler için kullanılır.
- **Uzun Jumper Kabloları**: Daha uzun mesafeler için idealdir.
- **Renkli Kablolar**: Bağlantıları kolay ayırt etmek için kullanılır.
- **Düz Kablolar**: Aynı renkte, dümdüz kablolar.
- **Yamuk Kablolar**: İki farklı renk seçeneğiyle, çapraz bağlantılar için kullanılır.

### 4. LED ve Direnç
  
- **5mm LED**: Yaygın olarak kullanılan standart LED.
- **10mm LED**: Daha büyük ve daha parlak LED.
- **220Ω Direnç**: LED’ler için yaygın olarak kullanılan direnç.
- **1kΩ Direnç**: Genel amaçlı kullanılır, çeşitli devrelerde.
- **Direnç Değerleri**: Çeşitli direnç değerleri, farklı uygulamalar için gerekli olabilir.

### 5. Düğme (Buton)
  
- **Push Button**: Tek bir kez basıldığında çalışır.
- **Tactile Button**: Küçük ve hassas düğme, genellikle kısa süreli basışlar için kullanılır.
- **Rocker Switch**: On/Off anahtar olarak kullanılır.
- **Slide Switch**: Durum değiştirmek için kaydırılır.
- **Momentary Switch**: Basıldığında sinyal gönderir, bırakıldığında kesilir.

### 6. Potansiyometre
  
- **10kΩ Potansiyometre**: Çoğu başlangıç projesi için yeterli.
- **100kΩ Potansiyometre**: Daha geniş ayar aralığı sunar.
- **Beyaz Tip Potansiyometre**: Genellikle düşük maliyetli ve kolay bulunur.
- **Mikro Potansiyometre**: Küçük ve hassas ayar için kullanılır.
- **Büyük Potansiyometre**: Daha büyük projeler için kullanılır.

### 7. MPU6050 (Opsiyonel)
  
- **İvmeölçer ve Jiroskop**: Hareket ve yön ölçümünü sağlar.
- **Giriş/Açık**: I2C bağlantısı ile Arduino'ya bağlanır.
- **Kütüphane**: MPU6050 ile iletişim kurmak için kütüphaneler gereklidir.
- **Kalibrasyon**: Hassas veri elde etmek için sensörün kalibre edilmesi gerekebilir.
- **Sensör Montajı**: Sensörün doğru şekilde monte edilmesi önemlidir.

### 8. LCD Ekran (Opsiyonel)
  
- **16x2 LCD Ekran**: 16 sütun ve 2 satır veri gösterebilir.
- **20x4 LCD Ekran**: Daha büyük ekranlı, daha fazla veri gösterebilir.
- **I2C Modülü**: LCD ekranı daha kolay bağlamak için kullanılır.
- **Yazı Göstergesi**: Bilgi veya mesaj göstermek için kullanılır.
- **Kontrast Ayarı**: Ekranın okunabilirliğini ayarlamak için kullanılır.

### 9. Buzzer (Opsiyonel)
  
- **Pasif Buzzer**: Tek ses frekansı çıkarır.
- **Aktif Buzzer**: Çeşitli ses tonları çıkarabilir.
- **Sesli Uyarı**: Projelerde sesli uyarılar vermek için kullanılır.
- **Melodi Çalıcı**: Basit melodiler veya sinyaller için kullanılır.
- **Geri Bildirim**: Kullanıcı etkileşimleri için sesli geri bildirim sağlar.

### 10. Dirençler ve Kapasitörler
  
- **220Ω Direnç**: LED’ler için kullanılır.
- **1kΩ Direnç**: Genel amaçlı direnç.
- **10kΩ Direnç**: Çeşitli devrelerde kullanılır.
- **100μF Kapasitör**: Elektrik yükünü depolar ve denge sağlar.
- **10μF Kapasitör**: Daha küçük kapasitanslı, sinyal filtresi olarak kullanılır.

### 11. Röle
  
- **5V Röle**: 5V sinyal ile kontrol edilen anahtar.
- **12V Röle**: Daha yüksek voltajlı uygulamalar için kullanılır.
- **Tekli Röle**: Tek bir cihazı kontrol eder.
- **Çiftli Röle**: İki cihazı kontrol eder.
- **Röle Modülü**: Röleyi daha kolay kullanmak için modül şeklinde gelir.

### 12. LDR (Light Dependent Resistor)
  
- **10kΩ LDR**: Ortam ışığını algılamak için yaygın olarak kullanılır.
- **Fotodiyot**: LDR'nin daha hassas bir versiyonu.
- **Işık Sensörü**: Çevresel ışık seviyelerini ölçer.
- **Dirençli Çıkış**: Işık seviyesine bağlı olarak direnç değişir.
- **Güneş Işığı Algılayıcı**: Güneş ışığının seviyesini ölçmek için kullanılır.

### 13. HC-SR04 (Ultrasonik Mesafe Sensörü)
  
- **Mesafe Ölçümü**: Nesneye olan mesafeyi ölçer.
- **4 Pinli Bağlantı**: VCC, GND, TRIG, ECHO pinleri ile çalışır.
- **Ultrasonik Dalga**: Ses dalgalarını kullanarak mesafe ölçer.
- **Sonar Prensibi**: Ses dalgalarının geri dönüş süresini hesaplar.
- **Kütüphane ve Kod**: HC-SR04 ile iletişim kurmak için kütüphaneler ve kod örnekleri kullanılır.
