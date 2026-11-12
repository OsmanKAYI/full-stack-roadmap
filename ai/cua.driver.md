# Cua Driver — Let an AI Agent Use Your Apps (Ubuntu)

Install and connect [Cua Driver](https://cua.ai/docs/cua-driver) on Ubuntu so an AI agent (Claude Code, Codex, Cursor, …) can click, type, scroll, and switch tabs inside your desktop apps — in the background, with its own cursor, while you keep working.

---

## Platform Support

| Computer | Requirements                                           | Works?                |
| -------- | ------------------------------------------------------ | --------------------- |
| Mac      | macOS 14+, grant Accessibility + Screen Recording once | Yes                   |
| Windows  | Windows 10/11/Server, user signed in at the desktop    | Yes                   |
| Linux    | x86_64 desktop, X11 or XWayland, AT-SPI 2              | Yes, with some limits |

> On GNOME, window geometry needs the bundled **WinRects** helper (steps below). Some apps only work while in the foreground — see the docs' _Platform support_ page.

---

## 1) Install Cua Driver

No sudo needed for the driver itself — it installs under `~/.cua-driver/` and puts `cua-driver` on PATH (`~/.local/bin`).

```bash
# Minimal deps (usually already installed on Ubuntu Desktop)
sudo apt install -y libxi6 at-spi2-core

# Installer
/bin/bash -c "$(curl -fsSL https://cua.ai/driver/install.sh)"
```

## 2) GNOME: install the WinRects helper

On GNOME the driver needs the bundled GNOME extension to read window bounds:

```bash
~/.cua-driver/packages/current/wayland-helper/install.sh
```

Then **log out and back in once** so GNOME Shell loads it, and verify:

```bash
gnome-extensions info winrects@cua   # expect: State: ACTIVE
```

## 3) Start the daemon

Run it **inside the desktop session** (not over SSH) so it can reach the display and accessibility bus — leave the terminal open:

```bash
cua-driver serve
```

Default permission mode is `standard` (input allowed to every app). For real workloads consider `bounded` — see the docs' _Permissions_ page.

## 4) Verify (second terminal)

```bash
cua-driver status          # "Cua Driver daemon is running"
cua-driver doctor          # read warnings — exit 0 alone doesn't prove readiness
cua-driver call list_apps  # should list real GUI apps; open one first if empty
```

## 5) Connect your agent

The installer already ran `cua-driver connect`, which wires up Claude Code, Codex and Cursor if present. To (re)connect or add others:

```bash
cua-driver connect                    # auto-detect Claude Code / Codex / Cursor / Droid
cua-driver skills install             # install the agent skill everywhere it can
cua-driver mcp-config --client codex  # prints the exact MCP registration for a client
```

- **Skill** = teaches a shell-capable agent to run `cua-driver call <tool>` — the recommended route for Claude Code (`skills install`, then start a fresh session).
- **MCP** = exposes Cua Driver as a tool server (`cua-driver mcp`); `mcp-config --client <name>` prints the ready-to-run registration command for: claude, codex, cursor, antigravity, openclaw, droid, opencode, zcode, qwen, pi, …
- Any client accepting the standard MCP shape works:

```json
{
  "mcpServers": {
    "cua-driver": {
      "command": "cua-driver",
      "args": ["mcp"]
    }
  }
}
```

Restart the agent afterwards.

## 6) First task (from the official quickstart)

With the daemon running and GNOME Calculator installed, ask your agent to compute 6 × 7 in Calculator — it opens the app, does the math, and reads back 42.

---

## Notes

- Cua Driver **never calls a model API** — your agent harness owns the model and the loop; the driver only executes UI actions.
- Over SSH or on a headless box it won't see a desktop — run `serve` inside the session that owns the display.
- Windows equivalent: `irm https://cua.ai/driver/install.ps1 | iex` then `cua-driver autostart kick`.
- On macOS 26+, **Cua Spaces** bundles the driver and handles updates + agent connection.

**Ref:**

- [Cua Driver docs](https://cua.ai/docs/cua-driver)
- [Quickstart](https://cua.ai/docs/cua-driver/quickstart)
- [Connect your agent](https://cua.ai/docs/cua-driver/guides/connect-your-agent)
- [Docs index (llms.txt)](https://cua.ai/docs/llms.txt)
