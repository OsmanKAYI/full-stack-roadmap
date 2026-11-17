# Remapping Remote Buttons on a Samsung Tizen TV (Vetro)

Guide for remapping the dedicated app buttons (Netflix, Prime Video, www, …) on a Samsung Smart TV remote. Tested on a 2021 Q60A (Tizen 6.0).

Samsung hardcodes the app buttons on the remote; there is no official way to remap them. **Vetro** is a community app that roots the TV and provides a local web dashboard (`http://<TV_IP>:8099`) with a **Remapper**: any physical key can launch any installed app, send a key, or publish MQTT — no PC needs to stay on afterwards.

## 1. Install Vetro

- Install `Vetro` via `apps2samsung-cli install Vetro --tv <TV_IP>` (requires **Partner** level signing — Samsung account sign-in in the browser is mandatory).
- Open Vetro once on the TV, then set **Developer Mode → Host PC IP = `127.0.0.1`** and fully restart the TV. Vetro roots itself on boot; the dashboard appears on port `8099`.
- After this, PC-side sideloading via Developer Mode no longer works; installs go through Vetro instead.

## 2. Find the Physical Key Code

The dashboard's **Remapper → Start listening** captures a pressed button and shows its code. If listening catches nothing:

- There can be several devices named `Smart Control 2016`. The one that actually emits remote keys may not be the uhid device — check which node the Vetro agent really holds:

```bash
pgrep -af SamsungTvRemoteInputAgent
ls -l /proc/<agent_pid>/fd | grep event
```

- These TVs are 32-bit: `struct input_event` is **16 bytes**, not 24. To sniff every node at once:

```bash
for f in /dev/input/event*; do
  dd if=$f bs=16 count=40 > /tmp/ev_$(basename $f).bin 2>/dev/null &
done
# press the remote button, then:
od -An -tx2 -w16 /tmp/ev_*.bin
# a record like "0001 0096 0001 0000" = EV_KEY, code 0x96 (150), value 1
```

Observed codes on this remote (may differ by model/region):

| Button      | Code |
| ----------- | ---- |
| www         | 150  |
| Prime Video | 221  |
| Netflix     | 226  |

## 3. Create Rules

Dashboard → Remapper → assign the captured code to **open an app**, or via API:

```bash
curl -X POST http://<TV_IP>:8099/remap -H 'Content-Type: application/json' -d '{
  "rules": [
    {"id":"physical_226","enabled":true,"trigger":{"type":"physical","value":"226"},
     "actions":[{"type":"launch","appId":"IPTVPlayer.IPTV"}]}
  ]}'
```

Then enable interception: `POST /input` with `{"mode":"filter","device":"/dev/input/eventN"}` using the node the remote actually feeds (found in step 2).

## 4. HDMI / Source Switching

Remapper actions are app-launch oriented; there is no direct "switch source" action. Workaround: build a tiny `.wgt` that calls `tizen.tvwindow.setSource` on `tv-hdmi-N` and immediately exits, then bind a key to it:

```javascript
tizen.tvwindow.setSource({ type: 'MAIN', id: 'tv-hdmi-3' });
tizen.app.getCurrentApplication().exit();
```

Required in `config.xml`: `<tizen:profile name="tv-samsung"/>` (plain `tv` fails to install), a package id of at most 10 chars, and the `tvwindow` privilege.

## Pitfalls

- **Stale input agent**: a leftover `SamsungTvRemoteInputAgent` holds `EVIOCGRAB` on the node (`errno 16` in `/tmp/vetro-input.log`) and new filter requests fail with _"input helper disconnected"_. Kill the stale agent, then immediately re-apply filter mode.
- Saving rules via `/remap` can drop the input policy to `off` — re-enable filter mode afterwards.
- IR-only buttons or a second remote may arrive on `wt61p807 rc device`, not the Bluetooth node.
- Vetro's dashboard is unauthenticated HTTP — keep it on the LAN only. Firmware updates can remove root/Vetro.
