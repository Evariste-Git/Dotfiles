#!/bin/sh

THEMES="latte\nfrappe\nmacchiato\nmocha"
CURR_STATE="$HOME/Dotfiles/colors/.theme/current/current"

choice="$(printf "$THEMES" | wofi --dmenu --prompt 'select theme')"
[ -z "$choice" ] && exit 0

echo "$choice" > "$CURR_STATE"
"$HOME/Dotfiles/colors/.theme/scripts/create_GTK.bash" "$choice"
"$HOME/Dotfiles/waybar/.config/waybar/scripts/launch.sh"
