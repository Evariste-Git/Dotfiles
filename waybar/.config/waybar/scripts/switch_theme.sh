#!/usr/bin/env bash

set -euo pipefail

THEMES="latte\nfrappe\nmacchiato\nmocha"
CURR_STATE="$HOME/Dotfiles/colors/.theme/current/current"

choice="$(printf "%b" "$THEMES" | rofi -dmenu -p 'select theme')"
[ -z "$choice" ] && exit 0

echo "$choice" > "$CURR_STATE"
"$HOME/Dotfiles/colors/.theme/scripts/create_GTK.bash" "$choice"
"$HOME/Dotfiles/colors/.theme/scripts/create_rasi.sh"
"$HOME/Dotfiles/hypr/.config/hypr/scripts/reload.sh"
"$HOME/Dotfiles/waybar/.config/waybar/scripts/launch.sh"
