#!/bin/sh
set -eu

echo "Activating feature 'gitlint'"

# 1. Install dependencies (apt or apk)
if command -v apt-get >/dev/null 2>&1; then
    apt-get update && apt-get install -y curl ca-certificates
elif command -v apk >/dev/null 2>&1; then
    apk add --no-cache curl ca-certificates
fi

# 2. Install uv if not already present
if ! command -v uv >/dev/null 2>&1; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="/root/.local/bin:$PATH"
fi

# 3. Configure uv for system-wide tool installation
export UV_TOOL_BIN_DIR="/usr/local/bin"
export UV_TOOL_DIR="/usr/local/share/uv-tools"

# 4. Install gitlint via uv
VERSION="${VERSION:-latest}"
echo "Installing gitlint${VERSION:+ version $VERSION}..."

if [ "$VERSION" = "latest" ]; then
    uv tool install gitlint
else
    uv tool install "gitlint==$VERSION"
fi

# 5. Verify installation
echo "gitlint installed successfully!"
gitlint --version
