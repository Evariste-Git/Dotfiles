#!/usr/bin/env bash

set -euo pipefail

FLAVOR="$1"
SRC="$HOME/.theme/pre/catppuccin-$FLAVOR"
OUT="$HOME/.theme/current/gtk.css"

{
  while read -r name hex; do
    # compute rgb
    rgb="${hex#\#}"
    r=$((16#${rgb:0:2}))
    g=$((16#${rgb:2:2}))
    b=$((16#${rgb:4:2}))
    printf '@define-color %s %s;\n' "$name" "$hex"
    printf '@define-color %s_10 rgba(%d, %d, %d, 0.10);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_20 rgba(%d, %d, %d, 0.20);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_30 rgba(%d, %d, %d, 0.30);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_40 rgba(%d, %d, %d, 0.40);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_50 rgba(%d, %d, %d, 0.50);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_60 rgba(%d, %d, %d, 0.60);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_70 rgba(%d, %d, %d, 0.70);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_80 rgba(%d, %d, %d, 0.80);\n' "$name" "$r" "$g" "$b"
    printf '@define-color %s_90 rgba(%d, %d, %d, 0.90);\n' "$name" "$r" "$g" "$b"
  done < "$SRC"
} > "$OUT"
