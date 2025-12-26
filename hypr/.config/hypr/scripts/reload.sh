#!/bin/sh

# get correct colors
echo "copying colors for hyprland"
"$HOME/Dotfiles/hypr/.config/hypr/scripts/create_theme.bash"

echo "reload hyprland"
hyprctl reload

echo "set correct background"
"$HOME/.config/backgrounds/scripts/set_background.sh"
echo "Reloading Hyprpaper"
systemctl --user restart hyprpaper.service
