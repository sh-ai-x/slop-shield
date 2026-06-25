# Verify Loop Engine

Filter AI slop. Reject unverified completion claims. That's it.

## Install

```bash
# Local
claude --plugin-dir /Users/sanghee/dev/verify_loop_engine

# Marketplace
claude marketplace add verify-loop-engine https://github.com/sh-ai-x/verify-loop-engine
claude plugin install verify-loop-engine
```

## What it does

Two hooks, run automatically:

| Hook | When | Action |
|---|---|---|
| `slop-detector` | Write / Edit | Flags banned phrases (`delve into`, `leverage`, `comprehensive`, ...) |
| `verify-gate` | Stop | Flags completion claims without quoted test output |

Both print to stderr. Neither blocks. You decide whether to act.

## Layout

```
verify_loop_engine/
├── .claude-plugin/plugin.json   # Manifest
├── CLAUDE.md                    # Iron laws (3)
├── README.md
├── commands/verify.md           # /verify entry
├── skills/verify-loop/SKILL.md
└── hooks/
    ├── hooks.json
    ├── slop-detector.sh
    └── verify-gate.sh
```

## License

MIT