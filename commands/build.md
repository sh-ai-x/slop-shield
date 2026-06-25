---
description: Development TDD verify loop. RED → GREEN → Refactor → Verify. Test precedes any logic >5 lines.
---

# /build — Development Verify Loop

For: feature, bugfix, refactor, API, integration.

## Flow

1. Write + approve `docs/plans/<task>.md`.
2. RED: write failing test → run → confirm FAIL.
3. GREEN: minimal impl → run same test → confirm PASS.
4. REFACTOR: anti-slop 4-pass, test passes after each pass.
5. VERIFY: pytest + lint; + build if 5+ files or 100+ lines changed.

Use the builder agent (worktree isolation).

Full rules: `skills/dev-verify/SKILL.md`.