# Verify Loop Engine

A Claude Code harness that produces **high-quality output with minimum code and prose** across four domains: planning, marketing, data analysis, and development.

It enforces a Goal-Lock + verify-before-completion contract, blocks AI-slop phrases at write time, and rejects unverified completion claims.

---

## What you get

| Asset | Count | Purpose |
|---|---|---|
| Iron laws | 5 | Hard gates that cannot be bypassed |
| Slash commands | 6 | `/verify-loop`, `/plan`, `/market`, `/data`, `/build`, `/anti-slop` |
| Skills | 7 | Domain-specific verify loops + templates |
| Agents | 4 | `planner` (opus) · `marketer` · `analyst` · `builder` |
| Hooks | 10 | Auto gates (slop-detector, verify-gate, security, secrets, rate-limit) |

---

## Install

### Option A — Local plugin dir (fastest)

```bash
claude --plugin-dir /path/to/verify_loop_engine
```

### Option B — Add this repo as a marketplace

```bash
# one-time: register the marketplace (replace with your fork/clone path)
claude marketplace add verify-loop-engine /path/to/verify_loop_engine

# install
claude plugin install verify-loop-engine

# update later
claude plugin update verify-loop-engine
```

### Option C — Use as a project (legacy)

```bash
claude /path/to/verify_loop_engine
```

When used as a project, the local `CLAUDE.md` is loaded directly and `.claude/settings.json` (if present) wires the hooks manually.

---

## Iron Laws (immutable)

```
L1. No work starts without Goal · Constraint · Acceptance
L2. No completion claim without verification evidence
L3. No stubs · TODO · placeholder output
L4. No unsourced statistics or numbers stated as fact
L5. No work or output beyond the user's requested scope
```

Full rules: [CLAUDE.md](./CLAUDE.md).

---

## Domain Verify Loops

| Domain | Command | Loop |
|---|---|---|
| Planning | `/plan` | Wonder → Reflect → Refine → Restate → Approve |
| Marketing | `/market` | Hypothesis → Audience → Metric → Cutoff → Measure |
| Data analysis | `/data` | Goal → Dataset → EDA → Hypothesis → Model → Verify → Report |
| Development | `/build` | Spec → RED → GREEN → Refactor → Verify |

Each domain has a specialist agent. The harness routes by signal words or asks once via `AskUserQuestion` if unclear.

---

## Hooks (automatic gates)

| Hook | When | What |
|---|---|---|
| `slop-detector` | Write / Edit | Flags AI-slop phrases (`delve into`, `leverage`, `comprehensive`, `강력한`, ...) |
| `verify-gate` | Stop | Warns on completion claims without quoted verify output |
| `security-guard` | Bash | Blocks `rm -rf /`, `DROP TABLE`, etc. |
| `secret-filter` | Bash output | Flags API keys / private keys in stdout |
| `rate-limiter` | MCP calls | Warns on >30 MCP calls / 60s |
| `task-completed` | TaskCompleted | Requires `verify_evidence` metadata |
| `session-start` / `session-wrap` / `work-tracker` / `post-edit` | Lifecycle | Counters and logs |

Hooks resolve `$CLAUDE_PROJECT_DIR` so the plugin works from any host repo.

---

## Directory layout

```
verify_loop_engine/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest
│   └── marketplace.json     # Single-plugin marketplace (for `claude marketplace add`)
├── CLAUDE.md                # Iron Laws + lean output contract
├── README.md                # This file
├── commands/                # Slash command entry points
├── skills/                  # Domain skills (verify-loop, plan-guard, ...)
├── agents/                  # Domain agents (planner, marketer, analyst, builder)
├── hooks/                   # Hook scripts + hooks.json
├── docs/
│   ├── plans/               # Approved Goal · Constraint · Acceptance · Non-Goals
│   ├── decisions/           # Hypothesis · metric · cutoff · result
│   └── reports/             # Reproducible code + metric + limits
├── scratch/                 # Ephemeral notes (gitignored)
├── .gitignore
└── .claudeignore
```

---

## Quick start after install

```bash
# 1. Start a plan
/plan <one-line idea>
# → Socratic converge → docs/plans/<slug>.md → approve

# 2. Validate a marketing hypothesis
/market <hypothesis>
# → 4-field spec → docs/decisions/<slug>.md → measure → verdict

# 3. Run an analysis
/data
# → env (colab|local) → dataset → loop → docs/reports/<goal>.md

# 4. Make a code change
/build <task>
# → approve plan → TDD cycle → verify evidence

# 5. Clean existing output
/anti-slop
# → 4-pass cleanup
```

---

## Configuration

### Per-project `.claude/settings.json` (optional override)

The plugin's `hooks/hooks.json` wires everything automatically. To override per project, add `.claude/settings.json` in the host repo and reference `additionalDirectories` or copy hooks selectively.

### Disabling a hook

Comment out the matching entry in `hooks/hooks.json` of this plugin, then `claude plugin update verify-loop-engine`.

### Hook logs

Stored at `<host-repo>/.claude/logs/work.log` and `.claude/logs/mcp-rate.log`. Add to `.gitignore`.

---

## Lean Output Contract (in every response)

| Rule | Applied |
|---|---|
| Lean first | One line if one line answers it |
| Code over prose | Snippet / command first when applicable |
| One answer, not many | Single answer when not asked for options |
| No preamble | Delete "Certainly", "Great question", "Let's dive in" |
| No postamble | Delete "Hope this helps", "Feel free to ask more" |
| Working code only | No stubs, no TODO, no `# write here` |
| Numbers need sources | Unsourced → "estimated" or "needs verification" |

The `slop-detector` hook auto-flags banned phrases on Write/Edit.

---

## Compatibility

- Claude Code ≥ 1.0 (plugin system)
- macOS / Linux (hooks use bash + jq)
- No network dependency

---

## License

MIT