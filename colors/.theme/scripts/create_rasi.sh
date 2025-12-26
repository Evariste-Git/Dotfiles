#!/bin/sh

set -e

FLAVOR="$(<"$HOME/.theme/current/current")"
SRC="$HOME/.theme/pre/catppuccin-$FLAVOR"
OUT="$HOME/.theme/current/current.rasi"

{
  echo '* {'
  while read -r name hex; do
    printf '%s: %s;\n' "$name" "$hex"
  done < "$SRC"
  echo '}'
} > "$OUT"
