# Security Policy

## Reporting Security Vulnerabilities

If you discover a security vulnerability in this repository, please report it via [GitHub Security Advisories](https://github.com/maloma7/devcontainer-features/security/advisories/new).

**Please do not report security vulnerabilities through public GitHub issues.**

We will respond to security reports within 48 hours.

## Supply Chain Security

### SLSA Provenance Attestations

All features published from this repository include SLSA Build Level 2 provenance attestations:

- **What**: Cryptographic proof linking features to their build process
- **How**: GitHub Actions with Sigstore keyless signing
- **Verification**: `gh attestation verify oci://ghcr.io/maloma7/devcontainer-features/<feature>:1 --owner maloma7`

### Verification Best Practices

**Before using a feature:**

1. Verify the attestation:
   ```bash
   gh attestation verify \
     oci://ghcr.io/maloma7/devcontainer-features/<feature>:1 \
     --owner maloma7
   ```

2. Check the commit SHA matches expected source
3. Review the feature's install script: `src/<feature>/install.sh`

**For organizations with strict security policies:**

Consider implementing automated verification in your CI/CD pipeline before devcontainer builds.

### What Attestations Cover

Attestations prove **build integrity** (artifact was built from this repository's workflow). They do NOT:

- Validate code quality or security
- Scan for vulnerabilities
- Guarantee safe runtime behavior
- Verify transitive dependencies

### Security Model

**Threat Model:**

Features run as **root** during devcontainer build and can:
- Install system packages
- Modify filesystem
- Download external binaries
- Execute arbitrary commands

**Mitigations:**

1. **Source Code Review**: All feature code is public and reviewable
2. **Attestations**: Prove features were built from this repository
3. **Lockfiles**: Devcontainer lockfiles pin features to specific digests
4. **Audit Trail**: All releases logged in git history

### Supported Versions

We provide security updates for:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Known Limitations

1. **Dynamic Downloads**: Feature install scripts download tools from external sources. We do not attest to these downloaded binaries.
2. **No SBOM**: Software Bill of Materials not currently generated.
3. **Dev-time Only**: These are development environment features, not production runtime dependencies.

## Security Update Process

1. Security issues reported via Security Advisories
2. Fix developed and tested in private fork
3. Security patch released with updated version
4. New attestations automatically generated
5. Security advisory published with details

## Additional Resources

- [SLSA Framework](https://slsa.dev/)
- [GitHub Artifact Attestations](https://docs.github.com/en/actions/security-guides/using-artifact-attestations)
- [Sigstore Project](https://www.sigstore.dev/)
