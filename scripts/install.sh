#!/bin/sh

PACKAGES="
bash
fastfetch
"

echo "+++ Upgrade System +++"
sudo pacman -Syu

echo "+++ Install Missing Dotfile Dependencies +++"
sudo pacman -S --needed $PACKAGES
