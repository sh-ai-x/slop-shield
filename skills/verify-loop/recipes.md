# Lean Recipes

## New plan
```
goal: <1 sentence>
constraint: <do not touch>
acceptance: <measurable pass>
```
→ Save to `docs/plans/<slug>.md` → user approves

## Validate marketing hypothesis
```
hypothesis: <1 sentence>
audience: <1 sentence>
metric: <1 metric>
cutoff: <kill threshold>
```
→ Save to `docs/decisions/<slug>.md` → measure → cutoff verdict

## Data analysis
1. Approve `docs/plans/<goal>.md`
2. Record env (colab|local) in `scratch/env.md`
3. EDA 2-pass → `scratch/hypothesis-eda.md`
4. Model 2-level → metric + seed quoted
5. Final report `docs/reports/<goal>.md`

## Code change
1. Write + approve `docs/plans/<task>.md`
2. RED: failing test → run → FAIL confirmed
3. GREEN: implement → run → PASS confirmed
4. REFACTOR: anti-slop 4-pass
5. VERIFY: pytest + lint + (if large) build output quoted

## Clean existing output
```
/anti-slop
```
4-pass: slop marker → dedup → fact-check → intent compression

## Code review
```
/code-review
```
Diff-only review (separate from writing context)

## Complete verification
```
verification-before-completion
```
- Claim: <what passed/works/completed>
- Evidence: <command output snippet + exit code>
- Quoted: <relevant lines>