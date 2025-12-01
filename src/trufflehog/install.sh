#!/bin/sh
set -eu

echo "Activating feature 'trufflehog'"

# 1. Install dependencies via apt-get
apt-get update && apt-get install -y curl ca-certificates

# 2. Get version from option (default: latest)
VERSION="${VERSION:-latest}"

# 3. Build version argument for install script
if [ "$VERSION" = "latest" ]; then
    VERSION_ARG=""
else
    # Ensure version has 'v' prefix for the install script
    case "$VERSION" in
        v*) VERSION_ARG="$VERSION" ;;
        *)  VERSION_ARG="v$VERSION" ;;
    esac
fi

# 4. Run official TruffleHog install script
# -b: install to /usr/local/bin
# Script includes SHA256 checksum verification
echo "Installing TruffleHog${VERSION_ARG:+ version $VERSION_ARG}..."
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin $VERSION_ARG

# 5. Verify installation
echo "TruffleHog installed successfully!"
trufflehog --version
