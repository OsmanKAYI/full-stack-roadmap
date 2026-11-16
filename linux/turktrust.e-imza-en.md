# TURKTRUST Qualified Electronic Signature (e-İmza)

Notes on using the TURKTRUST qualified electronic signature USB token: Palma software installation, PIN unblock/reset, and usage on Linux via WinBoat.

## Palma Installation (Smart Card Management Software)

Palma is the required smart card management software for TURKTRUST e-signature tokens. Download the version matching your system (check whether Windows is 32-bit or 64-bit via _Computer → Properties_):

- [Palma 64 Bit](https://dl.turktrust.com.tr/PALMA_2.9_64bit_Setup_A2.7_G10.8_b25071401.exe)
- [Palma 32 Bit](https://dl.turktrust.com.tr/PALMA_2.9_32bit_Setup_A2.7_G10.8_b25071401.exe)
- [Installation Video](https://dl.turktrust.com.tr/yardim/palma-kurulum3.mp4)
- Official guide: <https://www.turktrust.com.tr/kurulum-islemleri.html>

## PIN Unblock / Reset

The PIN gets blocked after 3 consecutive wrong entries. To unblock and set a new PIN:

1. **Call the call center:** `0850 222 444 6` (TURKTRUST).
2. **Get the unblock code:** Press `4` on the voice response system to have an _Unblock Code_ (Blokaj Kaldırma Kodu) sent to the mobile phone registered in the system.
3. **Open Palma:** Launch the Palma software (Smart Card Management Software) on the computer.
4. **Set a new PIN:** Click the **"Blokaj Kaldır"** button, enter the code received on the phone, and create the new PIN/password.

Reference: <https://www.turktrust.com.tr/sifre-islemleri.html>

> **Warning:** All password and unblock operations for the e-signature must be performed **only** through the Palma software; otherwise the e-signature may fall out of warranty coverage.

## Verify the Token Is Detected on Linux

Before troubleshooting WinBoat or Palma, confirm that Linux itself sees the USB token:

```bash
lsusb
```

Or compare before/after plugging the device in:

```bash
lsusb > /tmp/before.txt   # run before plugging the token in
lsusb > /tmp/after.txt    # run after plugging it in
diff /tmp/before.txt /tmp/after.txt
```

The token typically appears as a smart card reader from vendors such as **ACS**, **Gemalto/Thales**, **Identiv**, or **Aladdin/eToken**. If `lsusb` does not list the device, the problem is at the hardware/USB level — check the port, cable, or `dmesg` output before touching WinBoat settings.

## Using the Token on Linux with WinBoat

If Windows runs inside WinBoat on Linux, the USB token is not visible to Windows by default. To let Windows read the smart card:

- Enable **Smartcard Passthrough** in WinBoat settings.
- Enable **Experimental Features** in WinBoat settings.

After both are activated, the USB token can be passed through to the Windows environment, and Palma can detect the card.
