## TruffleHog - Secrets Scanner

TruffleHog is a secrets scanner for detecting and verifying leaked credentials. It supports scanning git repositories, filesystems, S3 buckets, GCS, and more.

### Usage Examples

**Scan a local git repository:**
```bash
trufflehog git file://.
```

**Scan a remote GitHub repository:**
```bash
trufflehog github --repo https://github.com/trufflesecurity/test_keys
```

**Scan the filesystem:**
```bash
trufflehog filesystem /path/to/scan
```

**Scan with only verified secrets (reduces false positives):**
```bash
trufflehog git file://. --only-verified
```

### Pre-commit Hook Integration

Add TruffleHog to your pre-commit hooks by adding to `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/trufflesecurity/trufflehog
    rev: main
    hooks:
      - id: trufflehog
```

### Documentation

- [TruffleHog GitHub Repository](https://github.com/trufflesecurity/trufflehog)
- [TruffleHog Documentation](https://docs.trufflesecurity.com/)
- [Truffle Security](https://trufflesecurity.com/)
