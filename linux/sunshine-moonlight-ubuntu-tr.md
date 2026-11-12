# Ubuntu'da Sunshine + Moonlight ile Oyun Yayını

Ubuntu PC'nizden **iPhone'unuza** oyun/uygulama yayını yapmak için **Sunshine** (host) ve **Moonlight** (istemci) kurulumunu adım adım anlatan not. Kurulum, PIN ile eşleştirme, güvenlik duvarı portları, denetleyici kullanımı, performans ayarları ve PS5'in neden Moonlight istemcisi olamayacağı dahildir.

---

## Sunshine mı Moonlight mı?

Bunlar **alternatif değil — birlikte çalışırlar**:

| Yazılım       | Rol                                               | Nereye kurulur         |
| ------------- | ------------------------------------------------- | ---------------------- |
| **Sunshine**  | Host (sunucu) — oyunu çalıştırır ve yayını kodlar | **Ubuntu PC**          |
| **Moonlight** | İstemci — yayını alır ve oynatır                  | **iPhone** (App Store) |

Sunshine, NVIDIA GameStream protokolünün açık kaynak, self-hosted implementasyonudur. Moonlight orijinal olarak NVIDIA GameStream için yazılmıştı; NVIDIA host'u kaldırınca yerini Sunshine aldı — yani Moonlight Sunshine'a doğal olarak bağlanır.

---

## Hedefler

- Ubuntu'ya Sunshine kurmak.
- Gerekli güvenlik duvarı portlarını açmak.
- iPhone'a Moonlight kurup PIN ile eşleştirmek.
- Sunshine'a uygulama eklemek (Masaüstü, Steam vb.).
- iOS'ta Bluetooth denetleyici (DualSense/Xbox) kullanmak.
- LAN yayını için performansı ayarlamak.

---

## Önkoşullar

- Oyunları çalıştıracak Ubuntu PC (oturum açık bir masaüstü).
- Donanımsal kodlama destekli GPU: NVIDIA (NVENC) veya Intel/AMD (VAAPI).
- App Store'dan **Moonlight** kurulu iPhone (ücretsiz).
- İki cihazın aynı yerel ağda olması.
- Öneri: PC için kablolu Ethernet, iPhone için 5 GHz Wi‑Fi.

---

## 1) Ubuntu'ya Sunshine kur

### Seçenek A — `.deb` paketi (önerilen)

En güncel `.deb`'i doğrudan indirip kur (Ubuntu sürümünü `lsb_release` ile otomatik algılar):

```bash
sudo apt update
SUNSHINE_URL=$(curl -sL https://api.github.com/repos/LizardByte/Sunshine/releases/latest \
  | grep -oP '"browser_download_url": "\K[^"]+ubuntu'"$(lsb_release -rs)"'_amd64\.deb' \
  | head -1)
wget "$SUNSHINE_URL" -O sunshine_latest_amd64.deb
sudo apt install -y ./sunshine_latest_amd64.deb
```

> Dosya adında sürüm numarası gömülü olduğu için (`sunshine_2026.x-1+ubuntu24.04_amd64.deb`) sabit bir indirme linki yok; GitHub API üzerinden en güncel asset'in URL'i çekiliyor. Elle kurmak istersen [releases sayfasına](https://github.com/LizardByte/Sunshine/releases) bakabilirsin.

Bağımlılıkları `apt` otomatik çözer.

### Seçenek B — Flatpak

```bash
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub dev.lizardbyte.app.Sunshine
```

> Not: `.deb` sürümü, girdi emülasyonu (klavye/fare/gamepad) konusunda sandbox'lı Flatpak sürümüne göre genelde daha az izin sorunu çıkarır.

---

## 2) Sunshine'ı başlat ve Web UI'ı aç

Sunshine'ı bir kez çalıştır, ardından oturum açıldığında başlaması için kullanıcı servisi olarak etkinleştir:

```bash
systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service
```

Tarayıcıda yönetim arayüzünü aç:

```text
https://localhost:47990
```

- İlk girişte sertifika uyarısı görürsün — normaldir (self-signed). Devam et.
- İlk açılışta admin kullanıcı adı/şifresi oluşturursun.

> Girdi emülasyonu notu: Sunshine'ın `uinput` erişimine ihtiyacı var. `.deb` paketi gerekli udev kuralını kurar; istemcide gamepad/klavye çalışmazsa oturumu kapatıp aç ya da yeniden başlat ve `/dev/uinput` erişimini kontrol et.

---

## 3) Güvenlik Duvarı Portları

`ufw` etkinse GameStream portlarını aç:

```bash
sudo ufw allow 47984,47989,48010/tcp
sudo ufw allow 47998:48000,48002,48010/udp
sudo ufw reload
```

Otomatik keşif için `avahi-daemon` çalışıyor olmalı (Ubuntu Desktop'ta varsayılan olarak kurulu):

```bash
systemctl status avahi-daemon
```

Otomatik keşif çalışmazsa Moonlight'ta PC'yi IP adresiyle elle ekleyebilirsin.

---

## 4) iPhone'a Moonlight kur ve eşleştir

1. App Store'dan **Moonlight**'ı kur (ücretsiz).
2. iPhone'un PC ile aynı ağda olduğundan emin ol.
3. Moonlight'ı aç — PC otomatik görünmeli. Görünmezse **+** ile PC'nin IP adresini gir.
4. PC simgesine dokun — Moonlight **4 haneli bir PIN** gösterir.
5. PC'de `https://localhost:47990` → **PIN** sekmesi → PIN'i gir.
6. Eşleştirme sonrası uygulama listesi görünür (Masaüstü, Steam vb.).

---

## 5) Sunshine'a Uygulama Ekleme

Sunshine web UI → **Applications** sekmesinde Moonlight'ta görünecekleri tanımlarsın:

- **Desktop** — tüm masaüstünü yayınlar (varsayılan olarak açık).
- **Steam** — Steam Big Picture'ı doğrudan başlatır.
- Özel komutlar — herhangi bir uygulama/script: Heroic, Lutris, RetroArch vb.

Uygulama başına yararlı ayarlar:

- _Detached commands_ — oturum öncesi/sonrası script çalıştır (ör. çözünürlük değiştir).
- _Elevated_ — yönetici olarak çalıştır (Linux'ta nadiren gerekir).

---

## 6) iPhone'da Denetleyici

iOS için Moonlight, Bluetooth denetleyicileri doğal destekler:

- **DualSense (PS5 kolu)** — eşleştirme için **PS + Create** tuşlarına basılı tut, iOS 14.5+ ile çalışır.
- **Xbox Wireless Controller** — desteklenir.
- MFi denetleyiciler ve dokunmatik overlay de kullanılabilir.

Denetleyici girdisi Ubuntu'ya sanal gamepad olarak iletilir.

---

## 7) Performans Ayarları

- **Host:** Kablolu Ethernet kesinlikle önerilir; Wi‑Fi host jitter ekler.
- **İstemci:** 5 GHz (veya Wi‑Fi 6) kullan — 2.4 GHz gecikme için yetersizdir.
- **Encoder:** Sunshine donanımsal kodlamayı otomatik seçer (NVIDIA için NVENC, Intel/AMD için VAAPI). Yazılımsal kodlama kullanılıyorsa _Configuration → Audio/Video_ ayarını kontrol et — performansı öldürür.
- **Oturum tipi:** Ubuntu'da Sunshine için **X11 hâlâ Wayland'den daha güvenilir**. Wayland'de siyah ekran ya da yakalama hatası görürsen "Ubuntu on Xorg" ile giriş yap.
- **Çözünürlük/FPS:** Moonlight ayarlarında 1080p60 ile başla; ağ takılırsa 720p'ye düş.
- **Bitrate:** LAN'da ~20–30 Mbps ile başla; payın varsa 50+'ye çıkar.
- **HEVC (H.265):** Aynı bitrate'te daha iyi kalite için Moonlight'ta aç — tüm modern iPhone'larda destekli.

---

## 8) Peki PS5?

- **PS5, Moonlight istemcisi olamaz** — PlayStation için Moonlight uygulaması yok, sideload imkânı da yok.
- PS5'ten **diğer cihazlara** yayın ayrı bir konu — Chiaki‑NG kullanılır (bkz. [Ubuntu'da PlayStation Remote Play](./ps-remote-play-ubuntu-tr.md)).
- Asıl amaç "PC oyunlarını PS5'in bağlı olduğu TV'de oynamak" ise o TV'ye Moonlight çalıştıran bir cihaz bağla: Apple TV, Android TV box, Fire TV ya da Raspberry Pi.

---

## 9) Sorun Giderme

| Belirti                                             | Olası çözüm                                                                                                                                        |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Moonlight'ta PC görünmüyor                          | `avahi-daemon` kontrol et, aynı subnet'te ol, ya da IP ile elle ekle                                                                               |
| Eşleştirme PIN'i reddediliyor                       | `https://localhost:47990` → PIN sekmesini tekrar aç; Sunshine çalışıyor mu bak (`systemctl --user status app-dev.lizardbyte.app.Sunshine.service`) |
| Web UI açılmıyor; log "Detecting displays"te takılı | Hibrit NVIDIA (Optimus) laptop — NvFBC probing takılıyor. `~/.config/sunshine/sunshine.conf` içine `capture = x11` ekle, servisi yeniden başlat    |
| Yayında siyah ekran                                 | Wayland'deysen Xorg oturumuna geç; GPU sürücüsü/encoder kontrol et                                                                                 |
| Klavye/gamepad girdisi yok                          | `uinput` izinleri — `.deb` kurulumu sonrası relog/reboot                                                                                           |
| Görüntü takılıyor                                   | Bitrate/çözünürlüğü düşür; host'u kabloya al; HEVC aç                                                                                              |
| Steam açılmıyor                                     | Detached command olarak ekle, `steam`'in PATH'te olduğunu doğrula                                                                                  |

---

## Hızlı Kontrol Listesi

- [ ] Ubuntu'ya Sunshine kuruldu (`.deb`).
- [ ] `systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service` çalışıyor.
- [ ] `https://localhost:47990` web UI erişilebilir.
- [ ] Güvenlik duvarı portları açıldı (ufw etkinse).
- [ ] iPhone'a Moonlight kuruldu, PIN ile eşleştirildi.
- [ ] Desktop yayını test edildi; Steam eklendi.
- [ ] DualSense iPhone'a eşleştirildi (opsiyonel).

---

## Referans Komutlar

```bash
# Sunshine kur (.deb)
sudo apt install -y ./sunshine_latest_amd64.deb

# Oturum açılışında çalıştır
systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service
systemctl --user status app-dev.lizardbyte.app.Sunshine.service

# Güvenlik duvarı
sudo ufw allow 47984,47989,48010/tcp
sudo ufw allow 47998:48000,48002,48010/udp

# Loglar
journalctl --user -u app-dev.lizardbyte.app.Sunshine.service -f
```

---

## Son Notlar

- Sunshine, **host'un oturumunu** yayınlar — PC'nin monitörü iPhone'da gördüklerini yansıtır (ayrı bir oturum değil, uzak masaüstü + gamepad).
- Ev dışından yayın için iki tarafın da upload'u iyi olmalı; Tailscale gibi mesh VPN kullan — Sunshine portlarını doğrudan internete açma.
- Sunshine'ı güncel tut; GameStream protokolü ve iOS zamanla değişir.

**Ref:** [Sunshine dokümantasyonu](https://docs.lizardbyte.dev/projects/sunshine/latest/) · [Moonlight](https://moonlight-stream.org/) · [Sunshine GitHub](https://github.com/LizardByte/Sunshine)
