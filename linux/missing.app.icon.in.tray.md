# Application Icons Missing in Ubuntu System Tray

If application icons (e.g., Ulauncher, Caffeine, Guake Terminal, and etc.) are not visible in the top-right system tray, it is often due to a disabled extension or a system change. Below are some common causes and solutions:

## 1. AppIndicator Extension Disabled

- Ubuntu uses the **AppIndicator** or **KStatusNotifierItem** extension to display application icons in the system tray. This extension might be disabled.
- **Solution**: Verify if the extension is enabled:

  1. Install **Gnome Tweaks** via Terminal:

     ```bash
     sudo apt install gnome-tweaks
     ```

  2. Open Gnome Tweaks and ensure the **AppIndicator** extension is active under the "Extensions" section.

## 2. Gnome-Shell Extension Issue

- Applications like Ulauncher and Caffeine rely on **Gnome Shell Extensions** to display their system tray icons. If Gnome has been updated, the extensions may have become incompatible.
- **Solution**: Reinstall and enable the necessary Gnome Shell extension:

  ```bash
  sudo apt install gnome-shell-extension-appindicator
  gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
  ```

**NOTE:** If the `gnome-extensions enable ...` command does not work for your system, you can press `ALT` + `F2` and type `r` to restart the Gnome Shell.
