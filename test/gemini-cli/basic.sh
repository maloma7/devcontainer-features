#!/bin/bash

set -e

# Test if Gemini CLI is installed
if ! command -v gemini &> /dev/null; then
    echo "gemini command not found"
    exit 1
fi

# Test version output
if ! gemini --version | grep -q "gemini-cli"; then
    echo "gemini version check failed"
    exit 1
fi

echo "Gemini CLI installation test passed!"
exit 0