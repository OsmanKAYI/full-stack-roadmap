# GNOME Shell X11Gestures Extension

Enable GNOME Shell multi-touch gestures on X11 with this extension.

## 1) Install Touchégg

[Touchégg](https://github.com/JoseExposito/touchegg) must be installed separately.

```bash
sudo add-apt-repository ppa:touchegg/stable
sudo apt update
sudo apt install touchegg
```

### Configuration

After installing Touchégg you'll notice that you can start using multi-touch gestures. However, you are not forced to use the gestures and actions that come out of the box, you can configure the gestures you'd like to use and the actions they'll trigger.

#### A) Configure with Touché

[Touché](https://github.com/JoseExposito/touche) is a desktop application to easily configure your touchpad and touchscreen multi-touch gestures.

##### Install Flatpak

```bash
# to install flatpak
sudo apt install flatpak
# install the software flatpak plugin
sudo apt install gnome-software-plugin-flatpak
# add the flathub repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

- Restart the terminal with `CTRL` + `D`

##### Download Touché

```bash
flatpak install flathub com.github.joseexposito.touche
```

##### Run Touché

```bash
flatpak run com.github.joseexposito.touche
```

#### B) Configure Manually

Start by copying the default configuration from `/usr/share/touchegg/touchegg.conf` to `~/.config/touchegg/touchegg.conf`. You can do it using your file manager or by running this command in your terminal:

```bash
mkdir -p ~/.config/touchegg && cp -n /usr/share/touchegg/touchegg.conf ~/.config/touchegg/touchegg.conf
```

Now open `~/.config/touchegg/touchegg.conf` with your favorite text editor.
It is a XML document with 3 main sections:

- [Global settings](#global-settings)
- Global gestures: `<application name="All">...</application>`
- Application specific gestures: `<application name="Google-chrome,Firefox"></application>`
  - The application name can be obtained by running this command and clicking on the target application window:

    ```bash
    xprop | grep WM_CLASS
    ```

<details>
  <summary>Example Settings</summary>

  ```xml
    <touchégg>
      <settings>
        <property name="animation_delay">150</property>
        <property name="action_execute_threshold">20</property>
        <property name="color">auto</property>
        <property name="borderColor">auto</property>
      </settings>
      <application name="All">
        <!-- Three-finger swipe up to show overview -->
        <gesture type="SWIPE" fingers="3" direction="UP">
          <action type="SHOW_OVERVIEW"></action>
        </gesture>
        <!-- Three-finger swipe down to show desktop -->
        <gesture type="SWIPE" fingers="3" direction="DOWN">
          <action type="SHOW_DESKTOP"></action>
        </gesture>
        <!-- Three-finger swipe left to switch to the next workspace -->
        <gesture type="SWIPE" fingers="3" direction="LEFT">
          <action type="CHANGE_WORKSPACE">
            <direction>LEFT</direction>
          </action>
        </gesture>
        <!-- Three-finger swipe right to switch to the previous workspace -->
        <gesture type="SWIPE" fingers="3" direction="RIGHT">
          <action type="CHANGE_WORKSPACE">
            <direction>RIGHT</direction>
          </action>
        </gesture>
        <!-- Pinch with four fingers to open the application launcher -->
        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="LAUNCH_APP">
            <command>rofi -show drun</command>
          </action>
        </gesture>
        <!-- Pinch with three fingers to zoom out -->
        <gesture type="PINCH" fingers="3" direction="OUT">
          <action type="ZOOM_OUT"></action>
        </gesture>
        <!-- Pinch with three fingers to zoom in -->
        <gesture type="PINCH" fingers="3" direction="IN">
          <action type="ZOOM_IN"></action>
        </gesture>
        <!-- Tap with two fingers for right-click -->
        <gesture type="TAP" fingers="2" direction="UNKNOWN">
          <action type="MOUSE_CLICK">
            <button>3</button>
            <on>begin</on>
          </action>
        </gesture>
        <!-- Tap with three fingers for middle-click -->
        <gesture type="TAP" fingers="3" direction="UNKNOWN">
          <action type="MOUSE_CLICK">
            <button>2</button>
            <on>begin</on>
          </action>
        </gesture>
      </application>
    </touchégg>
  ```
</details>

##### Global Settings

| Option                   | Value     | Default | Description                                                                                                | Example                                                                                                                                                                                                                                                                     |
| ------------------------ | --------- | ------- | ---------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| animation_delay          | Number    | 150     | Delay, in milliseconds, since the gesture starts before the animation is displayed                         | Use the MAXIMIZE_RESTORE_WINDOW action. You will notice that no animation is displayed if you complete the action quick enough. This property configures that time                                                                                                          |
| action_execute_threshold | Number    | 20      | Percentage of the gesture to be completed to apply the action. Set to 0 to execute actions unconditionally | Use the MAXIMIZE_RESTORE_WINDOW action. You will notice that, even if the animation is displayed, the action is not executed if you did not move your fingers far enough. This property configures the percentage of the gesture that must be reached to execute the action |
| color                    | Hex color | 3E9FED  | Color of the animation                                                                                     | `#909090`                                                                                                                                                                                                                                                                   |
| borderColor              | Hex color | 3E9FED  | Color of the animation                                                                                     | `FFFFFF`                                                                                                                                                                                                                                                                    |

- For more information and configurations, visit [Touchégg - GitHub](https://github.com/JoseExposito/touchegg).

## 2) x11 Gestures

- Install [x11 Gestures](https://extensions.gnome.org/extension/4033/x11-gestures/).
- [Set up Multi-Touch Gestures for Touchscreens in Linux](https://www.gechic.com/en/settings-of-multi-touchscreen-gestures-on-linux/)
