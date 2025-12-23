# Dotfiles
This repositiory helps me to keeps track of my personal dotfiles and enables you to use them.
I use [GNU Stow](https://www.gnu.org/software/stow/) to symlink the files to their correct location.

# Important
I use uwsm to manage hyprland, and the `launch.sh` script is focused on that.
So after creating the symlink with stow you still need to run `systemctl --user enable --now waybar.service"` once.
