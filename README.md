# Slop Shield

Filter AI slop. Reject unverified completion claims. That's it.

## Install

```bash
# Local
claude --plugin-dir /Users/sanghee/dev/slop-shield

# Marketplace
claude marketplace add slop-shield https://github.com/sh-ai-x/slop-shield
claude plugin install slop-shield
```

## What it does

Two hooks (auto) + one command (manual):

| Component | When | Action |
|---|---|---|
| `slop-detector` hook | Write / Edit | Flags banned phrases (`delve into`, `leverage`, ...) |
| `verify-gate` hook | Stop | Flags completion claims without quoted test output |
| `/slop-scan [path]` | Manual | Bulk audit — ranks files by slop count |

Hooks print to stderr; they don't block. `/slop-scan` reports existing slop in a directory.

## Layout

```
slop-shield/
├── .claude-plugin/plugin.json   # Manifest
├── CLAUDE.md                    # Iron laws (3) — auto-loaded
├── README.md
├── commands/slop-scan.md        # /slop-scan
└── hooks/
    ├── hooks.json
    ├── slop-detector.sh
    └── verify-gate.sh
```

## License

MIT