#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "node version" node --version
check "npm version" npm --version
check "gemini cli installed" command -v gemini
check "gemini version" gemini --version

# Report results
reportResults