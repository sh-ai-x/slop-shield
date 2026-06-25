#!/bin/bash
# PostToolUse(Bash) — flag secrets in command output.
INPUT=$(cat)
OUTPUT=$(echo "$INPUT" | jq -r '.tool_result // ""' 2>/dev/null)
if echo "$OUTPUT" | grep -qE '(sk-[a-zA-Z0-9]{20,}|ghp_[a-zA-Z0-9]{36}|AKIA[A-Z0-9]{16}|-----BEGIN.*PRIVATE KEY)'; then
  echo "[secret-filter] API key or secret value detected in output. Review masking." >&2
fi
exit 0