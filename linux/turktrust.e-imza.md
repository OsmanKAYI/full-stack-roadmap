# TÜRKTRUST e-İmza

TÜRKTRUST nitelikli elektronik imza USB token'ı ile ilgili notlar: Palma yazılımı kurulumu, PIN blokaj kaldırma/sıfırlama ve Linux üzerinde WinBoat ile kullanım.

## Palma Kurulumu (Akıllı Kart Yönetim Yazılımı)

Palma, TÜRKTRUST e-imza token'ları için gerekli akıllı kart yönetim yazılımıdır. Sisteminize uygun sürümü indirin (Windows'un 32-bit mi 64-bit mi olduğunu _Bilgisayarım → Özellikler_ bölümünden kontrol edebilirsiniz):

- [Palma 64 Bit](https://dl.turktrust.com.tr/PALMA_2.9_64bit_Setup_A2.7_G10.8_b25071401.exe)
- [Palma 32 Bit](https://dl.turktrust.com.tr/PALMA_2.9_32bit_Setup_A2.7_G10.8_b25071401.exe)
- [Kurulum Videosu](https://dl.turktrust.com.tr/yardim/palma-kurulum3.mp4)
- Resmi rehber: <https://www.turktrust.com.tr/kurulum-islemleri.html>

## PIN Blokaj Kaldırma / Sıfırlama

PIN kodu arka arkaya 3 kez hatalı girildiğinde bloke olur. Blokajı kaldırıp yeni PIN belirlemek için:

1. **Çağrı merkezini arayın:** `0850 222 444 6` (TÜRKTRUST).
2. **Blokaj kaldırma kodu alın:** Sesli yanıt sisteminde `4` tuşuna basarak, sistemde kayıtlı cep telefonunuza _Blokaj Kaldırma Kodu_ gönderilmesini sağlayın.
3. **Palma'yı açın:** Bilgisayarınızdaki Palma yazılımını (Akıllı Kart Yönetim Yazılımı) çalıştırın.
4. **Yeni PIN belirleyin:** **"Blokaj Kaldır"** butonuna tıklayıp, telefonunuza gelen kodu girerek yeni PIN/şifrenizi oluşturun.

Referans: <https://www.turktrust.com.tr/sifre-islemleri.html>

> **Uyarı:** Elektronik imza ile ilgili tüm şifre ve blokaj kaldırma işlemleri **yalnızca** Palma yazılımı üzerinden yapılmalıdır; aksi takdirde e-imzanız garanti kapsamı dışında kalabilir.

## Linux'ta Token'ın Algılandığını Doğrulama

WinBoat veya Palma ile uğraşmadan önce, Linux'un USB token'ı gördüğünden emin olun:

```bash
lsusb
```

Ya da cihazı takmadan önce/sonra çıktıyı karşılaştırın:

```bash
lsusb > /tmp/before.txt   # token'ı takmadan önce çalıştırın
lsusb > /tmp/after.txt    # taktıktan sonra çalıştırın
diff /tmp/before.txt /tmp/after.txt
```

Token genellikle **ACS**, **Gemalto/Thales**, **Identiv** veya **Aladdin/eToken** gibi üreticilerin akıllı kart okuyucusu olarak listelenir. `lsusb` cihazı listelemiyorsa sorun donanım/USB seviyesindedir — WinBoat ayarlarına dokunmadan önce portu, kabloyu veya `dmesg` çıktısını kontrol edin.

## WinBoat ile Linux'ta Token Kullanımı

Windows, Linux üzerinde WinBoat içinde çalışıyorsa USB token varsayılan olarak Windows'a görünmez. Windows'un akıllı kartı okuyabilmesi için:

- WinBoat ayarlarında **Smartcard Passthrough**'u aktifleştirin.
- WinBoat ayarlarında **Experimental Features**'ı aktifleştirin.

İkisi de aktif edildikten sonra USB token Windows ortamına geçirilir ve Palma kartı algılayabilir.
