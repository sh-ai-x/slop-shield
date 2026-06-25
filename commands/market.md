---
description: Marketing hypothesis validation. Forces 4 fields (hypothesis/audience/metric/cutoff). Blocks unmeasured "it worked" reports.
---

# /market — Marketing Verify

For: content, campaign, copy, SEO, funnel, conversion.

## Required 4 fields

```yaml
hypothesis: <1 sentence>
audience: <1 sentence>
metric: <1 metric, with baseline>
cutoff: <kill threshold>
```

Save spec + measured result to `docs/decisions/<slug>.md`.

Use the marketer agent for hypothesis iteration.

Full rules: `skills/marketing-verify/SKILL.md`.