#!/bin/bash
# On TaskCompleted, check Iron Law #2 verify_evidence metadata.
INPUT=$(cat)
TASK_ID=$(echo "$INPUT" | jq -r '.task_id // ""' 2>/dev/null)
EVIDENCE=$(echo "$INPUT" | jq -r '.metadata.verify_evidence // ""' 2>/dev/null)
if [ -z "$EVIDENCE" ] || [ "$EVIDENCE" = "null" ]; then
  echo "[verify-gate] Task #$TASK_ID: no verify_evidence. Possible Iron Law #2 violation." >&2
fi