#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)
if echo "$CMD" | grep -qE 'rm\s+-rf\s+/|DROP\s+TABLE\s|TRUNCATE\s+.*prod|format\s+[A-Z]:'; then
  echo '{"decision":"block","reason":"Dangerous command detected. User confirmation required before execution."}'
fi