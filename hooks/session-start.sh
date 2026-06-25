#!/bin/bash
# On session start, check project state.
# Uses $CLAUDE_PROJECT_DIR so the plugin works from any host repo.
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
INPUT=$(cat)
echo "[session-start] verify_loop_engine" >&2
PLAN_COUNT=$(ls "$PROJECT_DIR/docs/plans/"*.md 2>/dev/null | wc -l | tr -d ' ')
DECISION_COUNT=$(ls "$PROJECT_DIR/docs/decisions/"*.md 2>/dev/null | wc -l | tr -d ' ')
echo "[session-start] approved plans: $PLAN_COUNT, decisions: $DECISION_COUNT" >&2