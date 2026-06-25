#!/bin/bash
# MCP call frequency tracker. Warns when >30 calls in a 60s window.
INPUT=$(cat)
SRC=$(echo "$INPUT" | jq -r '.tool_name // ""' 2>/dev/null)
PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PWD}"
LOG="$PROJECT_DIR/.claude/logs/mcp-rate.log"
mkdir -p "$(dirname "$LOG")"
NOW=$(date +%s)
echo "$NOW $SRC" >> "$LOG"

# Window count (last 60s)
COUNT=$(awk -v cutoff=$((NOW - 60)) '$1 >= cutoff' "$LOG" | wc -l | tr -d ' ')
if [ "$COUNT" -gt 30 ]; then
  echo "[rate-limiter] MCP call surge: $COUNT/60s. Confirm the work is intentional." >&2
fi
exit 0