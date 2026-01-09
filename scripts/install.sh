#!/bin/sh

PACKAGES="
bash
fastfetch
hyprland
hyprlock
hyprpaper
hyprsunset
uwsm
libnewt
sddm
"

echo "+++ Upgrade System +++"
sudo pacman -Syu

echo "+++ Install Missing Dotfile Dependencies +++"
sudo pacman -S --needed $PACKAGES
