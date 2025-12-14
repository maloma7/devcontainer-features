# Dev Container Features

This repository contains [Dev Container Features](https://containers.dev/implementors/features/) for development tools.

## Contents

- `src/gemini-cli`: Google Gemini CLI - AI agent for your terminal
- `src/biome`: BiomeJS - Fast formatter and linter for JavaScript, TypeScript, JSON, CSS, and more
- `src/trufflehog`: TruffleHog - Secrets scanner for detecting leaked credentials
- `test`: Automated tests for all features

## Features

### Gemini CLI

Google Gemini CLI - AI agent for your terminal with 1M token context window.

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
}
```

**With specific version:**
```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {
        "version": "0.17.1"
    }
}
```

**Requirements:** Node.js 18+ (automatically installed if not present)

See [Gemini CLI documentation](./src/gemini-cli/NOTES.md) for authentication and usage.

### BiomeJS

Fast formatter and linter for JavaScript, TypeScript, JSX, JSON, CSS, and more.

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/biome:1": {}
}
```

**With specific version:**
```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/biome:1": {
        "version": "2.3.8"
    }
}
```

See [BiomeJS documentation](./src/biome/NOTES.md) for usage examples.

### TruffleHog

Secrets scanner for detecting and verifying leaked credentials.

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/trufflehog:1": {}
}
```

**With specific version:**
```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/trufflehog:1": {
        "version": "3.87.0"
    }
}
```

See [TruffleHog documentation](./src/trufflehog/NOTES.md) for usage examples.

## Building and Testing

You can build and test features using the [dev container CLI](https://github.com/devcontainers/cli):

```bash
# Test a specific feature
devcontainer features test -f gemini-cli .
devcontainer features test -f biome .
devcontainer features test -f trufflehog .

# Test all features
devcontainer features test .

# Publish features
devcontainer features publish -n maloma7/devcontainer-features .
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

### Upstream Licenses

- Gemini CLI: Apache 2.0
- BiomeJS: MIT
- TruffleHog: AGPL 3.0