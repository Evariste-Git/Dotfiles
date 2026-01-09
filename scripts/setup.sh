#!/bin/sh

echo "[*] check for repository"
if [ -d "$HOME/Dotfiles" ]; then
    echo "[+] $HOME/Dotfiles exists"
else
    echo "[-] $HOME/Dotfiles is missing"
    exit 1
fi

$HOME/Dotfiles/scripts/install.sh

echo "+++ Begin Setup +++"

echo "[*] enable sddm"
sudo systemctl enable sddm.service
