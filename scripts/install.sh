#!/bin/sh

echo "Installing Dotfiles ..."

if command -v bash >/dev/null 2>&1; then
    echo "bash is installed"
else
    echo "bash is not installed"
    exit 1
fi
