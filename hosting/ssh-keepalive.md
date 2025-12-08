# SSH Keepalive Configuration to Prevent Session Timeouts

## Summary

Configure SSH keepalive on both client and server to prevent idle disconnects. While “infinite” timeout doesn’t exist, high keepalive limits make sessions practically persistent.

## Client-Side (your machine)

Add to `~/.ssh/config`:

```sshconfig
Host *
  ServerAliveInterval 60
  ServerAliveCountMax 10
  TCPKeepAlive yes
```

One-off connection:

```bash
ssh -o ServerAliveInterval=60 -o ServerAliveCountMax=10 -o TCPKeepAlive=yes user@host
```

- ServerAliveInterval: sends a keepalive every 60s.
- ServerAliveCountMax: allows many missed responses before disconnecting.
- TCPKeepAlive: also uses TCP-level probes.

## Server-Side (target host)

Edit `/etc/ssh/sshd_config`:

```sshconfig
ClientAliveInterval 60
ClientAliveCountMax 10
TCPKeepAlive yes
```

Reload SSHD:

```bash
sudo systemctl reload sshd
# or
sudo service ssh reload
```

## Why not “infinite”?

- Zero values often disable keepalive or cause immediate drops.
- Large `*CountMax` is effectively “unlimited” for normal ops.

## Network Middleboxes

Some firewalls/load balancers drop idle connections. Keepalive packets usually prevent this, but device policies may still enforce limits.

## Long-Running Workflows

Use a multiplexer to survive any network blips and reattach:

- tmux
- screen

## Security Considerations

- Long-lived sessions increase exposure if a workstation is unattended. Lock your screen and consider shorter intervals on shared environments.
- Audit SSHD config changes via versioning or change tickets where required.

## Rollback

Remove the added lines or restore previous values in `~/.ssh/config` and `/etc/ssh/sshd_config`, then reload SSHD.
