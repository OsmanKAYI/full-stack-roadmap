# Game Streaming on Ubuntu with Sunshine + Moonlight

A step‑by‑step guide to stream games/apps **from your Ubuntu PC to your iPhone** using **Sunshine** (host) and **Moonlight** (client). Includes installation, pairing, firewall ports, controllers, performance tuning, and notes on why the PS5 cannot be a Moonlight client.

---

## Sunshine vs Moonlight: Which One?

They are **not alternatives — they work together**:

| Software      | Role                                                 | Install on                  |
| ------------- | ---------------------------------------------------- | --------------------------- |
| **Sunshine**  | Host (server) — runs the game and encodes the stream | Your **Ubuntu PC**          |
| **Moonlight** | Client — receives and plays the stream               | Your **iPhone** (App Store) |

Sunshine is a self-hosted, open-source implementation of the NVIDIA GameStream protocol. Moonlight was originally built for NVIDIA GameStream, and Sunshine replaced NVIDIA's discontinued host — so Moonlight connects to Sunshine natively.

---

## Goals

- Install Sunshine on Ubuntu.
- Open required firewall ports.
- Install Moonlight on iPhone and pair via PIN.
- Add applications (Desktop, Steam, etc.) to Sunshine.
- Use a controller (DualSense/Xbox) over Bluetooth on iOS.
- Tune performance for LAN streaming.

---

## Prerequisites

- Ubuntu PC that will run the games (desktop session logged in).
- GPU with hardware encoding: NVIDIA (NVENC) or Intel/AMD (VAAPI).
- iPhone with the **Moonlight** app (free on the App Store).
- Both devices on the same local network.
- Recommended: wired Ethernet for the PC, 5 GHz Wi‑Fi for the iPhone.

---

## 1) Install Sunshine on Ubuntu

### Option A — .deb package (recommended)

Download and install the latest `.deb` directly (auto-detects your Ubuntu version via `lsb_release`):

```bash
sudo apt update
SUNSHINE_URL=$(curl -sL https://api.github.com/repos/LizardByte/Sunshine/releases/latest \
  | grep -oP '"browser_download_url": "\K[^"]+ubuntu'"$(lsb_release -rs)"'_amd64\.deb' \
  | head -1)
wget "$SUNSHINE_URL" -O sunshine_latest_amd64.deb
sudo apt install -y ./sunshine_latest_amd64.deb
```

> There's no fixed download link because the version number is embedded in the filename (`sunshine_2026.x-1+ubuntu24.04_amd64.deb`) — the command pulls the latest asset URL from the GitHub API. To install manually, check the [releases page](https://github.com/LizardByte/Sunshine/releases).

`apt` resolves dependencies automatically.

### Option B — Flatpak

```bash
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub dev.lizardbyte.app.Sunshine
```

> Note: The `.deb` version generally has fewer permission issues with input emulation (keyboard/mouse/gamepad) than the Flatpak sandboxed version.

---

## 2) Start Sunshine and Open the Web UI

Run Sunshine once, then enable it as a user service so it starts on login:

```bash
systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service
```

Open the admin web UI in a browser:

```text
https://localhost:47990
```

- The first visit shows a certificate warning — this is normal (self-signed cert). Proceed anyway.
- Create your admin username/password on first run.

> Input emulation note: Sunshine needs access to `uinput`. The `.deb` package installs the required udev rule; if gamepad/keyboard input doesn't work on the client, log out/in or reboot, and check that your user can access `/dev/uinput`.

---

## 3) Firewall Ports

If `ufw` is enabled, allow the GameStream ports:

```bash
sudo ufw allow 47984,47989,48010/tcp
sudo ufw allow 47998:48000,48002,48010/udp
sudo ufw reload
```

Also make sure `avahi-daemon` is running for automatic discovery (installed by default on Ubuntu Desktop):

```bash
systemctl status avahi-daemon
```

If auto-discovery fails, you can always add the PC manually by IP in Moonlight.

---

## 4) Install Moonlight on iPhone and Pair

1. Install **Moonlight** from the App Store (free, by Diego Waxemberg).
2. Make sure the iPhone is on the same network as the PC.
3. Open Moonlight — your PC should appear automatically. If not, tap **+** and enter the PC's IP address.
4. Tap the PC icon — Moonlight shows a **4-digit PIN**.
5. On the PC, open `https://localhost:47990` → **PIN** tab → enter the PIN.
6. After pairing, you'll see the application list (Desktop, Steam, etc.).

---

## 5) Add Applications in Sunshine

In the Sunshine web UI → **Applications** tab you can define what appears in Moonlight:

- **Desktop** — streams your whole desktop (enabled by default).
- **Steam** — launch Steam Big Picture directly.
- Custom commands — any app/script, e.g. Heroic, Lutris, RetroArch.

Useful settings per app:

- _Detached commands_ — run a script before/after the session (e.g., change resolution).
- _Elevated_ — run as administrator (rarely needed on Linux).

---

## 6) Controllers on iPhone

Moonlight for iOS supports Bluetooth controllers natively:

- **DualSense (PS5 controller)** — hold **PS + Create** buttons to pair, works on iOS 14.5+.
- **Xbox Wireless Controller** — also supported.
- MFi controllers and touch overlay work too.

The controller input is forwarded to Ubuntu and appears as a virtual gamepad.

---

## 7) Performance Tuning

- **Host:** Wired Ethernet strongly recommended; Wi‑Fi hosts add jitter.
- **Client:** Use 5 GHz (or Wi‑Fi 6) — 2.4 GHz is too congested for good latency.
- **Encoder:** Sunshine auto-selects hardware encoding (NVENC for NVIDIA, VAAPI for Intel/AMD). Check _Configuration → Audio/Video_ if software encoding is being used — it kills performance.
- **Session type:** **X11 is still more reliable** than Wayland for Sunshine on Ubuntu. If you see a black screen or capture failures on Wayland, log in with "Ubuntu on Xorg".
- **Resolution/FPS:** In Moonlight settings start with 1080p60; lower to 720p if the network stutters.
- **Bitrate:** Start ~20–30 Mbps on LAN; raise toward 50+ if you have headroom.
- **HEVC (H.265):** Enable in Moonlight for better quality at the same bitrate — supported on all modern iPhones.

---

## 8) What About the PS5?

- **PS5 cannot be a Moonlight client** — there is no Moonlight app for PlayStation, and no way to sideload one.
- Streaming **from** PS5 **to** other devices is a different problem — use Chiaki‑NG (see [PlayStation Remote Play on Ubuntu](./ps-remote-play-ubuntu-en.md)).
- If the real goal is "play PC games on the TV where the PS5 sits", put a Moonlight-capable device on that TV instead: Apple TV, Android TV box, Fire TV, or a Raspberry Pi all have Moonlight clients.

---

## 9) Troubleshooting

| Symptom                                              | Likely fix                                                                                                                                    |
| ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| PC not discovered in Moonlight                       | Check `avahi-daemon`, same subnet, or add manually by IP                                                                                      |
| Pairing PIN rejected                                 | Reopen `https://localhost:47990` → PIN tab; make sure Sunshine is running (`systemctl --user status app-dev.lizardbyte.app.Sunshine.service`) |
| Web UI won't open; log stops at "Detecting displays" | Hybrid NVIDIA (Optimus) laptop — NvFBC probe hangs. Add `capture = x11` to `~/.config/sunshine/sunshine.conf`, restart the service            |
| Black screen on stream                               | On Wayland → switch to an Xorg session; check GPU driver/encoder                                                                              |
| No keyboard/gamepad input                            | `uinput` permissions — relog/reboot after `.deb` install                                                                                      |
| Choppy video / stutter                               | Lower bitrate/resolution; wired host; enable HEVC                                                                                             |
| Steam doesn't launch                                 | Add it as a detached command, check `steam` is on PATH                                                                                        |

---

## Quick Checklist

- [ ] Sunshine installed on Ubuntu (`.deb`).
- [ ] `systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service` running.
- [ ] Web UI accessible at `https://localhost:47990`.
- [ ] Firewall ports opened (if ufw enabled).
- [ ] Moonlight installed on iPhone, paired with PIN.
- [ ] Tested Desktop stream; added Steam.
- [ ] DualSense paired to iPhone (optional).

---

## Reference Commands

```bash
# Install Sunshine (.deb)
sudo apt install -y ./sunshine_latest_amd64.deb

# Run at login
systemctl --user enable --now app-dev.lizardbyte.app.Sunshine.service
systemctl --user status app-dev.lizardbyte.app.Sunshine.service

# Firewall
sudo ufw allow 47984,47989,48010/tcp
sudo ufw allow 47998:48000,48002,48010/udp

# Logs
journalctl --user -u app-dev.lizardbyte.app.Sunshine.service -f
```

---

## Final Notes

- Sunshine streams the **host's session** — the PC's monitor will mirror what you see on the iPhone (it's remote desktop + gamepad, not a separate session).
- For streaming away from home, keep both ends on a good uplink or use a mesh VPN like Tailscale — do not expose Sunshine ports to the internet directly.
- Keep Sunshine updated; GameStream protocol and iOS change over time.

**Ref:** [Sunshine documentation](https://docs.lizardbyte.dev/projects/sunshine/latest/) · [Moonlight](https://moonlight-stream.org/) · [Sunshine GitHub](https://github.com/LizardByte/Sunshine)
