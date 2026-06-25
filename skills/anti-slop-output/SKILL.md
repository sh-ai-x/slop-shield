---
name: anti-slop-output
description: 4-pass cleanup for AI slop in text outputs (documents, reports, hypotheses, plans). Distinct from the code anti-slop skill.
---

# Anti-Slop Output (Text Artifacts)

Distinct from `code-review` 4-pass. For **documents · reports · hypotheses · plans**.

## 4-Pass Order

```
PASS 1: Slop marker removal
  → Delete preamble/postamble/advertorial phrases
  → Delete unused paragraphs (empty space = page-filling suspicion)

PASS 2: Deduplication
  → Same claim appearing 2+ times → keep one
  → Table/list + paragraph repeating same content → keep table only

PASS 3: Fact check
  → Delete or source-tag unsourced statistics/numbers
  → "Research shows", "industry standard" → demand specifics

PASS 4: Intent compression
  → Lead with the core claim in one sentence
  → Supporting detail below (inverted pyramid)
```

## Slop Marker List (auto-detected)

**English**: Certainly, I'd be happy to, Great question, Let's dive in, delve into, leverage, robust, comprehensive, tapestry, seamlessly, unleash, empower, game-changer, cutting-edge, state-of-the-art, It's worth noting, Importantly, In conclusion, Hope this helps.

**Korean**: 강력한, 종합적인, 다양한, 꼼꼼하게, 꾹꾹, 핵심적으로, 중요한 점은, 살펴보겠습니다, 시사하는 바가 있습니다.

## Length Rules

- 1 slide = ~30 words body + 1 visual
- 1 report section = 1 core claim + ≤3 supporting points
- 1 hypothesis = 4 fields (hypothesis · metric · cutoff · duration) — no more