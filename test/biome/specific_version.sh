#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "biome installed" command -v biome
check "biome version matches 2.3.8" biome --version | grep "2.3.8"

# Report results
reportResults
