#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "trufflehog installed" command -v trufflehog
check "trufflehog version" trufflehog --version

# Report results
reportResults
