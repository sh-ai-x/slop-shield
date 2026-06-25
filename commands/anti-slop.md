---
description: 4-pass cleanup for AI slop in text artifacts (documents, reports, hypotheses, plans).
---

# /anti-slop — Output Cleanup

For: documents, reports, plans, slide decks, marketing copy.

## 4-Pass

1. **Slop markers**: delete preamble/postamble/advertorial phrases
2. **Deduplication**: same claim 2+ times → keep one
3. **Fact check**: source-tag or delete unsourced numbers
4. **Intent compression**: lead with the core claim

Banned phrases are listed in `skills/anti-slop-output/SKILL.md`.