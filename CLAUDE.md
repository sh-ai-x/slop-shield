# Verify Loop Engine

> Reduce AI slop. Minimum prose. Verifiable output.

---

## Purpose

Filter AI slop at write time and reject unverified completion claims. Nothing more.

## Iron Laws

```
L1. No completion claim without verification evidence in the same message.
L2. No stubs, TODOs, placeholders, or "this is a starting point" output.
L3. Lean output: no preamble, no postamble, code-first, one answer.
```

## How it works

- **`hooks/slop-detector.sh`** flags banned AI-slop phrases on every Write/Edit.
- **`hooks/verify-gate.sh`** flags completion claims that don't cite verification output.

Both warn to stderr. They don't block. You decide.

## Banned phrases (auto-detected)

`Certainly`, `I'd be happy to`, `Great question`, `Let's dive in`, `delve into`, `leverage`, `robust`, `comprehensive`, `tapestry`, `seamlessly`, `unleash`, `empower`, `game-changer`, `cutting-edge`, `state-of-the-art`, `It's worth noting`, `Importantly`, `In conclusion`, `Hope this helps`.

## Commands

- `/verify` — apply iron laws to the current task.

## Don'ts

- "It depends" alone — name the variable or say you cannot answer.
- Listing 5 options when not asked — give one answer.
- Claiming "it works" without a test run + quoted output.
- Forcing TDD, plan templates, or domain-specific rituals. None are required.