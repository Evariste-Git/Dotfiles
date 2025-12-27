# Dotfiles
This repositiory helps me to keeps track of my personal dotfiles and enables you to use them.
I use [GNU Stow](https://www.gnu.org/software/stow/) to symlink the files to their correct location.

# Important
I use uwsm to manage hyprland, and the `launch.sh` script is focused on that.
So after creating the symlink with stow you still need to run `systemctl --user enable --now waybar.service"` once.

# Installation

## 1. Archlinux
For the installation i assume a fresh and minimal (what this exactly means is something you have to figure out) Archlinux installation.
You can (should) follow [this guide](https://wiki.archlinux.org/title/Installation_guide) for the installation.

## 2. Download
For this step you now defenetly need [git](https://wiki.archlinux.org/title/Git), so [install](https://wiki.archlinux.org/title/Help:Reading#Installation_of_packages) it by running
``sudo pacman -S git``
