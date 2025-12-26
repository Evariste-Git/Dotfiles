#!/bin/sh

FLAVOR="$(<"$HOME/.theme/current/current")"

cp "$HOME/.config/backgrounds/catppuccin-$FLAVOR.png" "$HOME/.config/backgrounds/current.png"
