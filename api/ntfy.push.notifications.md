# Push Notifications with ntfy

`ntfy` (notify) is a free, open-source, HTTP-based pub-sub notification service. You can send push notifications to your phone or desktop with a simple `curl` request — no registration or API key required.

- Public server: `https://ntfy.sh`
- Mobile apps: Android and iOS
- Self-hosting is also possible

## How It Works

1. Pick a topic name (it acts like a channel). Use a hard-to-guess name — anyone who knows the topic can read and post messages.
2. Subscribe to the topic in the mobile app: **"+" → "Subscribe to topic"**, enter the topic name, keep `ntfy.sh` as the server.
3. Publish messages to `https://ntfy.sh/<topic>` via HTTP POST.

> Messages are cached on the server for ~12 hours, so a device that subscribes later still receives recent messages.

## Sending Messages with curl

```bash
# Simple message
curl -d "Your message here" ntfy.sh/<topic>

# With title and priority
curl -H "Title: My Title" -H "Priority: high" -d "Your message" ntfy.sh/<topic>

# Send a file's content as the message
curl --data-binary @file.txt ntfy.sh/<topic>
```

## Priority Levels

| Value     | Behavior                                           |
| --------- | -------------------------------------------------- |
| `min`     | Lowest priority, no vibration/sound                |
| `low`     | No notification sound                              |
| `default` | Standard notification (default)                    |
| `high`    | Pops up on screen, may bypass Do Not Disturb       |
| `urgent`  | Highest priority, triggers alarm-like notification |

## Useful Headers

- `Title:` — notification title shown on the device
- `Priority:` — one of the values above
- `Tags:` — emoji/label tags (e.g. `Tags: warning,skull`)

## Example: Notify When a Long Task Finishes

```bash
python3 example.py && curl -d "Task finished" ntfy.sh/<topic>
```

Add a single `&& curl ...` line to any script or CI pipeline to get a push notification when the job completes or fails:

```bash
make build || curl -d "Build FAILED" -H "Priority: urgent" ntfy.sh/<topic>
```

## Notes

- Topic names should be treated as secrets — use random, long names (e.g. `osman-abc123xyz789`).
- No auth on the public server by default; for sensitive use, self-host or use access tokens.
