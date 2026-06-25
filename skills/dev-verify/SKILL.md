---
name: dev-verify
description: TDD-based verify loop for development. Spec → RED test → GREEN → Refactor → Verify. Test precedes any new logic >5 lines.
---

# Dev Verify Loop

```
Spec → Test (RED) → Implement (GREEN) → Refactor → Verify
```

## Iron Law

```
No implementation > 5 lines without a failing test first
```

Exceptions: <5 line utilities, config files, single-line typo fixes, library call wrappers.

## Spec (mandatory)

`docs/plans/<task>.md`:
```yaml
task: <1 sentence>
interface: <function signature · API endpoint · CLI command>
test_cases: [<case 1>, <case 2>, ...]
acceptance: <which tests must pass with which results to be complete>
```

## RED → GREEN → REFACTOR

1. **RED**: write failing test → `pytest <file>::<test> -x` → confirm fail
2. **GREEN**: minimal impl → re-run same test → confirm pass
3. **REFACTOR**: `anti-slop` 4-pass (dead → dup → name → test). Confirm test passes after each pass.

## Verify Gate

Before claiming complete:
- `pytest` or equivalent run + output quoted (0 fail)
- Linter run + output quoted (0 error)
- 5+ files or 100+ lines changed → also build check

## Don'ts

- Refactoring while adding features (separate commits)
- "Tests later" → reject
- "It works for now" → not complete without verify output
- Integration tests only → require unit + integration both (where applicable)

## Anti-Slop

- Unused imports/variables/functions → remove immediately
- Same logic 3+ times → extract
- Vague names (`data`, `temp`, `result`) → intent-revealing names