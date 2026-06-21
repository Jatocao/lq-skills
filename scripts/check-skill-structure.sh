#!/usr/bin/env bash
# Enforce the CONTRIBUTING.md "hard floor" structure on skills CHANGED in a PR.
#
# Scope is intentionally limited to added/modified skills so the gate applies
# going forward without forcing a backfill of older skills. Pass the base ref
# to diff against via BASE_REF (default: origin/main).
#
# Required per changed skill:
#   - SKILL.md
#   - README.md
#   - LICENSE
#   - evals/evals.json  (canonical) OR evals.yaml (legacy, still accepted)
#
# A skill may declare itself eval-exempt (purely subjective output) by adding a
# file `evals/EXEMPT` containing a one-line justification.
set -euo pipefail

cd "$(dirname "$0")/.."

BASE_REF="${BASE_REF:-origin/main}"

# Skill dirs touched in this PR (added/modified/renamed), reduced to skill roots.
changed=$(git diff --name-only --diff-filter=ACMR "$BASE_REF"...HEAD -- skills/ 2>/dev/null \
  | sed -nE 's#^(skills/[^/]+)/.*#\1#p' | sort -u || true)

if [ -z "$changed" ]; then
  echo "ℹ️  No changed skills to check (base: $BASE_REF)."
  exit 0
fi

status=0
for d in $changed; do
  # Skip deletions — the dir no longer exists.
  [ -d "$d" ] || continue
  # Only check real skills.
  [ -f "$d/SKILL.md" ] || { echo "❌ $d: missing SKILL.md"; status=1; continue; }

  name=${d#skills/}
  miss=()
  [ -f "$d/README.md" ] || miss+=("README.md")
  [ -f "$d/LICENSE" ]   || miss+=("LICENSE")

  if [ ! -f "$d/evals/evals.json" ] && [ ! -f "$d/evals.yaml" ] && [ ! -f "$d/evals/EXEMPT" ]; then
    miss+=("evals/evals.json (or evals/EXEMPT with a justification)")
  fi

  if [ "${#miss[@]}" -gt 0 ]; then
    echo "❌ $name: missing $(IFS=', '; echo "${miss[*]}")"
    status=1
  else
    echo "✅ $name: structure OK"
  fi
done

if [ "$status" -ne 0 ]; then
  echo ""
  echo "See CONTRIBUTING.md → 'The Quality Gate' for the required structure."
fi
exit "$status"
