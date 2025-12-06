#!/bin/bash
# Skript to reload waybar

# Quit running waybar instances
killall waybar
sleep 0.5

# Reload waybar
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css

