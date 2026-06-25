#!/bin/bash
# On Stop, scan the last assistant message for completion claims
# (done/passes/fixed/works) and warn if no verification evidence is cited.
INPUT=$(cat)
MSG=$(echo "$INPUT" | jq -r '.last_assistant_message // ""' 2>/dev/null)

# Completion-claim patterns
CLAIM='(완료|되었습니다|통과|성공|작동|수정됨|수정했습니다|fixed|done|passes|works correctly|all tests pass)'
# Evidence patterns (source/output/quote)
EVIDENCE='(exit code|0 fail|0 errors|tested|output:|출력:|결과:|재실행|verified)'

if echo "$MSG" | grep -qE "$CLAIM"; then
  if ! echo "$MSG" | grep -qE "$EVIDENCE"; then
    echo "[verify-gate] Completion claim detected but no verification evidence (output / exit / test) cited." >&2
    echo "[verify-gate] Iron Law #2: run the verify command in the same message and quote the output." >&2
  fi
fi
exit 0