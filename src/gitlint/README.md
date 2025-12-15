# gitlint via uv (gitlint)

Git commit message linter written in Python, checks your commit messages for style. Installed using [uv](https://docs.astral.sh/uv/).

## Example Usage

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gitlint:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of gitlint to install (e.g., '0.19.1' or 'latest') | string | latest |

## Supply Chain Security

This feature includes SLSA Build Level 2 provenance attestation. Verify authenticity before use:

```bash
gh attestation verify \
  oci://ghcr.io/maloma7/devcontainer-features/gitlint:1 \
  --owner maloma7
```

This proves the feature was built from [maloma7/devcontainer-features](https://github.com/maloma7/devcontainer-features) using GitHub Actions.

For details, see [SECURITY.md](../../SECURITY.md).

## Documentation

For more information, see the [gitlint documentation](https://jorisroovers.github.io/gitlint/).

---

_Note: This file was generated automatically and will be updated by the release workflow._
