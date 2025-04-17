# Create Constant IPv4 Adress

IPv4 is an Internet Protocol used to identify devices on a network. It uses a 32-bit address scheme and is the most commonly used protocol for networking. However, it is limited and will be replaced by IPv6.

## Wired Connection

- Go to `Settings`.
- Click on `Network`.
- Click on the `gear` icon under the `Wired` tab.
- Go to the `IPv4` tab.
- Set the `IPv4 Method` to `Manual`.
- Under the `Addresses` section, set the
  - `Address` to `192.168.0.98`.
  - `Netmask` to `255.255.255.0`.
  - `Gateway` to `192.168.0.1`.
- Click on `Apply`.

## WiFi Connection

- Go to `Settings`.
- Click on `Wi-Fi`.
- Click on the `gear` icon next to your `Selected Wi-Fi Name` under the `Visible Networks` tab.
- Go to the `IPv4` tab.
- Set the `IPv4 Method` to `Manual`.
- Under the `Addresses` section, set the
  - `Address` to `192.168.0.98`.
  - `Netmask` to `255.255.255.0`.
  - `Gateway` to `192.168.0.1`.
- Click on `Apply`.

**NOTE:** For Wi-fi connections, each connection should be configured separately.

**Extra:** To configure, secure internet connections, you can use `DNS` to `1.1.1.3, 1.0.0.3`.
