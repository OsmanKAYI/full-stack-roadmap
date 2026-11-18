# Android Cihaz Hata Ayıklama Rehberi

Baştan sona: fiziksel Android telefonu bağla, uygulamayı kur, WebView'i incele.

## 1. Geliştirici Seçeneklerini Aç (telefonda)

Ayarlar → Telefon hakkında → **Derleme numarası**na 7 kez dokun → Geliştirici seçenekleri görünür.

## 2. ADB Bağlantısı

### USB

1. Geliştirici seçenekleri → **USB hata ayıklama** → AÇ.
2. Kabloyu tak (veri kablosu — sadece şarj kablosu olmaz). Açtıktan sonra
   çıkarıp tekrar tak — USB fonksiyonu bağlantı anında kurulur.
3. Telefonda çıkan **"USB hata ayıklamaya izin verilsin mi / RSA parmak izi"**
   sorusunu onayla.
4. Doğrula: `adb devices -l` → cihaz `device` durumunda listelenmeli.
   Telefon `lsusb`'de görünüyor ama `adb devices`'te yoksa sadece MTP aktif —
   USB hata ayıklama kapalı veya üretici engelliyor (bkz. §4).

### Kablosuz (Android 11+)

1. Telefon ve bilgisayar **aynı ağda** olmalı. Geliştirici seçenekleri →
   **Kablosuz hata ayıklama** → AÇ.
2. **"Eşleştirme kodu ile cihazı eşleştir"**e dokun → `IP:PORT` + 6 haneli kodu not et.
3. `adb pair IP:PORT KOD` → "Successfully paired".
4. `adb connect IP:PORT` — bağlantı portu eşleştirme portundan **farklıdır**
   ve her açıp kapamada **değişir**. Güncel portu `adb mdns services`
   ile bul (`_adb-tls-connect._tcp` kaydına bak).
5. `connection refused` = henüz eşleştirilmemiş veya port eski →
   `mdns services` ile tekrar kontrol et.

## 3. APK Kurulumu

```bash
adb install -r app-release.apk          # normal yol
```

`INSTALL_FAILED_USER_RESTRICTED` hatası (SIM/Mi hesabı olmayan MIUI):

```bash
adb push app-release.apk /sdcard/Download/app-release.apk
adb shell 'am start -a android.intent.action.VIEW \
  -d "content://com.android.externalstorage.documents/document/primary%3ADownload%2Fapp-release.apk" \
  -t "application/vnd.android.package-archive"'
# sonra telefon ekranında "Yükle"yi onayla
```

## 4. Üretici Kusurları (önemli)

- **OPPO / ColorOS**: **SIM kart** takılı değilse (bazı sürümlerde HeyTap/OPPO
  hesabı da gerekli) USB hata ayıklama sessizce çalışmaz. Toggle açık görünür
  ama USB'de ADB arayüzü oluşmaz. Çözüm: SIM tak ya da kablosuz hata ayıklama kullan.
- **Xiaomi / MIUI**: **"USB üzerinden yükle"** (ve çoğunlukla "USB hata
  ayıklama — Güvenlik ayarları") açılmadan `adb install` engellenir; iki toggle
  da **SIM + Mi hesabı** ister. SIM yoksa yukarıdaki `adb push` + yükleyici
  intent yolunu kullan.
- Kablosuz hata ayıklama portları **geçicidir** — asla kodlara gömme.

## 5. Uygulama WebView'ini İncele (CDP)

`MainActivity` içinde `WebView.setWebContentsDebuggingEnabled(true)` gerekir
(sadece debug/dev build'lerde — mağaza sürümünden önce kaldır veya koşula bağla).

```bash
PKG=<uygulama.paket.adi>
PID=$(adb shell pidof $PKG | tr -d '\r')
adb forward tcp:9222 localabstract:webview_devtools_remote_$PID
curl -s http://localhost:9222/json        # debug hedeflerini listele, uygulama sayfasını bul
```

Ardından WebView'i Playwright/CDP script'leriyle sür (route gez, DOM
geometrisi ölç, ekran görüntüsü al).

Faydalı ekstralar:

```bash
adb exec-out screencap -p > shot.png      # anlık ekran görüntüsü
adb logcat | grep -E "chromium|CONSOLE"   # webview hataları + JS console
adb shell monkey -p $PKG 1                # uygulamayı başlat
adb shell 'ls /sdcard/Download/'          # gönderilen/indirilen dosyaları doğrula
adb shell dumpsys package $PKG | grep lastUpdateTime  # kurulu build'i teyit et
```

## 6. Hızlı Sorun Giderme

| Belirti                                   | Çözüm                                                        |
| ----------------------------------------- | ------------------------------------------------------------ |
| `adb devices` boş, telefon `lsusb`'de var | USB hata ayıklama kapalı → aç + kabloyu çıkar/tak            |
| `lsusb`'de de yok                         | Sadece-şarj kablosu/port → kabloyu değiştir                  |
| Kablosuz `connection refused`             | Eşleştirilmemiş → taze kod/port ile `adb pair`               |
| Port sürekli değişiyor                    | Normal — her seferinde `adb mdns services` ile sorgula       |
| `INSTALL_FAILED_USER_RESTRICTED`          | MIUI: "USB üzerinden yükle" aç veya §3 push yolunu kullan    |
| CDP `json` endpoint'i boş                 | Uygulama kapalı veya `setWebContentsDebuggingEnabled` kapalı |
