# Dev Container Features

This repository contains [Dev Container Features](https://containers.dev/implementors/features/) for development tools.

## Contents

- `src/gemini-cli`: Google Gemini CLI - AI agent for your terminal
- `src/biome`: BiomeJS - Fast formatter and linter for JavaScript, TypeScript, JSON, CSS, and more
- `src/trufflehog`: TruffleHog - Secrets scanner for detecting leaked credentials
- `src/gitlint`: gitlint - Git commit message linter
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

### gitlint

Git commit message linter written in Python, checks your commit messages for style.

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gitlint:1": {}
}
```

**With specific version:**
```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gitlint:1": {
        "version": "0.19.1"
    }
}
```

See [gitlint documentation](./src/gitlint/NOTES.md) for usage examples.

## Building and Testing

You can build and test features using the [dev container CLI](https://github.com/devcontainers/cli):

```bash
# Test a specific feature
devcontainer features test -f gemini-cli .
devcontainer features test -f biome .
devcontainer features test -f trufflehog .
devcontainer features test -f gitlint .

# Test all features
devcontainer features test .

# Publish features
devcontainer features publish -n maloma7/devcontainer-features .
```

## Supply Chain Security

All features published from this repository include SLSA Build Level 2 provenance attestations. These attestations provide cryptographic proof of:

- **Source Repository**: Features were built from this GitHub repository
- **Build Process**: Specific GitHub Actions workflow was used
- **Source Code**: Exact commit SHA that was built
- **Build Time**: Timestamp of when features were built
- **Immutable Audit Trail**: Tamper-proof record in Sigstore transparency log

### Verifying Feature Attestations

You can verify a feature's provenance before using it:

```bash
# Install GitHub CLI if not already installed
# https://cli.github.com/

# Verify gemini-cli feature
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/gemini-cli:1 \
  --owner maloma7

# Verify biome feature
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/biome:1 \
  --owner maloma7

# Verify trufflehog feature
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/trufflehog:1 \
  --owner maloma7

# Verify gitlint feature
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/gitlint:1 \
  --owner maloma7
```

Successful verification displays:
- ✓ Verification succeeded!
- Source repository and workflow
- Commit SHA and timestamp
- Attestation ID

### What Attestations Guarantee

**Attestations prove:**
- ✅ Feature was built by GitHub Actions in this repository
- ✅ Feature was built from specific source commit
- ✅ Feature has not been tampered with after build
- ✅ Complete build provenance is auditable

**Attestations do NOT guarantee:**
- ❌ Code quality or absence of vulnerabilities
- ❌ Security of underlying tools installed by features
- ❌ Runtime behavior of installed tools

For security issues, see [SECURITY.md](SECURITY.md).

## License

This project is licensed under the MIT License - see the LICENSE file for details.

### Upstream Licenses

- Gemini CLI: Apache 2.0
- BiomeJS: MIT
- TruffleHog: AGPL 3.0
- gitlint: MIT