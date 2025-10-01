# PlayStation Remote Play on Ubuntu (Chiaki‑NG)

A comprehensive, step‑by‑step guide to set up PS Remote Play on Ubuntu using Chiaki‑NG, including obtaining your PSN Account ID, pairing to PS5/PS4, performance tuning, controllers, and troubleshooting Sony login errors (e.g., “Can’t connect to the server. 0.1c…”) and common runtime warnings.

---

## Goals

- Install Chiaki‑NG on Ubuntu (using Flatpak/Flathub).
- Retrieve your PSN Account ID safely.
- Pair your console (PS5/PS4) with a PIN.
- Optimize stream quality (bitrate, audio buffer).
- Use DualShock 4/DualSense (USB/Bluetooth).
- Troubleshoot Sony OAuth login errors and common runtime logs.

---

## Prerequisites

- Ubuntu with internet access.
- PS5 or PS4 on the same local network.
- Your PSN credentials.
- Optional but recommended: Wired Ethernet for both console and PC.

---

## 1) Install Flatpak and Enable Flathub

Run these once (if not already done):

```bash
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

---

## 2) Install Chiaki‑NG

Chiaki‑NG is the actively maintained fork of Chiaki, recommended for PS5/PS4.

```bash
sudo flatpak install -y flathub io.github.streetpea.Chiaki4deck
```

Launch:

```bash
flatpak run io.github.streetpea.Chiaki4deck
```

Tip: You can create a desktop launcher via your app menu after first run.

---

## 3) Get Your PSN Account ID

Chiaki/Chiaki‑NG requires your PSN Account ID (not your online ID/username).

1. Ensure Python and pip are available (most Ubuntu systems already have them):

   ```bash
   sudo apt install -y python3 python3-pip
   ```

2. Prefer distro package for requests (avoids PEP 668 issues):

   ```bash
   sudo apt install -y python3-requests
   ```

3. Download the official script and run it:

   ```bash
   curl -L -o psn-account-id.py "https://git.sr.ht/~thestr4ng3r/chiaki/blob/master/scripts/psn-account-id.py?raw=1"
   python3 psn-account-id.py
   ```

4. Follow the script’s instructions:

- It prints a Sony OAuth URL. Open it in your browser and login.
- When the page displays a “redirect” page, copy the full URL from the address bar and paste it back into the script.
- The script will output a JSON blob. The “AccountID” it prints is the value you will use in Chiaki‑NG.

Security note:

- The redirect URL contains a temporary authorization code. Use it only for this script. Do not share publicly.

Alternative (if the PC browser gives errors):

- Open the OAuth link on another device (e.g., your phone), log in, copy the final redirect URL, and paste it in your PC terminal.

---

## 4) Prepare Your PS5/PS4 for Pairing

- PS5: Settings → Network → View Connection Status → IP Address, to be used in Chiaki‑NG.
- PS5: Settings → System → Remote Play → Turn on “Enable Remote Play”.
- Optional but recommended (for wake over LAN):
  - Settings → System → Power Saving → Features Available in Rest Mode:
    - Enable “Stay Connected to the Internet”
    - Enable “Enable Turning On PS5 from Network”
- Get the pairing PIN:
  - PS5: Settings → System → Remote Play → Link Device → it shows a PIN.
  - PS4: Settings → Remote Play → Add Device.

---

## 5) Pair in Chiaki‑NG

- Start Chiaki‑NG. It may discover your console automatically.
- If not, add it manually with the console’s IP:
  - PS5: Settings → Network → View Connection Status → IP Address, obtained in step 4.
- Click “Pair” for that console entry and enter:
  - Account ID: the value retrieved by the script.
  - PIN: the code shown on your PS5/PS4 “Link Device” screen.
- Save, then double‑click the console entry to connect.

---

## 6) Optimize Streaming Quality

Open Chiaki‑NG’s session/profile settings and tune:

- Bitrate: Start at 20000–30000 kbps. Many networks handle 30000 well on LAN.
- Audio Buffer: 19200 often helps avoid audio crackles/dropouts.
- Resolution/FPS: If your network struggles, lower resolution or fps.

Network tips:

- Prefer wired Ethernet on both PC and console.
- Ensure your firewall allows local network traffic for Chiaki‑NG.
- If auto‑discovery is unstable, use manual IP.

---

## 7) Controllers (DualShock 4 / DualSense)

- USB: Plug and play.
- Bluetooth (optional):

```bash
sudo apt install -y bluez blueman
```

- DualSense haptics/audio may work best on PipeWire. Ubuntu 22.10+ typically uses PipeWire by default.

---

## 8) Troubleshooting Sony Login Error

Error example:

- “Can’t connect to the server. (0.1c…be49b222)”

Common causes:

- Browser extensions blocking components (ad blockers, privacy blockers).
- Third‑party cookies and popups blocked.
- VPN/Proxy/strict DNS (DoH/DoT) interfering.
- Stale cookies/sessions from playstation.com/sony domains.
- System clock out of sync (NTP disabled).
- Corporate/school networks with restrictive policies.

Fix checklist (try in this order):

- Use a Private/Incognito window for the OAuth link.
- Temporarily disable ad‑blockers/privacy extensions (uBlock/AdGuard/Brave Shields).
- Allow third‑party cookies and popups for the session.
- Try another browser (Chrome/Chromium ↔ Firefox).
- Disable VPN/Proxy. Set DNS to Automatic/ISP. If needed, try Google DNS (8.8.8.8/8.8.4.4) or Cloudflare (1.1.1.1).
- Test from a different network (phone hotspot) to isolate network policy issues.
- Sync system time:

  ```bash
  timedatectl
  sudo timedatectl set-ntp true
  ```

- Clear cookies specifically for:
  - playstation.com
  - sonyentertainmentnetwork.com
- First log in directly at:
  - `https://www.playstation.com` or
  - `https://my.account.sony.com`
    Then open the OAuth link again in the same browser.

Alternative workaround:

- Use another device (phone/another PC) to complete the OAuth login and copy the final redirect URL, then paste into the script on your Ubuntu machine.

---

## 9) Troubleshooting Chiaki‑NG Logs and Warnings

You may see log messages like:

- “Simulate User Activity Error: org.freedesktop.DBus.Error.NotSupported … idle inhibition specification”

  - Harmless. It means your desktop environment/session doesn’t support the specific “simulate user activity” D‑Bus method. Chiaki‑NG will still run.

- “Discovery failed to bind port … trying one higher” / “Discovery Response invalid”

  - Usually related to mDNS/UDP discovery quirks, or something already using the port.
  - Workarounds:
    - Ensure no restrictive firewall rules on the local machine.
    - If discovery is inconsistent, add the console manually by IP.
    - Verify console and PC are in the same subnet/VLAN.

- “Remote disconnected … Server shutting down”
  - Try reconnecting. Confirm the console isn’t entering rest state unexpectedly.
  - Temporarily reduce bitrate/quality if the network is congested.
  - Ensure PS5 Rest Mode settings allow network wake and keep connection.

---

## 10) Optional: Original Chiaki or AppImage

- Original Chiaki is in maintenance mode. Chiaki‑NG is recommended.
- If you prefer AppImage:

  - Download from the Chiaki‑NG releases page.
  - Make executable and run:

    ```bash
    chmod +x *.AppImage
    ./Chiaki-NG-*.AppImage
    ```

  - Some features (e.g., DualSense audio/haptics) may require PipeWire.

---

## 11) Quick Checklist

- [ ] Flatpak/Flathub installed.
- [ ] Chiaki‑NG installed and launched.
- [ ] PSN Account ID retrieved via script.
- [ ] PS5/PS4 “Link Device” PIN obtained.
- [ ] Paired in Chiaki‑NG with Account ID + PIN.
- [ ] Stream tested; bitrate/audio buffer tuned.
- [ ] Controller connected (USB/Bluetooth).

---

## Reference Commands

- Install Flatpak/Flathub:

```bash
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

- Install and run Chiaki‑NG:

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

## Final Notes

- Keep your Account ID private.
- For best performance, use wired Ethernet and avoid Wi‑Fi congestion.
- If discovery is flaky, always try “Manual Add” with the console’s IP.

**Ref:** [Chiaki Hoemepag](https://git.sr.ht/~thestr4ng3r/chiaki)
