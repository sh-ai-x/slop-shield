---
name: analysis-verify
description: Verify loop for data analysis. Goal Lock → Dataset → EDA → Hypothesis → Model → Verify → Report. Reproducible code attached.
---

# Analysis Verify Loop

```
Goal → Dataset → EDA → Hypothesis → Model → Verify → Report
```

## Iron Law #1 Gate

```
No model run before docs/plans/<goal>.md is approved
```

`docs/plans/<goal>.md` format:
```yaml
goal: <1 sentence>
dataset: <source, size, license>
success_metric: <RMSE ≤ 0.85 | AUC ≥ 0.80 | ...>
baseline: <current best or trivial baseline>
acceptance: <metric + cutoff>
```

## Environment

- Read `scratch/env.md` for execution_env (colab | local)
- If missing → AskUserQuestion, then write to `scratch/env.md` (persists across sessions)

## Verify Stage (mandatory)

1. **EDA 2-pass**: distribution/missing/outliers → 3 hypotheses
2. **Model 2-level**: baseline → improvement (each with metric + seed)
3. **Reproducibility check**: metric holds across other seeds
4. **Report**: `docs/reports/<goal>.md` — reproducible code + metric + limits

## Anti-Slop

- "Performance improved" (no numbers) → reject
- Single-seed result → require bootstrap / multiple seeds
- Claiming "predictable" without model interpretation → demand SHAP/feature importance

## File Convention

```
docs/plans/<goal>.md       Approved analysis plan
scratch/env.md             Execution env (colab|local)
scratch/hypothesis-eda.md  EDA results · hypotheses
scratch/analysis-cycle.md  Per-cycle metric log
docs/reports/<goal>.md     Final report (code + metric + limits)
```