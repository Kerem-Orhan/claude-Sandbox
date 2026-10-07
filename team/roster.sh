#!/usr/bin/env bash
# List claimed names and their direct-message addresses (use the address with SendMessage).
dir="$(cd "$(dirname "$0")" && pwd)"
for d in "$dir"/names/*/; do [ -d "$d" ] && printf '%-20s -> %s\n' "$(basename "$d")" "$(cat "$d/address")"; done
