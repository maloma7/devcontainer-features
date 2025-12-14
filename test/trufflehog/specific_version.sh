#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "trufflehog installed" command -v trufflehog
check "trufflehog version matches 3.88.0" trufflehog --version | grep "3.88.0"

# Report results
reportResults
