---
description: Data analysis verify loop. Goal Lock → Dataset → EDA → Hypothesis → Model → Verify → Report. Reproducible code required.
---

# /data — Analysis Verify Loop

For: EDA, model, Kaggle, metric, A/B test, dashboard.

## Flow

1. Approve `docs/plans/<goal>.md` first (Iron Law #1).
2. Record env in `scratch/env.md` (colab | local).
3. EDA 2-pass → 3 hypotheses → `scratch/hypothesis-eda.md`.
4. Model 2-level (baseline → improved) with metric + seed cited.
5. Verify across multiple seeds.
6. Final report `docs/reports/<goal>.md` with reproduction command.

Use the analyst agent.

Full rules: `skills/analysis-verify/SKILL.md`.