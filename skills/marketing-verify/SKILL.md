---
name: marketing-verify
description: Forces 1-sentence hypothesis + 1 metric + cutoff. Blocks "it worked" reports without measured numbers.
---

# Marketing Verify Loop

```
Hypothesis → Audience → Channel → Metric → Test → Measure → Iterate
```

## Iron Law

```
No "it worked" report without a measured number
```

## Hypothesis Spec (4 required fields)

```yaml
hypothesis: "<1 sentence. Example: '30s hook + comparison cuts increase avg watch time by 20%'>"
audience:   "<1 sentence. Who>"
metric:     "<1 metric. Conversion|CTR|Watch-time|Reach|Retention>"
cutoff:     "<when to kill. Example: 'ROI < 1.0 after 7 days → kill'>"
```

## Output Format

`docs/decisions/<hypothesis-slug>.md`:

```
## Hypothesis: <hypothesis>
- Audience: <audience>
- Metric: <metric> (baseline: <baseline>)
- Cutoff: <cutoff>
- Budget/duration: <budget/duration>

## Result (after measurement)
- Measured: ...
- Verdict: pass | kill
- Learning: ...
```

## Verify Gate

When writing the report:
- Quote measured numbers
- Cite data source + date
- No standalone qualitative claims ("good", "worked", "impressive")

## Anti-Slop

- "Increase brand awareness" (unmeasurable) → reject
- "It'll go viral" (no baseline) → request cutoff
- "More traffic" (vague) → require absolute value + duration