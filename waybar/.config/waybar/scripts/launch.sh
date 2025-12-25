#!/bin/sh
# this script only works if waybar is managed by uwsm

# get correct colors
echo "copying colors"
"$HOME/Dotfiles/waybar/.config/waybar/scripts/copy_theme.sh"

echo "restarting"
systemctl --user restart waybar.service
