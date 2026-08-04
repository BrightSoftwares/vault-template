#!/usr/bin/env bash
# RED-content gate: fails CI if any real-brand/real-name/credential pattern is found.
# This template must stay 100% generic/fictional — see README "Clean-room" note.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

# Real names/brands that must NEVER appear in this template's tracked content.
# Update this list only if the source vault's real entity list changes.
FORBIDDEN_TERMS='essilorluxottica|bright ?softwares|kekeli|kékéli|afanou|sergio afanou|afrikeli|causting|notiwise|pilotflow|luminous(commerce)?|eagles-techs|foolywise|moda by flora|joyous by flora|ieatmyhealth'

SECRET_PATTERNS='api[_-]?key\s*[:=]|secret\s*[:=]|password\s*[:=]|-----BEGIN [A-Z]+ PRIVATE KEY|ghp_[A-Za-z0-9]{30,}|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,}'

fail=0

# Exclude this script itself: it necessarily contains the forbidden-term list
# as a literal pattern string, which would otherwise match itself every run.
SELF_PATH="scripts/red_content_scan.sh"

echo "== Scanning tracked files for forbidden real names/brands =="
matches=$(git ls-files | grep -v '^\.git' | grep -vFx "$SELF_PATH" | xargs -I{} grep -nEi "$FORBIDDEN_TERMS" {} 2>/dev/null || true)
if [ -n "$matches" ]; then
  echo "FAIL: forbidden real-entity references found:"
  echo "$matches"
  fail=1
else
  echo "OK: no forbidden real-entity references."
fi

echo "== Scanning tracked files for credential-shaped strings =="
secrets=$(git ls-files | grep -v '^\.git' | grep -vFx "$SELF_PATH" | xargs -I{} grep -nEi "$SECRET_PATTERNS" {} 2>/dev/null || true)
if [ -n "$secrets" ]; then
  echo "FAIL: credential-shaped strings found:"
  echo "$secrets"
  fail=1
else
  echo "OK: no credential-shaped strings."
fi

if [ "$fail" -eq 1 ]; then
  echo ""
  echo "RED-content gate FAILED. Fix the file(s) above before merging."
  exit 1
fi

echo ""
echo "RED-content gate PASSED."
