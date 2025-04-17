# Arduino Örnek Projeler

**Arduino IDE Ayarları:**

- `Tools` menüsünden
  - **Board:** Arduino Uno
  - **Port:** dev/ttyUSB0
  - **Programmer:** AVRISP mkll

## LED Yakma Rehberi

### Bağlantı Şeması

- LED'in uzun bacağı anot (+), kısa bacağı katot (-) uçtur.
- Anot (+) ucuna 220Ω direnç bağlanır.
- Direncin diğer ucu Arduino'nun dijital pinlerinden birine bağlanır (örneğin Pin 7).
- Katot (-) ucu Arduino'nun GND (ground [-]) pinine bağlanır.

**Bağlantı Talimatları:**

- **GND** --> LED (-)
- **LED (+)** --> 220Ω Direnç --> **Pin 7**

### Örnek Kod

```cpp
#define LED_PIN 7  // LED'in bağlı olduğu dijital pin

void setup() {
  // LED_PIN'i çıkış olarak ayarla
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  // LED'i yak
  digitalWrite(LED_PIN, HIGH);
  delay(1000);  // 1 saniye bekle

  // LED'i söndür
  digitalWrite(LED_PIN, LOW);
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **LED_PIN**: LED'in bağlı olduğu dijital pini tanımlar. Bu örnekte, LED 7 numaralı pine bağlanmıştır.
- **setup()**: LED_PIN çıkış olarak ayarlanır.
- **loop()**: LED 1 saniye boyunca yanar, ardından 1 saniye boyunca söner. Bu işlem sürekli olarak tekrarlanır.

Bu basit devre ve kodla, Arduino ile LED'inizi kolayca yakıp söndürebilirsiniz.

## Butona Basınca Serial Ekranına Bilgi Verme

### Bağlantı Şeması

- Butonun bir ucu Arduino'nun dijital pinlerinden birine (örneğin Pin 2) bağlanır.
- Diğer ucu GND (ground [-]) pinine bağlanır.
- Ayrıca, butonun Arduino'ya bağlı ucu 10kΩ direnç üzerinden 5V pinine bağlanır.

**Bağlantı Talimatları:**

- **Buton --> Pin 2**
- **Buton --> GND**
- **Buton --> 10kΩ Direnç --> 5V**

**NOT1:** GND ve Direnç düğmenin aynı tarafındaki ayaklara bağlanmalıdır.

**NOT2:** Pin ucu düğmenin diğer tarafında tek başına bağlanmalıdır.

![Butona Basınca Serial Ekranına Bilgi Verme](https://www.mobilhanem.com/wp-content/uploads/2017/08/button.png)

### Örnek Kod

```cpp
#define BUTTON_PIN 2  // Butonun bağlı olduğu dijital pin

void setup() {
  Serial.begin(9600);  // Serial iletişimi başlat
  pinMode(BUTTON_PIN, INPUT);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) {
    Serial.println("Butona basıldı!");
    delay(500);  // Yeniden basılmasını engellemek için kısa bir gecikme
  }
}
```

### Açıklama

- **BUTTON_PIN**: Butonun bağlı olduğu dijital pin. Bu örnekte, buton 2 numaralı pine bağlanmıştır.
- **setup()**: Serial iletişim başlatılır ve BUTTON_PIN giriş olarak ayarlanır.
- **loop()**: Butona basıldığında serial ekrana "Butona basıldı!" yazısı gönderilir.

## Buton Basınca Çalışan Buzzer

### Bağlantı Şeması

- Butonun bir ucu Arduino'nun dijital pinlerinden birine (örneğin Pin 2) bağlanır.
- Diğer ucu GND (ground [-]) pinine bağlanır.
- Ayrıca, butonun Arduino'ya bağlı ucu 10kΩ direnç üzerinden 5V pinine bağlanır.
- Buzzer’ın artı (+) ucu Arduino’nun dijital pinlerinden birine (örneğin Pin 8) bağlanır, eksi (-) ucu ise GND pinine bağlanır.

**Bağlantı Talimatları:**

- **Buton --> Pin 2**
- **Buton --> GND**
- **Buton --> 10kΩ Direnç --> 5V**
- **Buzzer (+) --> Pin 8**
- **Buzzer (-) --> GND**

**NOT1:** GND ve Direnç düğmenin aynı tarafındaki ayaklara bağlanmalıdır.

**NOT2:** Pin ucu düğmenin diğer tarafında tek başına bağlanmalıdır.

### Örnek Kod

```cpp
#define BUTTON_PIN 2  // Butonun bağlı olduğu dijital pin
#define BUZZER_PIN 8  // Buzzer'ın bağlı olduğu dijital pin

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) {
    digitalWrite(BUZZER_PIN, HIGH);  // Buzzer'ı çalıştır
  } else {
    digitalWrite(BUZZER_PIN, LOW);   // Buzzer'ı durdur
  }
}
```

### Açıklama

- **BUTTON_PIN**: Butonun bağlı olduğu dijital pin.
- **BUZZER_PIN**: Buzzer’ın bağlı olduğu dijital pin.
- **setup()**: BUTTON_PIN giriş olarak, BUZZER_PIN çıkış olarak ayarlanır.
- **loop()**: Butona basıldığında buzzer çalışır, bırakıldığında durur.

## Butona Basınca Çalışan LED

### Bağlantı Şeması

- Butonun bir ucu Arduino'nun dijital pinlerinden birine (örneğin Pin 2) bağlanır.
- Diğer ucu GND (ground [-]) pinine bağlanır.
- Ayrıca, butonun Arduino'ya bağlı ucu 10kΩ direnç üzerinden 5V pinine bağlanır.
- LED’in anot (+) ucu bir 220Ω direnç aracılığıyla Arduino’nun dijital pinlerinden birine (örneğin Pin 7) bağlanır.
- Katot (-) ucu GND pinine bağlanır.

**Bağlantı Talimatları:**

- **Buton --> Pin 2**
- **Buton --> GND**
- **Buton --> 10kΩ Direnç --> 5V**
- **LED (+) --> 220Ω Direnç --> Pin 7**
- **LED (-) --> GND**

### Örnek Kod

```cpp
#define BUTTON_PIN 2  // Butonun bağlı olduğu dijital pin
#define LED_PIN 7     // LED'in bağlı olduğu dijital pin

void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) {
    digitalWrite(LED_PIN, HIGH);  // LED'i yak
  } else {
    digitalWrite(LED_PIN, LOW);   // LED'i söndür
  }
}
```

### Açıklama

- **BUTTON_PIN**: Butonun bağlı olduğu dijital pin.
- **LED_PIN**: LED'in bağlı olduğu dijital pin.
- **setup()**: BUTTON_PIN giriş olarak, LED_PIN çıkış olarak ayarlanır.
- **loop()**: Butona basıldığında LED yanar, bırakıldığında söner.

## Tekli Röle ile Lamba Yakma

### Bağlantı Şeması

- Rölenin kontrol pini Arduino’nun dijital pinlerinden birine (örneğin Pin 4) bağlanır.
- Rölenin NO (Normally Open) ve COM pinlerine lamba bağlanır.
- Lamba, bir güç kaynağına bağlanır.

**Bağlantı Talimatları:**

- **Röle IN --> Pin 4**
- **Lamba --> Röle NO ve COM pinleri**
- **Lamba --> Güç kaynağı**

### Örnek Kod

```cpp
#define RELAY_PIN 4  // Rölenin bağlı olduğu dijital pin

void setup() {
  pinMode(RELAY_PIN, OUTPUT);
}

void loop() {
  digitalWrite(RELAY_PIN, HIGH);  // Lambayı yak
  delay(1000);  // 1 saniye bekle
  digitalWrite(RELAY_PIN, LOW);   // Lambayı söndür
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **RELAY_PIN**: Rölenin bağlı olduğu dijital pin.
- **setup()**: RELAY_PIN çıkış olarak ayarlanır.
- **loop()**: Lamba 1 saniye boyunca yanar, ardından 1 saniye boyunca söner.

## İkili Röle ile Lamba Yakma

### Bağlantı Şeması

- İlk rölenin kontrol pini Arduino’nun dijital pinlerinden birine (örneğin Pin 4) bağlanır.
- İkinci rölenin kontrol pini Arduino’nun dijital pinlerinden birine (örneğin Pin 5) bağlanır.
- Her iki rölenin NO (Normally Open) ve COM pinlerine lamba bağlanır.
- Lambalar, güç kaynağına bağlanır.

**Bağlantı Talimatları:**

- **1. Röle IN --> Pin 4**
- **2. Röle IN --> Pin 5**
- **Lamba --> Röle NO ve COM pinleri**
- **Lambalar --> Güç kaynağı**

### Örnek Kod

```cpp
#define RELAY1_PIN 4  // 1. Rölenin bağlı olduğu dijital pin
#define RELAY2_PIN 5  // 2. Rölenin bağlı olduğu dijital pin

void setup() {
  pinMode(RELAY1_PIN, OUTPUT);
  pinMode(RELAY2_PIN, OUTPUT);
}

void loop() {
  digitalWrite(RELAY1_PIN, HIGH);  // 1. lambayı yak
  digitalWrite(RELAY2_PIN, HIGH);  // 2. lambayı yak
  delay(1000);  // 1 saniye bekle

  digitalWrite(RELAY1_PIN, LOW);   // 1. lambayı söndür
  digitalWrite(RELAY2_PIN, LOW);   // 2. lambayı söndür
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **RELAY1_PIN**: 1. rölenin bağlı olduğu dijital pin.
- **RELAY2_PIN**: 2. rölenin bağlı olduğu dijital pin.
- **setup()**: RELAY1_PIN ve RELAY2_PIN çıkış olarak ayarlanır.
- **loop()**: Lambalar 1 saniye boyunca yanar, ardından 1 saniye boyunca söner.

## LDR Durumunu Serial Ekrana Yazma

### Bağlantı Şeması

- LDR’nin bir ucu 5V pinine, diğer ucu ise bir 10kΩ direnç üzerinden GND’ye bağlanır.
- LDR’nin Arduino’ya bağlı ucu aynı zamanda analog pinlerden birine (örneğin A0) bağlanır.

**Bağlantı Talimatları:**

- **LDR --> A0**
- **LDR --> 10kΩ Direnç --> GND**
- **LDR --> 5V**

### Örnek Kod

```cpp
#define LDR_PIN A0  // LDR'nin bağlı olduğu analog pin

void setup() {
  Serial.begin(9600);  // Serial iletişimi başlat
}

void loop() {
  int ldrValue = analogRead(LDR_PIN);  // LDR değerini oku
  Serial.println(ldrValue);  // Değeri serial ekrana yazdır
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **LDR_PIN**: LDR’nin bağlı olduğu analog pin.
- **setup()**: Serial iletişim başlatılır.
- **loop()**: LDR değerini okur ve serial ekrana yazdırır.

## LDR Durumuna Göre LED Parlaklığı Ayarlama

### Bağlantı Şeması

- LDR ve bağlantı şeması yukarıdaki gibi bağlanır.
- LED’in anot (+) ucu bir 220Ω direnç aracılığıyla Arduino’nun dijital pinlerinden birine (örneğin Pin 9) bağlanır.
- Katot (-) ucu GND pinine bağlanır.

**Bağlantı Talimatları:**

- **LDR --> A0**
- **LDR --> 10kΩ Direnç --> GND**
- **LDR --> 5V**
- **LED (+) --> 220Ω Direnç --> Pin 9**
- **LED (-) --> GND**

### Örnek Kod

```cpp
#define LDR_PIN A0  // LDR'nin bağlı olduğu analog pin
#define LED_PIN 9   // LED'in bağlı olduğu dijital pin

void setup() {
  pinMode(LED_PIN, OUTPUT);  // LED pinini çıkış olarak ayarla
}

void loop() {
  int ldrValue = analogRead(LDR_PIN);  // LDR değerini oku
  int brightness = map(ldrValue, 0, 1023, 0, 255);  // Değeri 0-255 aralığına dönüştür
  analogWrite(LED_PIN, brightness);  // LED parlaklığını ayarla
  delay(100);  // Kodu daha hızlı döngüye almak için gecikmeyi 100 ms yapabilirsiniz
}
```

### Açıklama

- **LDR_PIN**: LDR’nin bağlı olduğu analog pin.
- **LED_PIN**: LED’in bağlı olduğu dijital pin.
- **setup()**: LED_PIN çıkış olarak ayarlanır.
- **loop()**: LDR değerine göre LED’in parlaklığı ayarlanır.

## SCSR04 Mesafe Ölçüm Sonucunu Serial Ekrana Yazma

### Bağlantı Şeması

- SCSR04’ün VCC pini 5V pinine, GND pini ise GND pinine bağlanır.
- Trig pini bir dijital pin (örneğin Pin 10) ve Echo pini başka bir dijital pin (örneğin Pin 11) ile Arduino’ya bağlanır.

**Bağlantı Talimatları:**

- **SCSR04 VCC --> 5V**
- **SCSR04 GND --> GND**
- **SCSR04 Trig --> Pin 10**
- **SCSR04 Echo --> Pin 11**

### Örnek Kod

```cpp
#define TRIG_PIN 10  // Trig pininin bağlı olduğu dijital pin
#define ECHO_PIN 11  // Echo pininin bağlı olduğu dijital pin

void setup() {
  Serial.begin(9600);  // Serial iletişimi başlat
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
}

void loop() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  long duration = pulseIn(ECHO_PIN, HIGH);  // Eko süresini oku
  long distance = (duration / 2) * 0.0344;  // Mesafeyi hesapla (cm)
  
  Serial.print("Mesafe: ");
  Serial.print(distance);
  Serial.println(" cm");
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **TRIG_PIN**: Trig pininin bağlı olduğu dijital pin.
- **ECHO_PIN**: Echo pininin bağlı olduğu dijital pin.
- **setup()**: Serial iletişim başlatılır, pinler ayarlanır.
- **loop()**: Mesafe ölçülür ve serial ekrana yazdırılır.

## SCSR04 ile Nesneye 10 cm'den Az Kalınca Buzzer Çalıştırma

### Bağlantı Şeması

- SCSR04 bağlantısı yukarıdaki gibi yapılır.
- Buzzer’ın artı (+) ucu Arduino’nun dijital pinlerinden birine (örneğin Pin 8) bağlanır, eksi (-) ucu GND pinine bağlanır.

**Bağlantı Talimatları:**

- **SCSR04 VCC --> 5V**
- **SCSR04 GND --> GND**
- **SCSR04 Trig --> Pin 10**
- **SCSR04 Echo --> Pin 11**
- **Buzzer (+) --> Pin 8**
- **Buzzer (-) --> GND**

### Örnek Kod

```cpp
#define TRIG_PIN 10  // Trig pininin bağlı olduğu dijital pin
#define ECHO_PIN 11  // Echo pininin bağlı olduğu dijital pin
#define BUZZER_PIN 8 // Buzzer'ın bağlı olduğu dijital pin

void setup() {
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);
}

void loop() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  long duration = pulseIn(ECHO_PIN, HIGH);  // Eko süresini oku
  long distance = (duration / 2) * 0.0344;  // Mesafeyi hesapla (cm)
  
  if (distance < 10) {
    digitalWrite(BUZZER_PIN, HIGH);  // Buzzer'ı çalıştır
  } else {
    digitalWrite(BUZZER_PIN, LOW);   // Buzzer'ı durdur
  }
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **TRIG_PIN**: Trig pininin bağlı olduğu dijital pin.
- **ECHO_PIN**: Echo pininin bağlı olduğu dijital pin.
- **BUZZER_PIN**: Buzzer’ın bağlı olduğu dijital pin.
- **setup()**: Pinler ayarlanır.
- **loop()**: Mesafe ölçülür ve 10 cm’den yakınsa buzzer çalıştırılır.

## Potansiyometre Değerini Serial Ekrana Yazma

### Bağlantı Şeması

- Potansiyometrenin iki ucu 5V ve GND pinlerine bağlanır.
- Ortadaki ucu Arduino’nun analog pinlerinden birine (örneğin A0) bağlanır.

**Bağlantı Talimatları:**

- **Potansiyometre (Ortadaki Uç) --> A0**
- **Potansiyometre (Bir Uç) --> 5V**
- **Potansiyometre (Diğer Uç) --> GND**

### Örnek Kod

```cpp
#define POT_PIN A0  // Potansiyometrenin bağlı olduğu analog pin

void setup() {
  Serial.begin(9600);  // Serial iletişimi başlat
}

void loop() {
  int potValue = analogRead(POT_PIN);  // Potansiyometre değerini oku
  Serial.println(potValue);  // Değeri serial ekrana yazdır
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **POT_PIN**: Potansiyometrenin bağlı olduğu analog pin.
- **setup()**: Serial iletişim başlatılır.
- **loop()**: Potansiyometre değerini okur ve serial ekrana yazdırır.

## Potansiyometre ile LED Parlaklığı Ayarlama

### Bağlantı Şeması

- Potansiyometre bağlantısı yukarıdaki gibi yapılır.
- LED’in anot (+) ucu bir 220Ω direnç aracılığıyla Arduino’nun dijital pinlerinden birine (örneğin Pin 9) bağlanır.
- Katot (-) ucu GND pinine bağlanır.

**Bağlantı Talimatları:**

- **Potansiyometre (Ortadaki Uç) --> A0**
- **Potansiyometre (Bir Uç) --> 5V**
- **Potansiyometre (Diğer Uç) --> GND**
- **LED (+) --> 220Ω Direnç --> Pin 9**
- **LED (-) --> GND**

### Örnek Kod

```cpp
#define POT_PIN A0  // Potansiyometrenin bağlı olduğu analog pin
#define LED_PIN 9   // LED'in bağlı olduğu dijital pin

void setup() {
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  int potValue = analogRead(POT_PIN);

  // Potansiyometre değerini oku
  int brightness = map(potValue, 0, 1023, 0, 255);  // Değeri 0-255 aralığına dönüştür
  analogWrite(LED_PIN, brightness);  // LED parlaklığını ayarla
  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **POT_PIN**: Potansiyometrenin bağlı olduğu analog pin.
- **LED_PIN**: LED’in bağlı olduğu dijital pin.
- **setup()**: LED_PIN çıkış olarak ayarlanır.
- **loop()**: Potansiyometre değerine göre LED’in parlaklığı ayarlanır.

## 5 LED ile Karaşimşek

### Bağlantı Şeması

- Her LED’in anot (+) ucu bir 220Ω direnç aracılığıyla Arduino’nun dijital pinlerinden birine (örneğin Pin 2, Pin 3, Pin 4, Pin 5, Pin 6) bağlanır.
- LED’lerin katot (-) uçları GND pinine bağlanır.

**Bağlantı Talimatları:**

- **LED1 (+) --> 220Ω Direnç --> Pin 2**
- **LED2 (+) --> 220Ω Direnç --> Pin 3**
- **LED3 (+) --> 220Ω Direnç --> Pin 4**
- **LED4 (+) --> 220Ω Direnç --> Pin 5**
- **LED5 (+) --> 220Ω Direnç --> Pin 6**
- **LED (-) --> GND**

### Örnek Kod

```cpp
#define LED1_PIN 2
#define LED2_PIN 3
#define LED3_PIN 4
#define LED4_PIN 5
#define LED5_PIN 6

void setup() {
  pinMode(LED1_PIN, OUTPUT);
  pinMode(LED2_PIN, OUTPUT);
  pinMode(LED3_PIN, OUTPUT);
  pinMode(LED4_PIN, OUTPUT);
  pinMode(LED5_PIN, OUTPUT);
}

void loop() {
  // Karaşimşek efekti
  for (int i = 0; i < 5; i++) {
    digitalWrite(LED1_PIN, HIGH);
    delay(100);
    digitalWrite(LED1_PIN, LOW);
    delay(100);
    
    digitalWrite(LED2_PIN, HIGH);
    delay(100);
    digitalWrite(LED2_PIN, LOW);
    delay(100);
    
    digitalWrite(LED3_PIN, HIGH);
    delay(100);
    digitalWrite(LED3_PIN, LOW);
    delay(100);
    
    digitalWrite(LED4_PIN, HIGH);
    delay(100);
    digitalWrite(LED4_PIN, LOW);
    delay(100);
    
    digitalWrite(LED5_PIN, HIGH);
    delay(100);
    digitalWrite(LED5_PIN, LOW);
    delay(100);
  }
}
```

### Açıklama

- **LED1_PIN, LED2_PIN, LED3_PIN, LED4_PIN, LED5_PIN**: LED'lerin bağlı olduğu dijital pinler.
- **setup()**: LED pinleri çıkış olarak ayarlanır.
- **loop()**: LED'ler sırayla yanar ve söner, bir karaşimşek efekti oluşturur.

## 16x02 LCD Kullanımı: "Merhaba Dünya" Örneği

### Bağlantı Şeması

- LCD’nin VCC pini 5V pinine bağlanır.
- LCD’nin GND pini GND pinine bağlanır.
- LCD’nin VO pini bir potansiyometre (10kΩ) üzerinden GND’ye bağlanarak kontrast ayarı yapılır.
- LCD’nin RS pini bir dijital pin (örneğin Pin 12) ile Arduino’ya bağlanır.
- LCD’nin RW pini GND’ye bağlanır.
- LCD’nin E pini bir dijital pin (örneğin Pin 11) ile Arduino’ya bağlanır.
- LCD’nin D0-D3 pinleri kullanılmaz.
- LCD’nin D4-D7 pinleri dijital pinlere (örneğin Pin 5, 4, 3, 2) bağlanır.

**Bağlantı Talimatları:**

- **LCD VCC --> 5V**
- **LCD GND --> GND**
- **LCD VO --> Potansiyometre --> GND**
- **LCD RS --> Pin 12**
- **LCD RW --> GND**
- **LCD E --> Pin 11**
- **LCD D4 --> Pin 5**
- **LCD D5 --> Pin 4**
- **LCD D6 --> Pin 3**
- **LCD D7 --> Pin 2**

### Örnek Kod

```cpp
#include <LiquidCrystal.h>  // LCD kütüphanesini ekle

// LCD pinlerini tanımla
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup() {
  lcd.begin(16, 2);  // LCD'yi 16 sütun ve 2 satır olarak başlat
  lcd.print("Merhaba, Dünya!");  // LCD'ye "Merhaba, Dünya!" yaz
}

void loop() {
  // Kod burada devam edebilir
}
```

### Açıklama

- **LiquidCrystal lcd(12, 11, 5, 4, 3, 2);**: LCD’nin pinlerini tanımlar.
- **lcd.begin(16, 2);**: LCD’nin satır ve sütun sayılarını ayarlar.
- **lcd.print("Hello, World!");**: LCD’de "Hello, World!" mesajını gösterir.

Bu temel örnekle LCD ekranınızı kullanarak mesajlar görüntüleyebilirsiniz.

## İki Düğme Durumunu LCD Ekrana Yazdırma

### Bağlantı Şeması

- LCD’nin bağlantı şeması yukarıdaki örnekteki gibi yapılır.
- Her iki düğme de dijital pinlere bağlanır:
  - Düğme 1: bir ucu Arduino’nun dijital pinlerinden birine (örneğin Pin 2) bağlanır, diğer ucu GND pinine bağlanır.
  - Düğme 2: bir ucu Arduino’nun dijital pinlerinden birine (örneğin Pin 3) bağlanır, diğer ucu GND pinine bağlanır.
- Ayrıca, her düğme için bir pull-down direnç (10kΩ) GND'ye bağlanır.

**Bağlantı Talimatları:**

- **Düğme 1 --> Pin 2**
- **Düğme 1 --> GND**
- **Düğme 1 --> 10kΩ Direnç --> 5V**

- **Düğme 2 --> Pin 3**
- **Düğme 2 --> GND**
- **Düğme 2 --> 10kΩ Direnç --> 5V**

### Örnek Kod

```cpp
#include <LiquidCrystal.h>  // LCD kütüphanesini ekle

// LCD pinlerini tanımla
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

// Düğme pinlerini tanımla
#define BUTTON1_PIN 2
#define BUTTON2_PIN 3

void setup() {
  lcd.begin(16, 2);  // LCD'yi 16 sütun ve 2 satır olarak başlat
  pinMode(BUTTON1_PIN, INPUT_PULLUP);  // Düğme pinlerini giriş olarak ayarla
  pinMode(BUTTON2_PIN, INPUT_PULLUP);
}

void loop() {
  int button1State = digitalRead(BUTTON1_PIN);  // Düğme 1'in durumunu oku
  int button2State = digitalRead(BUTTON2_PIN);  // Düğme 2'nin durumunu oku

  lcd.clear();  // LCD ekranını temizle
  lcd.setCursor(0, 0);  // İlk satıra git
  lcd.print("Button 1: "); 
  lcd.print(button1State == LOW ? "Pressed" : "Released");  // Düğme 1 durumunu yazdır

  lcd.setCursor(0, 1);  // İkinci satıra git
  lcd.print("Button 2: ");
  lcd.print(button2State == LOW ? "Pressed" : "Released");  // Düğme 2 durumunu yazdır

  delay(500);  // 0.5 saniye bekle
}
```

### Açıklama

- **LiquidCrystal lcd(12, 11, 5, 4, 3, 2);**: LCD’nin pinlerini tanımlar.
- **pinMode(BUTTON1_PIN, INPUT_PULLUP);**: Düğme pinlerini giriş olarak ayarlar ve pull-up direnci kullanır.
- **digitalRead(BUTTON1_PIN);**: Düğme 1’in durumunu okur.
- **lcd.print(button1State == LOW ? "Pressed" : "Released");**: Düğme 1’in durumunu "Pressed" veya "Released" olarak gösterir.
- **lcd.clear();**: LCD ekranını temizler her döngüde.

Bu örnek, iki düğmenin durumunu LCD ekranda göstermenizi sağlar. Düğmelere basıldığında, LCD ekranında "Pressed" yazısı görünecek; basılmadığında "Released" yazısı görünecek.

## MPU6050 Sonucunu Serial Ekrana Yazma

### Bağlantı Şeması

- MPU6050'nin VCC pini 5V pinine bağlanır.
- MPU6050'nin GND pini GND pinine bağlanır.
- MPU6050'nin SDA pini Arduino'nun A4 pinine (veya I2C SDA pinine) bağlanır.
- MPU6050'nin SCL pini Arduino'nun A5 pinine (veya I2C SCL pinine) bağlanır.

**Bağlantı Talimatları:**

- **MPU6050 VCC --> 5V**
- **MPU6050 GND --> GND**
- **MPU6050 SDA --> A4 (veya I2C SDA)**
- **MPU6050 SCL --> A5 (veya I2C SCL)**

### Örnek Kod

Aşağıdaki kod, MPU6050 sensöründen veri okumak ve bu verileri serial ekrana yazdırmak için kullanılır. Bu kodun çalışabilmesi için `Wire` ve `MPU6050` kütüphanelerine ihtiyacınız olacak. `MPU6050` kütüphanesini [bu bağlantıdan](https://github.com/jrowberg/i2cdevlib/tree/master/Arduino/MPU6050) indirebilirsiniz.

```cpp
#include <Wire.h>            // I2C kütüphanesini ekle
#include <MPU6050.h>         // MPU6050 kütüphanesini ekle

MPU6050 mpu;  // MPU6050 nesnesini oluştur

void setup() {
  Serial.begin(9600);  // Serial iletişimi başlat
  Wire.begin();        // I2C iletişimini başlat
  mpu.initialize();    // MPU6050'i başlat

  if (!mpu.testConnection()) {
    Serial.println("MPU6050 bağlantısı başarısız!");
    while (1);  // Bağlantı başarısızsa sonsuz döngüye gir
  }
}

void loop() {
  int16_t ax, ay, az;
  int16_t gx, gy, gz;

  mpu.getAcceleration(&ax, &ay, &az);  // İvme ölçer verilerini oku
  mpu.getRotation(&gx, &gy, &gz);      // Jiroskop verilerini oku

  Serial.print("İvme: X=");
  Serial.print(ax);
  Serial.print(" Y=");
  Serial.print(ay);
  Serial.print(" Z=");
  Serial.println(az);

  Serial.print("Jiroskop: X=");
  Serial.print(gx);
  Serial.print(" Y=");
  Serial.print(gy);
  Serial.print(" Z=");
  Serial.println(gz);

  delay(1000);  // 1 saniye bekle
}
```

### Açıklama

- **Wire.h**: I2C iletişimi için gerekli kütüphanedir.
- **MPU6050.h**: MPU6050 sensörünü kullanmak için gerekli kütüphanedir.
- **mpu.initialize();**: MPU6050 sensörünü başlatır.
- **mpu.getAcceleration(&ax, &ay, &az);**: İvme ölçer verilerini okur.
- **mpu.getRotation(&gx, &gy, &gz);**: Jiroskop verilerini okur.
- **Serial.print()** ve **Serial.println()**: Verileri serial ekrana yazdırır.

Bu kod, MPU6050 sensöründen ivme ve jiroskop verilerini okuyarak her saniye serial ekrana yazdırır.

## Rotary Switch Sonucunu Serial Ekrana Yazma

### Bağlantı Şeması

Rotary switch (dönücü anahtar) genellikle 3 veya 4 pinli olur ve şu şekilde bağlanır:

- **Common (Ortak) Pin**: Arduino'nun dijital pinlerinden birine bağlanır (örneğin Pin 2).
- **CLK (Clock) Pin**: Arduino'nun dijital pinlerinden birine bağlanır (örneğin Pin 3).
- **DT (Data) Pin**: Arduino'nun dijital pinlerinden birine bağlanır (örneğin Pin 4).
- **SW (Switch) Pin** (varsa): Arduino'nun dijital pinlerinden birine bağlanır (örneğin Pin 5).

**Bağlantı Talimatları:**

- **Rotary Common --> Pin 2**
- **Rotary CLK --> Pin 3**
- **Rotary DT --> Pin 4**
- **Rotary SW (varsa) --> Pin 5**
- **Rotary GND --> GND**

### Örnek Kod

Aşağıdaki kod, rotary switch’in yönünü ve düğmeye basılıp basılmadığını okur ve bu bilgileri serial ekrana yazdırır. Kod, bir rotary enkoder ve düğme kombinasyonu için örnektir.

```cpp
#define ENCODER_CLK_PIN 3  // CLK pininin bağlı olduğu dijital pin
#define ENCODER_DT_PIN 4   // DT pininin bağlı olduğu dijital pin
#define BUTTON_PIN 5       // SW pininin bağlı olduğu dijital pin (varsa)

volatile int encoderPos = 0;  // Encoder pozisyonu
int lastEncoderPos = 0;       // Son okunan encoder pozisyonu
bool buttonPressed = false;   // Düğme durumu

void setup() {
  Serial.begin(9600);          // Serial iletişimi başlat
  pinMode(ENCODER_CLK_PIN, INPUT);
  pinMode(ENCODER_DT_PIN, INPUT);
  pinMode(BUTTON_PIN, INPUT_PULLUP);

  attachInterrupt(digitalPinToInterrupt(ENCODER_CLK_PIN), handleEncoder, CHANGE);
  attachInterrupt(digitalPinToInterrupt(BUTTON_PIN), handleButton, FALLING);
}

void loop() {
  if (encoderPos != lastEncoderPos) {
    if (encoderPos > lastEncoderPos) {
      Serial.println("Sağa çevrildi");
    } else {
      Serial.println("Sola çevrildi");
    }
    lastEncoderPos = encoderPos;
  }

  if (buttonPressed) {
    Serial.println("Basıldı");
    buttonPressed = false;
  }

  delay(100);  // 0.1 saniye bekle
}

void handleEncoder() {
  int dtState = digitalRead(ENCODER_DT_PIN);
  if (dtState == HIGH) {
    encoderPos++;
  } else {
    encoderPos--;
  }
}

void handleButton() {
  buttonPressed = true;
}
```

### Açıklama

- **ENCODER_CLK_PIN**: Rotary encoder’in CLK pininin bağlı olduğu dijital pin.
- **ENCODER_DT_PIN**: Rotary encoder’in DT pininin bağlı olduğu dijital pin.
- **BUTTON_PIN**: Rotary encoder’in düğmesinin bağlı olduğu dijital pin.
- **handleEncoder()**: Rotary encoder’in hareketini okur ve pozisyonu günceller.
- **handleButton()**: Düğmeye basıldığını algılar ve durumu günceller.
- **attachInterrupt()**: İnterrupt kullanarak rotary encoder ve düğme olaylarını algılar.

Bu kod, rotary encoder’in yönünü ve düğmeye basılıp basılmadığını algılar ve bu bilgileri serial ekrana yazdırır.
