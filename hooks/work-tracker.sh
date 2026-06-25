#!/bin/bash
# Work counter (prompt/stop arg distinguishes).
MODE="${1:-prompt}"
INPUT=$(cat)
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
LOG="$PROJECT_DIR/.claude/logs/work.log"
mkdir -p "$(dirname "$LOG")"
echo "[$(date +%H:%M:%S)] $MODE" >> "$LOG"
exit 0