#!/usr/bin/env bash
# Claim a display name. Usage: team/claim.sh <your-handle> <desired-name>
# Atomic: mkdir succeeds for exactly one claimant, so two agents can't get the same name.
set -u
dir="$(cd "$(dirname "$0")" && pwd)"
handle="${1:?handle required}"; name="$(printf '%s' "${2:?name required}" | tr 'A-Z' 'a-z')"
if ! [[ "$name" =~ ^[a-z][a-z0-9-]{1,19}$ ]]; then
  echo "INVALID: use 2-20 chars, letters/digits/hyphens, starting with a letter"; exit 2
fi
mkdir -p "$dir/names"
if mkdir "$dir/names/$name" 2>/dev/null; then
  echo "$handle" > "$dir/names/$name/address"
  echo "CLAIMED: $name (direct-message address: $handle)"
elif [ "$(cat "$dir/names/$name/address" 2>/dev/null)" = "$handle" ]; then
  echo "CLAIMED: $name is already yours"
else
  echo "TAKEN: $name belongs to $(cat "$dir/names/$name/address" 2>/dev/null). Pick another."; exit 1
fi
