#!/bin/bash
# Log file edit history (no synchronous linter — would add edit latency).
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)
[ -z "$FILE" ] && exit 0
echo "[post-edit] modified: $FILE" >&2