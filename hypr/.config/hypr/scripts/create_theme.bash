#!/usr/bin/env bash

set -euo pipefail

FLAVOR="$(<"$HOME/.theme/current/current")"
SRC="$HOME/.theme/pre/catppuccin-$FLAVOR"
OUT="$HOME/.config/hypr/current_theme.conf"

{
  while read -r name hex; do
    ALPHA="${hex#\#}"
    printf '$%s = rgb(%s)\n' "$name" "$ALPHA"
    printf '$%sAlpha = %s\n' "$name" "$ALPHA"
  done < "$SRC"
} > "$OUT"
