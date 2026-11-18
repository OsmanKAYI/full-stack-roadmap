# Android Device Debugging Guide

End-to-end: connect a physical Android phone, install the app, inspect the WebView.

## 1. Enable Developer Options (on the phone)

Settings → About phone → tap **Build number** 7× → Developer options appear.

## 2. Connect ADB

### USB

1. Developer options → **USB debugging** → ON.
2. Plug the cable (data cable, not charge-only). Unplug/replug after enabling —
   the USB function set is negotiated at connect time.
3. Accept the **"Allow USB debugging / RSA fingerprint"** prompt on the phone.
4. Verify: `adb devices -l` → device listed with `device` state.
   If the phone shows in `lsusb` but not in `adb devices`, only MTP is active —
   USB debugging is off or vendor-blocked (see §4).

### Wireless (Android 11+)

1. Phone and PC on the **same LAN**. Developer options → **Wireless debugging** → ON.
2. Tap **"Pair device with pairing code"** → note `IP:PORT` + 6-digit code.
3. `adb pair IP:PORT CODE` → "Successfully paired".
4. `adb connect IP:PORT` — the connect port is **different** from the pairing
   port and **rotates** on toggle/reconnect. Find the current one with
   `adb mdns services` (look for `_adb-tls-connect._tcp`).
5. `connection refused` = not paired yet, or stale port → re-check `mdns services`.

## 3. Install the APK

```bash
adb install -r app-release.apk          # normal path
```

If `INSTALL_FAILED_USER_RESTRICTED` (MIUI without SIM/Mi account):

```bash
adb push app-release.apk /sdcard/Download/app-release.apk
adb shell 'am start -a android.intent.action.VIEW \
  -d "content://com.android.externalstorage.documents/document/primary%3ADownload%2Fapp-release.apk" \
  -t "application/vnd.android.package-archive"'
# then confirm "Install" on the phone screen
```

## 4. Vendor quirks (important)

- **OPPO / ColorOS**: USB debugging silently refuses to work without a **SIM
  card** (and on some versions a HeyTap/OPPO account). Toggle looks ON but no
  ADB interface appears on USB. Fix: insert a SIM, or use wireless debugging.
- **Xiaomi / MIUI**: `adb install` is blocked until **"Install via USB"**
  (and often "USB debugging — Security settings") is enabled; both toggles
  require a **SIM + Mi account**. No SIM → use the `adb push` + installer
  intent path above.
- Wireless-debugging ports are **ephemeral** — never hardcode them.

## 5. Inspect the app WebView (CDP)

Requires `WebView.setWebContentsDebuggingEnabled(true)` in `MainActivity`
(debug/dev builds only — strip or gate for store releases).

```bash
PKG=<your.app.package>
PID=$(adb shell pidof $PKG | tr -d '\r')
adb forward tcp:9222 localabstract:webview_devtools_remote_$PID
curl -s http://localhost:9222/json        # list debug targets, find the app page
```

Then drive the WebView with Playwright/CDP scripts (navigate routes, measure
DOM geometry, capture screenshots).

Useful extras:

```bash
adb exec-out screencap -p > shot.png      # instant screenshot
adb logcat | grep -E "chromium|CONSOLE"   # webview errors + JS console
adb shell monkey -p $PKG 1                # launch app
adb shell 'ls /sdcard/Download/'          # verify pushed/downloaded files
adb shell dumpsys package $PKG | grep lastUpdateTime  # confirm installed build
```

## 6. Quick troubleshooting

| Symptom                               | Fix                                                      |
| ------------------------------------- | -------------------------------------------------------- |
| `adb devices` empty, phone in `lsusb` | USB debugging off → enable + replug                      |
| Nothing in `lsusb`                    | Charge-only cable/port → swap cable                      |
| Wireless `connection refused`         | Not paired → `adb pair` with fresh code/port             |
| Port keeps changing                   | Normal — query `adb mdns services` each time             |
| `INSTALL_FAILED_USER_RESTRICTED`      | MIUI: enable "Install via USB" or use §3 push path       |
| CDP `json` endpoint empty             | App not running, or `setWebContentsDebuggingEnabled` off |
