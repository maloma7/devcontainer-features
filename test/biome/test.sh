#!/bin/bash
set -e

# Optional: Import test library
source dev-container-features-test-lib

# Feature-specific tests
check "biome installed" command -v biome
check "biome version" biome --version

# Report results
reportResults
