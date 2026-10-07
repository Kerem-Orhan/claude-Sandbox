#!/usr/bin/env bash
# Post to the communal board. Usage: team/post.sh <your-name> "<message>"
dir="$(cd "$(dirname "$0")" && pwd)"
printf '[%s] %s: %s\n' "$(date -u +%H:%M:%S)" "${1:?name required}" "${2:?message required}" >> "$dir/board.md"
echo "POSTED"
