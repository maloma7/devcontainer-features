#!/bin/bash

set -e

# Test if gitlint is installed
if ! command -v gitlint &> /dev/null; then
    echo "gitlint command not found"
    exit 1
fi

# Test version output
if ! gitlint --version | grep -q "[0-9]"; then
    echo "gitlint version check failed"
    exit 1
fi

echo "gitlint installation test passed!"
exit 0
