#!/bin/sh

echo "running setup.sh"

echo "check if bash is installed"
if command -v bash >/dev/null 2>&1; then
    echo "bash is installed"
else
    echo "bash is not installed"
    exit 1
fi
