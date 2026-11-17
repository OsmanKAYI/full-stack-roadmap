# Installing Third-Party Apps on a Samsung Tizen TV

Samsung Smart TVs run **Tizen OS**, not Android. Android APKs cannot be installed; Tizen apps come as `.wgt` (web) or `.tpk` (native) packages. There are two ways to get an app onto the TV:

1. **Samsung Apps store** — the official path; availability depends on the store region.
2. **Developer Mode sideload** — push a `.wgt`/`.tpk` from a PC on the same network.

## 1. Enable Developer Mode on the TV

1. Open **Apps** on the home screen.
2. Press `1 → 2 → 3 → 4 → 5` on the remote.
3. Set **Developer mode: On**.
4. Enter **Host PC IP** = the LAN IP of the computer you will install from.
5. **Fully restart the TV** (hold the power button until it reboots, or unplug for a minute — standby is not enough).

## 2. Install Apps2Samsung on the PC

[Apps2Samsung](https://github.com/Apps2Samsung/Apps2Samsung) sideloads Tizen apps without Tizen Studio: it finds the TV, creates the signing certificate and installs the package.

```bash
# Download the CLI (Linux x64) from the latest release and unpack it
curl -sL -o a2s.tar.gz \
  "https://github.com/Apps2Samsung/Apps2Samsung/releases/latest/download/Apps2Samsung.Cli-v3.3.0-linux-x64.tar.gz"
tar xzf a2s.tar.gz
```

## 3. Find and Check the TV

```bash
apps2samsung-cli scan            # find Samsung TVs on the network
apps2samsung-cli tv <TV_IP>      # verify Developer Mode + debug port
```

The TV is ready when `tv <TV_IP>` reports `ready` and shows the Tizen version.

## 4. Install an App

```bash
apps2samsung-cli catalog                 # list 130+ community apps (.wgt/.tpk)
apps2samsung-cli catalog iptv            # filter by keyword
apps2samsung-cli install "APP NAME" --tv <TV_IP>   # install from catalog
apps2samsung-cli install ./app.wgt --tv <TV_IP>    # install a local package
apps2samsung-cli installed --tv <TV_IP>  # list apps on the TV
apps2samsung-cli launch <appId> --tv <TV_IP>
apps2samsung-cli uninstall <appId> --tv <TV_IP>
```

- **First install only**: a browser opens for a one-time Samsung account sign-in to create the signing certificate. Later installs reuse it.
- Error `Certificate in signature is not valid yet` → the TV clock is behind the freshly created certificate; wait a few minutes and run the install again.

## Useful Notes

- The signing certificate is valid for about **2 years**. When it expires, repeat the install (app data is kept).
- Some apps (e.g. **MPlayer / Smart IPTV**) are **store-only** — they ship as encrypted `.tmg` packages and cannot be sideloaded. If such an app is missing from your region's store, either change the Smart Hub region or use a community alternative.
- Free sideloadable IPTV players: **EN TV Player** (open source, DRM ClearKey/PlayReady support), **AquaPlay IPTV**, **APL TV**, **Chouette TV**.
- Useful catalog apps: Jellyfin clients, TizenTube (ad-free YouTube), Tailscale, App Manager launcher.

## Troubleshooting

| Problem                                   | Fix                                                                     |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| `developer mode off`                      | Re-do step 1; Host PC IP must match the PC's LAN IP                     |
| `install service is not running`          | TV was not fully restarted — hold power until the Samsung logo appears  |
| Debug port closed                         | PC and TV must be on the same subnet; TV port `26101` must be reachable |
| App disappears after reboot on old models | Disable `Menu → Smart Hub → App Auto Update`                            |
