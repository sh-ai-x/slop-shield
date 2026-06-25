#!/bin/bash
# Session end summary.
INPUT=$(cat)
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
LOG="$PROJECT_DIR/.claude/logs/work.log"
if [ -f "$LOG" ]; then
  COUNT=$(wc -l < "$LOG" | tr -d ' ')
  echo "[session-wrap] prompts in session: $COUNT" >&2
fi