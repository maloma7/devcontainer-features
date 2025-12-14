#!/bin/sh
set -eu

echo "Activating feature 'biome'"

# 1. Install dependencies (apt or apk)
if command -v apt-get >/dev/null 2>&1; then
    apt-get update && apt-get install -y curl ca-certificates
elif command -v apk >/dev/null 2>&1; then
    apk add --no-cache curl ca-certificates
else
    echo "WARNING: Unknown package manager. Assuming curl is available."
fi

# 2. Detect OS
detect_os() {
    case "$(uname -s)" in
        Linux*)  echo "linux" ;;
        Darwin*) echo "darwin" ;;
        *)       echo "unsupported" ;;
    esac
}

# 3. Detect architecture
detect_arch() {
    case "$(uname -m)" in
        x86_64|amd64)   echo "x64" ;;
        aarch64|arm64)  echo "arm64" ;;
        *)              echo "unsupported" ;;
    esac
}

# 4. Detect musl libc (Alpine Linux, etc.)
detect_musl() {
    # Alpine detection via apk
    if command -v apk >/dev/null 2>&1; then
        echo "true"
        return
    fi
    # Musl library check
    if [ -f /lib/ld-musl-x86_64.so.1 ] || [ -f /lib/ld-musl-aarch64.so.1 ]; then
        echo "true"
        return
    fi
    echo "false"
}

# 5. Get latest version from GitHub
get_latest_version() {
    # Try GitHub API
    VERSION_TAG=$(curl -fsSL "https://api.github.com/repos/biomejs/biome/releases/latest" 2>/dev/null | \
        grep '"tag_name"' | sed -E 's/.*"@biomejs\/biome@([^"]+)".*/\1/' || true)

    if [ -n "$VERSION_TAG" ]; then
        echo "$VERSION_TAG"
        return 0
    fi

    # Fallback: follow redirect
    VERSION_TAG=$(curl -fsSLI -o /dev/null -w '%{url_effective}' \
        "https://github.com/biomejs/biome/releases/latest" 2>/dev/null | \
        sed -E 's|.*/tag/@biomejs/biome@||' || true)

    if [ -n "$VERSION_TAG" ]; then
        echo "$VERSION_TAG"
        return 0
    fi

    echo "ERROR: Could not determine latest BiomeJS version" >&2
    return 1
}

# 6. Main logic
OS=$(detect_os)
ARCH=$(detect_arch)
IS_MUSL=$(detect_musl)

echo "Detected: OS=$OS, ARCH=$ARCH, MUSL=$IS_MUSL"

if [ "$OS" = "unsupported" ] || [ "$ARCH" = "unsupported" ]; then
    echo "ERROR: Unsupported platform: $(uname -s) $(uname -m)"
    exit 1
fi

# Build platform string
PLATFORM="${OS}-${ARCH}"
if [ "$OS" = "linux" ] && [ "$IS_MUSL" = "true" ]; then
    PLATFORM="${PLATFORM}-musl"
fi

# Get version
VERSION="${VERSION:-latest}"
if [ "$VERSION" = "latest" ]; then
    echo "Fetching latest BiomeJS version..."
    VERSION=$(get_latest_version)
fi

echo "Installing BiomeJS version $VERSION for $PLATFORM..."

# Download binary
DOWNLOAD_URL="https://github.com/biomejs/biome/releases/download/@biomejs/biome@${VERSION}/biome-${PLATFORM}"
INSTALL_PATH="/usr/local/bin/biome"

if ! curl -fsSL "$DOWNLOAD_URL" -o "$INSTALL_PATH"; then
    echo "ERROR: Failed to download BiomeJS from $DOWNLOAD_URL"
    exit 1
fi

chmod +x "$INSTALL_PATH"

# Verify
echo "BiomeJS installed successfully!"
biome --version
