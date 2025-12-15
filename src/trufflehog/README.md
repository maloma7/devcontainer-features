# TruffleHog (trufflehog)

TruffleHog is a secrets scanner for detecting and verifying leaked credentials in git repos, filesystems, S3, GCS, and more.

## Example Usage

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/trufflehog:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of TruffleHog to install (e.g., '3.91.1' or 'latest') | string | latest |

## Supply Chain Security

This feature includes SLSA Build Level 2 provenance attestation. Verify authenticity before use:

```bash
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/trufflehog:1 \
  --owner maloma7
```

This proves the feature was built from [maloma7/devcontainer-features](https://github.com/maloma7/devcontainer-features) using GitHub Actions.

For details, see [SECURITY.md](../../SECURITY.md).

## Documentation

For more information, see the [TruffleHog documentation](https://docs.trufflesecurity.com/).

---

_Note: This file was generated automatically and will be updated by the release workflow._
