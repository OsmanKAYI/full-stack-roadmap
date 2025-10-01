# Ubuntu'da PlayStation Remote Play (Chiaki‑NG)

Ubuntu üzerinde Chiaki‑NG kullanarak PS Remote Play kurulumunu adım adım anlatan kapsamlı not. PSN Account ID alma, PS5/PS4 eşleştirme, performans ayarları, denetleyici (DualShock 4 / DualSense) kullanımı ve Sony giriş (OAuth) hatalarının (ör. “Can’t connect to the server. 0.1c…”) çözümü dahildir.

---

## Hedefler

- Ubuntu’da Chiaki‑NG’yi (Flatpak/Flathub) kurmak
- PSN Account ID’yi güvenli şekilde elde etmek
- Konsolu (PS5/PS4) PIN ile eşleştirmek
- Yayın kalitesini optimize etmek (bitrate, audio buffer)
- DualShock 4 / DualSense’i USB/Bluetooth ile kullanmak
- Sony OAuth giriş hatalarını ve Chiaki‑NG log uyarılarını çözmek

---

## Önkoşullar

- İnternet bağlantılı Ubuntu
- Aynı yerel ağda PS5 veya PS4
- PSN kullanıcı bilgileri
- Öneri: Konsol ve PC için kablolu Ethernet

---

## 1) Flatpak kur ve Flathub’ı etkinleştir

İlk kurulum için bir kez çalıştırın:

```bash
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

## 2) Chiaki‑NG’yi kur

Chiaki’nin aktif geliştirilen sürümü Chiaki‑NG, PS5/PS4 için önerilir.

```bash
sudo flatpak install -y flathub io.github.streetpea.Chiaki4deck
```

Çalıştır:

```bash
flatpak run io.github.streetpea.Chiaki4deck
```

İpucu: İlk çalıştırmadan sonra uygulama menüsünden kısayol oluşturabilirsiniz.

---

## 3) PSN Account ID’yi al

Chiaki/Chiaki‑NG, PSN Account ID ister (kullanıcı adınız/online ID değil).

1. Python ve pip olduğundan emin olun:

   ```bash
   sudo apt install -y python3 python3-pip
   ```

2. PEP 668 uyarısından kaçınmak için dağıtım paketini tercih edin:

   ```bash
   sudo apt install -y python3-requests
   ```

3. Resmi script’i indirip çalıştırın:

   ```bash
   curl -L -o psn-account-id.py "https://git.sr.ht/~thestr4ng3r/chiaki/blob/master/scripts/psn-account-id.py?raw=1"
   python3 psn-account-id.py
   ```

4. Script yönergeleri:

- Script Sony OAuth URL’si verir. Tarayıcıda açıp giriş yapın.
- “redirect” sayfası göründüğünde adres çubuğundaki tam URL’yi kopyalayıp terminalde script’e yapıştırın.
- Script bir JSON çıktısı üretir. Yazdırdığı “AccountID” değeri Chiaki‑NG’de kullanılacaktır.

Güvenlik notu:

- Redirect URL’si geçici yetkilendirme kodu içerir, sadece bu script için kullanın; paylaşmayın.

Alternatif (tarayıcı hata verirse):

- OAuth linkini başka bir cihazda (telefon vb.) açın, giriş yapın, son redirect URL’sini kopyalayıp Ubuntu terminalindeki script’e yapıştırın.

---

## 4) PS5/PS4’ü eşleştirmeye hazırla

- PS5: Ayarlar → Ağ → Bağlantı Durumunu Görüntüle → IP Adresi not alın
- PS5: Ayarlar → Sistem → Remote Play → “Remote Play’i Etkinleştir” açık
- (Önerilir) Ağ üzerinden uyandırma için Dinlenme Modu:
  - Ayarlar → Sistem → Güç Tasarrufu → Dinlenme Modunda Kullanılabilen Özellikler:
    - “İnternete Bağlı Kal” açık
    - “Ağ Üzerinden PS5’i Açmayı Etkinleştir” açık
- PIN alma:
  - PS5: Ayarlar → Sistem → Remote Play → “Cihazı Bağla” → ekrandaki PIN’i not alın
  - PS4: Ayarlar → Remote Play → “Cihaz Ekle”

---

## 5) Chiaki‑NG içinde eşleştir

- Chiaki‑NG açılınca konsolunuzu otomatik bulabilir.
- Bulamazsa, konsol IP’siyle manuel ekleyin:
  - PS5: Ayarlar → Ağ → Bağlantı Durumunu Görüntüle → IP Adresi, adım 4’te öğrenmiştik.
- Konsol girişinde “Pair/Eşleştir” deyin ve şunları girin:
  - Account ID: script’ten aldığınız değer
  - PIN: PS5/PS4 “Cihazı Bağla” ekranındaki kod
- Kaydedin ve konsol listesinde cihazınıza çift tıklayıp bağlanın.

---

## 6) Yayın kalitesi optimizasyonu

Chiaki‑NG oturum/profil ayarlarından:

- Bitrate: 20000–30000 kbps ile başlayın (LAN’da 30000 genelde iyi).
- Audio Buffer: 19200, ses tıkanmalarını azaltmada işe yarar.
- Çözünürlük/FPS: Ağ zorlanıyorsa düşürün.

Ağ ipuçları:

- PC ve konsolu mümkünse kablolu bağlayın.
- Güvenlik duvarında yerel ağ trafiğine izin verin.
- Otomatik keşif dengesizse manuel IP ekleyin.

---

## 7) Denetleyiciler (DualShock 4 / DualSense)

- USB: Tak-çalıştır.
- Bluetooth (opsiyonel):

```bash
sudo apt install -y bluez blueman
```

- DualSense haptik/ses için PipeWire genelde en uyumlu. Ubuntu 22.10+ varsayılan olarak PipeWire kullanır.

---

## 8) Sony Giriş (OAuth) Hataları ve Çözümleri

Örnek hata:

- “Can’t connect to the server. (0.1c…be49b222)”

Yaygın sebepler:

- Tarayıcı uzantıları (ad-block, privacy) bileşenleri engelliyor.
- `3. taraf çerezleri` ve açılır pencereler engelli.
- VPN/Proxy/katı DNS (DoH/DoT) müdahalesi.
- playstation.com / sony alanlarından kalmış çerezler/oturumlar.
- Sistem saati senkron değil (NTP kapalı).
- Kurumsal/okul ağı kısıtları.

Hızlı çözüm listesi (sırayla deneyin):

- OAuth linkini Gizli/Incognito pencerede açın.
- Ad‑blocker/Privacy uzantılarını geçici kapatın (uBlock/AdGuard/Brave Shields).
- Oturum için 3. taraf çerez ve pop-up’a izin verin.
- Farklı tarayıcı deneyin (Chrome/Chromium ↔ Firefox).
- VPN/Proxy kapatın. DNS’i Otomatik/ISS yapın. Gerekirse Google DNS (8.8.8.8/8.8.4.4) veya Cloudflare (1.1.1.1) deneyin.
- Farklı ağda (telefon hotspot) deneyerek politika engeli olup olmadığına bakın.
- Saat senkronizasyonu:

  ```bash
  timedatectl
  sudo timedatectl set-ntp true
  ```

- Şu alanların çerezlerini temizleyin:
  - playstation.com
  - sonyentertainmentnetwork.com
- Önce normal giriş yapın:
  - `https://www.playstation.com` veya
  - `https://my.account.sony.com`
    Ardından aynı tarayıcıda OAuth linkini açın.

Alternatif yöntem:

- OAuth’u başka cihazda tamamlayıp son redirect URL’sini kopyalayın, Ubuntu terminalindeki script’e yapıştırın.

---

## 9) Chiaki‑NG Log ve Uyarılarını Yorumlama

Karşılaşabileceğiniz örnek loglar:

- “Simulate User Activity Error: org.freedesktop.DBus.Error.NotSupported … idle inhibition specification”

  - Zararsızdır. Masaüstü oturumunuz ilgili D‑Bus metodunu desteklemiyor. Uygulama çalışmaya devam eder.

- “Discovery failed to bind port … trying one higher” / “Discovery Response invalid”

  - Genellikle mDNS/UDP keşif tutarsızlığı veya portu kullanan başka süreçlerdir.
  - Çözümler:
    - Yerel makinede kısıtlayıcı firewall kuralları olmadığından emin olun.
    - Keşif dengesizse konsolu IP ile manuel ekleyin.
    - PC ve konsolun aynı subnet/VLAN’da olduğunu doğrulayın.

- “Remote disconnected … Server shutting down”
  - Yeniden bağlanmayı deneyin. Konsolun dinlenme moduna geçmediğinden emin olun.
  - Ağ yoğun ise geçici olarak bitrate/kaliteyi düşürün.
  - PS5 Dinlenme Modu ayarlarının ağ üzerinden uyanmayı ve bağlantıda kalmayı sağladığını doğrulayın.

---

## 10) İsteğe Bağlı: Orijinal Chiaki veya AppImage

- Orijinal Chiaki bakım modunda, Chiaki‑NG önerilir.
- AppImage tercih ederseniz:

  - Chiaki‑NG releases sayfasından indirin.
  - Çalıştırılabilir yapıp başlatın:

    ```bash
    chmod +x *.AppImage
    ./Chiaki-NG-*.AppImage
    ```

  - Bazı özellikler (ör. DualSense ses/haptik) için PipeWire gerekli olabilir.

---

## 11) Hızlı Kontrol Listesi

- [ ] Flatpak/Flathub kuruldu
- [ ] Chiaki‑NG kuruldu ve başlatıldı
- [ ] PSN Account ID script ile alındı
- [ ] PS5/PS4 “Cihazı Bağla” PIN alındı
- [ ] Chiaki‑NG’de Account ID + PIN ile eşleştirildi
- [ ] Yayın test edildi; bitrate/audio buffer ayarlandı
- [ ] Denetleyici bağlandı (USB/Bluetooth)

---

## Referans Komutlar

- Flatpak/Flathub kurulumu:

```bash
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

- Chiaki‑NG kur/çalıştır:

```bash
sudo flatpak install -y flathub io.github.streetpea.Chiaki4deck
flatpak run io.github.streetpea.Chiaki4deck
```

- PSN Account ID script:

```bash
sudo apt install -y python3 python3-pip python3-requests
curl -L -o psn-account-id.py "https://git.sr.ht/~thestr4ng3r/chiaki/blob/master/scripts/psn-account-id.py?raw=1"
python3 psn-account-id.py
```

---

## Son Notlar

- Account ID’nizi gizli tutun.
- En iyi performans için kablolu bağlantı ve düşük Wi‑Fi yoğunluğu tercih edin.
- Keşif sorunluysa her zaman konsolu manuel IP ile eklemeyi deneyin.

**Ref:** [Chiaki Anasayfa](https://git.sr.ht/~thestr4ng3r/chiaki)
