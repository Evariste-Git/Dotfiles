#!/bin/sh

check_installed()
{
    pacman -Q $1 >/dev/null 2>&1;
}

install()
{
    echo "[*] Check if $1 is installed"
    if check_installed $1; then
        echo "[+] $1 is installed"
    else
        echo "[-] $1 is not installed"
        exit 1
    fi
}

echo "+++ Installing Dotfile Dependencies +++"
install bash
install hehehihi
