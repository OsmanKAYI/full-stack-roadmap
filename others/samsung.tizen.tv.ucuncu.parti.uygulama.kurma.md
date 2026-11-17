# Samsung Tizen TV'ye Üçüncü Parti Uygulama Kurma

Samsung Smart TV'ler Android değil **Tizen OS** çalıştırır. Android APK'ları kurulamaz; Tizen uygulamaları `.wgt` (web) veya `.tpk` (native) paketleriyle gelir. TV'ye uygulama kurmanın iki yolu vardır:

1. **Samsung Apps mağazası** — resmi yol; uygulamanın görünürlüğü mağaza bölgesine bağlıdır.
2. **Developer Mode ile sideload** — aynı ağdaki bir PC'den `.wgt`/`.tpk` gönderilir.

## 1. TV'de Developer Mode'u Açma

1. Ana ekranda **Apps** bölümünü açın.
2. Kumandadan `1 → 2 → 3 → 4 → 5` tuşlayın.
3. **Developer mode: On** yapın.
4. **Host PC IP** alanına kurulum yapacağınız bilgisayarın yerel IP'sini yazın.
5. TV'yi **tamamen yeniden başlatın** (güç tuşuna basılı tutup yeniden açılana kadar bekleyin veya fişini bir dakika çekin — bekleme modu yeterli değildir).

## 2. PC'ye Apps2Samsung Kurma

[Apps2Samsung](https://github.com/Apps2Samsung/Apps2Samsung), Tizen Studio olmadan sideload yapar: TV'yi bulur, imza sertifikası oluşturur ve paketi kurar.

```bash
# CLI'yi (Linux x64) son sürümden indirip açın
curl -sL -o a2s.tar.gz \
  "https://github.com/Apps2Samsung/Apps2Samsung/releases/latest/download/Apps2Samsung.Cli-v3.3.0-linux-x64.tar.gz"
tar xzf a2s.tar.gz
```

## 3. TV'yi Bulma ve Doğrulama

```bash
apps2samsung-cli scan            # ağdaki Samsung TV'leri bulur
apps2samsung-cli tv <TV_IP>      # Developer Mode + debug portunu doğrular
```

`tv <TV_IP>` çıktısı `ready` diyor ve Tizen sürümünü gösteriyorsa TV hazırdır.

## 4. Uygulama Kurma

```bash
apps2samsung-cli catalog                 # 130+ topluluk uygulamasını listeler (.wgt/.tpk)
apps2samsung-cli catalog iptv            # anahtar kelimeye göre filtreler
apps2samsung-cli install "APP NAME" --tv <TV_IP>   # katalogdan kurulum
apps2samsung-cli install ./app.wgt --tv <TV_IP>    # yerel paket kurulumu
apps2samsung-cli installed --tv <TV_IP>  # TV'deki uygulamaları listeler
apps2samsung-cli launch <appId> --tv <TV_IP>
apps2samsung-cli uninstall <appId> --tv <TV_IP>
```

- **Yalnızca ilk kurulumda**: İmza sertifikası için tarayıcıda bir kerelik Samsung hesabı girişi açılır. Sonraki kurulumlar aynı sertifikayı kullanır.
- `Certificate in signature is not valid yet` hatası → TV'nin saati yeni sertifikanın geçerlilik başlangıcından geridedir; birkaç dakika bekleyip kurulumu tekrarlayın.

## Faydalı Notlar

- İmza sertifikası yaklaşık **2 yıl** geçerlidir. Süresi dolunca kurulumu tekrarlayın (uygulama verileri korunur).
- Bazı uygulamalar (ör. **MPlayer / Smart IPTV**) **yalnızca mağazadan** kurulabilir — şifreli `.tmg` paketi olarak dağıtılırlar ve sideload edilemezler. Böyle bir uygulama kendi bölgenizin mağazasında yoksa ya Smart Hub bölgesini değiştirin ya da topluluk alternatifi kullanın.
- Ücretsiz sideload edilebilir IPTV oynatıcılar: **EN TV Player** (açık kaynak, ClearKey/PlayReady DRM desteği), **AquaPlay IPTV**, **APL TV**, **Chouette TV**.
- Faydalı katalog uygulamaları: Jellyfin istemcileri, TizenTube (reklamsız YouTube), Tailscale, App Manager launcher.

## Sorun Giderme

| Sorun                                                 | Çözüm                                                                                    |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `developer mode off`                                  | 1. adımı tekrarlayın; Host PC IP, PC'nin yerel IP'siyle aynı olmalı                      |
| `install service is not running`                      | TV tamamen yeniden başlatılmamış — Samsung logosu görünene kadar güç tuşuna basılı tutun |
| Debug portu kapalı                                    | PC ve TV aynı alt ağda olmalı; TV'nin `26101` portu erişilebilir olmalı                  |
| Eski modellerde uygulama yeniden başlatmada siliniyor | `Menu → Smart Hub → App Auto Update` ayarını kapatın                                     |
