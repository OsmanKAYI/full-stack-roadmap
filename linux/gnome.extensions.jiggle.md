# GNOME Shell Jiggle Extension

[Jiggle](https://github.com/jeffchannell/jiggle) is a Gnome Shell extension that highlights the cursor position when the mouse is moved rapidly.

- Download [Jiggle Extension](https://extensions.gnome.org/extension/3438/jiggle/)

- If you have any problem to istall this extension to your system. You can follow the steps below to disable version control for GNOME extensions in Ubuntu and make the jiggle extension compatible with your version:

## Disabling Version Control for GNOME Extensions

Run the following command to disable the version control:

```bash
gsettings set org.gnome.shell disable-extension-version-validation true
```

## Installing the Jiggle Extension

Go to the GNOME extensions website and install the [Jiggle Extension](https://extensions.gnome.org/extension/3438/jiggle/).

## Editing the metadata.json File

Run the following command to edit the metadata.json file:

```bash
vi ~/.local/share/gnome-shell/extensions/jiggle@jeffchannell.com/metadata.json
```

In the metadata.json file, find the `shell-version` section and update it as follows:

```json
"shell-version": ["42.0", "42.1", "42.2", "42.3", "42.4", "42.5", "42.6", "42.7", "42.8", "42.9", "43.0", "43.1"]
```

**NOTE:** If your version is not listed, add it to the list.

## Re-enabling Version Control for GNOME Extensions

Run the following command to enable the version control:

```bash
gsettings set org.gnome.shell disable-extension-version-validation false
```
