#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "gitlint installed" command -v gitlint
check "gitlint version" gitlint --version

# Report results
reportResults
