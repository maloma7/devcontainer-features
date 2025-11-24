#!/bin/bash

set -e

# Test if Gemini CLI is installed
if ! command -v gemini &> /dev/null; then
    echo "gemini command not found"
    exit 1
fi

# Test version output (Gemini CLI outputs version number like "0.17.1")
if ! gemini --version | grep -q "[0-9]"; then
    echo "gemini version check failed"
    exit 1
fi

echo "Gemini CLI installation test passed!"
exit 0