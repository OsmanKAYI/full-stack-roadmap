# Samsung Tizen TV'de Kumanda Tuşlarını Yeniden Programlama (Vetro)

Samsung akıllı TV kumandasındaki uygulama tuşlarını (Netflix, Prime Video, www, …) yeniden programlama rehberi. 2021 Q60A (Tizen 6.0) üzerinde test edildi.

Samsung, kumandadaki uygulama tuşlarını firmware'de sabitler; resmi bir yeniden programlama yoktur. **Vetro**, TV'yi rootlayan ve `http://<TV_IP>:8099` adresinde yerel bir panel açan topluluk uygulamasıdır. **Remapper** ile herhangi bir fiziksel tuş; bir uygulama açma, tuş gönderme veya MQTT yayınlama işlemine bağlanabilir — işlem sonrası PC'nin açık kalması gerekmez.

## 1. Vetro Kurulumu

- `apps2samsung-cli install Vetro --tv <TV_IP>` ile kurun (**Partner** seviyesi imza ister — tarayıcıda Samsung hesabı girişi zorunludur).
- Vetro'yu TV'de bir kez açın, ardından **Developer Mode → Host PC IP = `127.0.0.1`** yapın ve TV'yi tamamen yeniden başlatın. Vetro açılışta kendini rootlar; panel `8099` portunda açılır.
- Bundan sonra Developer Mode üzerinden PC'den kurulum çalışmaz; kurulumlar Vetro üzerinden yapılır.

## 2. Fiziksel Tuş Kodunu Bulma

Panelde **Remapper → Start listening** basılan tuşu yakalar ve kodunu gösterir. Hiçbir şey yakalanmıyorsa:

- `Smart Control 2016` adında birden fazla cihaz olabilir. Kumandanın tuşlarını asıl üreten node uhid cihazı olmayabilir — Vetro agent'ının gerçekten hangi node'u tuttuğuna bakın:

```bash
pgrep -af SamsungTvRemoteInputAgent
ls -l /proc/<agent_pid>/fd | grep event
```

- Bu TV'ler 32-bit'tir: `input_event` **16 byte**'tır (24 değil). Tüm node'ları aynı anda dinlemek için:

```bash
for f in /dev/input/event*; do
  dd if=$f bs=16 count=40 > /tmp/ev_$(basename $f).bin 2>/dev/null &
done
# tuşa basın, sonra:
od -An -tx2 -w16 /tmp/ev_*.bin
# "0001 0096 0001 0000" kaydı = EV_KEY, kod 0x96 (150), değer 1
```

Bu kumandada gözlenen kodlar (modele/bölgeye göre değişebilir):

| Tuş         | Kod |
| ----------- | --- |
| www         | 150 |
| Prime Video | 221 |
| Netflix     | 226 |

## 3. Kural Oluşturma

Panel → Remapper → yakalanan kodu **open an app** aksiyonuna bağlayın; ya da API ile:

```bash
curl -X POST http://<TV_IP>:8099/remap -H 'Content-Type: application/json' -d '{
  "rules": [
    {"id":"physical_226","enabled":true,"trigger":{"type":"physical","value":"226"},
     "actions":[{"type":"launch","appId":"IPTVPlayer.IPTV"}]}
  ]}'
```

Ardından interception'ı açın: `POST /input` gövdesi `{"mode":"filter","device":"/dev/input/eventN"}` — 2. adımda bulunan gerçek node'u kullanın.

## 4. HDMI / Kaynak Değiştirme

Remapper aksiyonları uygulama açmaya yöneliktir; doğrudan "kaynak değiştir" aksiyonu yoktur. Çözüm: `tizen.tvwindow.setSource` ile `tv-hdmi-N` kaynağına geçip hemen çıkan minik bir `.wgt` yazıp tuşa bağlayın:

```javascript
tizen.tvwindow.setSource({ type: 'MAIN', id: 'tv-hdmi-3' });
tizen.app.getCurrentApplication().exit();
```

`config.xml` içinde `<tizen:profile name="tv-samsung"/>` olmalı (düz `tv` kurulumda hata verir), paket id'si en fazla 10 karakter olmalı ve `tvwindow` ayrıcalığı eklenmelidir.

## Bilinen Sorunlar

- **Artık input agent'ı**: Kalan bir `SamsungTvRemoteInputAgent` node'da `EVIOCGRAB` tutar (`/tmp/vetro-input.log` içinde `errno 16`) ve yeni filter istekleri _"input helper disconnected"_ hatası verir. Eski agent'ı öldürüp hemen filter modunu yeniden uygulayın.
- `/remap` ile kural kaydetmek input politikasını `off` yapabilir — sonrasında filter modunu tekrar açın.
- Sadece kızılötesi çalışan tuşlar veya ikinci bir kumanda, Bluetooth node'u yerine `wt61p807 rc device`'a düşebilir.
- Vetro paneli kimlik doğrulamasız HTTP'dir — yalnızca yerel ağda tutun. Firmware güncellemeleri root'u/Vetro'yu kaldırabilir.
