#!/bin/bash
# AI slop pattern detector. Flags banned phrases in Write/Edit results.
# Does not block; prints to stderr so user can ignore if intentional.
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // ""' 2>/dev/null)
[ -z "$CONTENT" ] && exit 0

# Slop markers (English + Korean)
SLOP='(Certainly[!.]|I'\''d be happy to|Great question|Let'\''s dive in|delve into|leverage|robust|comprehensive|tapestry|In conclusion|Hope this helps|It'\''s worth noting|Importantly|seamlessly|unleash|empower|game-changer|cutting-edge|state-of-the-art|강력한|종합적인|다양한|꼼꼼하게|꾹꾹|핵심적으로|중요한 점은|주시하겠습니다|살펴보겠습니다)'

MATCHES=$(echo "$CONTENT" | grep -oE "$SLOP" 2>/dev/null | sort -u | head -5)
if [ -n "$MATCHES" ]; then
  echo "[slop-detector] $FILE — slop markers detected:" >&2
  echo "$MATCHES" | sed 's/^/  - /' >&2
  echo "[slop-detector] If intentional, ignore. Otherwise delete the phrases." >&2
fi
exit 0