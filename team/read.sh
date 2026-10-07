#!/usr/bin/env bash
# Read the communal board. Usage: team/read.sh [last-N-lines]   (default 50)
dir="$(cd "$(dirname "$0")" && pwd)"
tail -n "${1:-50}" "$dir/board.md" 2>/dev/null || echo "(board is empty)"
