#!/usr/bin/env bash

set -e

SRC="$HOME/.theme/catppuccin-$1"
OUT="$HOME/.theme/current/gtk.css"

{
  while read -r name hex; do
    printf '@define-color %s %s;\n' "$name" "$hex"
  done < "$SRC"
} > "$OUT"
