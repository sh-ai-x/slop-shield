---
name: verify-loop
description: Master skill for all domain work. Forces Goal/Constraint/Acceptance 3 fields at start and verify-before-completion at finish.
---

# Verify Loop (Master)

## Iron Laws (immutable)

```
L1. No work starts without Goal · Constraint · Acceptance
L2. No completion claim without verification evidence
L3. No stub · TODO · placeholder output
L4. No unsourced statistic or fix stated as fact
L5. No work beyond user's requested scope
```

## Start Gate (all domains)

First response must pin these 3 fields:

```yaml
goal: <one sentence, measurable>
constraint: <what cannot be touched / must be respected>
acceptance: <what is true when this is complete>
```

Even trivial work (1 file, <10 lines) needs the inline 3-line declaration. No exception.

## Finish Gate

Before claiming complete:
1. Run the verification command **in this same message**
2. Quote exit code + part of output
3. Pass → "complete" is allowed. Fail → report the actual state honestly.

## Domain Delegation

When domain is identified, delegate to the specialist skill:

| Domain | Skill |
|---|---|
| planning | `/plan` |
| marketing | `/market` |
| data analysis | `/data` |
| development | `/build` |

Domain unclear → `AskUserQuestion` once (4-way).

## Lean Output Rules

- One line if one line answers it
- Code first, prose secondary
- Slop markers auto-blocked (hook)
- No option enumeration (single answer first)