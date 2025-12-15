## gitlint - Git Commit Message Linter

gitlint checks your commit messages for style and conventions.

### Usage

**Lint most recent commit:**
```bash
gitlint
```

**Lint specific commit range:**
```bash
gitlint --commits HEAD~3..HEAD
```

**Lint from stdin (for pre-commit hooks):**
```bash
git log -1 --pretty=%B | gitlint
```

**Install as git commit-msg hook:**
```bash
gitlint install-hook
```

### Configuration

Create `.gitlint` file in repository root:

```ini
[general]
ignore=body-is-missing
contrib=contrib-title-conventional-commits

[title-max-length]
line-length=72

[title-min-length]
min-length=5
```

### Pre-commit Integration

Add to `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/jorisroovers/gitlint
    rev: v0.19.1
    hooks:
      - id: gitlint
```

### Documentation

- [Official Documentation](https://jorisroovers.github.io/gitlint/)
- [GitHub Repository](https://github.com/jorisroovers/gitlint)
- [Configuration Reference](https://jorisroovers.github.io/gitlint/configuration/)
