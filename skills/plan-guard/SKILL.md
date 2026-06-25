---
name: plan-guard
description: Forces Goal/Constraint/Acceptance 3 fields in planning. Blocks execution mode before plan approval.
---

# Plan Guard

## Iron Law

```
No execution without Goal · Constraint · Acceptance
```

## Input Handling

When the user presents a vague intent ("let's do X", "I want to build Y", "help me organize Z"):

1. **Wonder**: surface 3 hidden meaning candidates
2. **Reflect**: show where each candidate matches vs diverges from intent
3. **Refine**: incorporate user feedback
4. **Restate**: converge to a 1-sentence Goal

## Output File Format

`docs/plans/<plan-slug>.md`:

```markdown
# <Plan Title>

## Goal
<1 sentence. Measurable. Example: "Reach 10k MAU">

## Constraint
- Cannot touch: <e.g. existing auth system>
- Must respect: <e.g. English-first, MVP in 4 weeks>

## Acceptance
- [ ] <condition 1>
- [ ] <condition 2>

## Non-Goals (mandatory)
- <what this round does NOT do>
```

## Verify Gate

Before execution phase:
- File exists
- Goal/Constraint/Acceptance/Non-Goals all populated
- Empty fields → AskUserQuestion to fill them fast