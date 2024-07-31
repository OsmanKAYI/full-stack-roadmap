# Dual Boot Disk Permission Problem

- If you use dual boot computer with Windows and Linux, and you faced some problem in disk permissions on Ubuntu while trying to reach the disk's content of Windows (Can't Write, Read Only!!!), you should follow the steps below:

- Go to, `Control Panel` | `Hardware and Sound` | `Power Options` | `System Settings` | `Choose What the Power Button Do`.
- Then click on **Change settings that are currently unavailable**.
- Under the **Shut-down settings**, uncheck **Turn on fast start-up (recommended)** option.
  - Why we've done this is to prevent Windows to take control of the disk before Ubuntu while opening. Thanks to this, Ubuntu will get the control on disk and will not be facing any permission problem while writing.
