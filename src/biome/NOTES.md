## BiomeJS - Fast Formatter and Linter

BiomeJS is a Rust-based toolchain providing a fast formatter and linter for web projects.

### Usage

**Format files:**
```bash
biome format --write ./src
```

**Lint files:**
```bash
biome lint ./src
```

**Format + lint + organize imports:**
```bash
biome check --write ./src
```

### Configuration

Initialize configuration:
```bash
biome init
```

Creates `biome.json` with default settings.

### Supported Languages

JavaScript, TypeScript, JSX, TSX, JSON, CSS, GraphQL

### Documentation

- [Official Website](https://biomejs.dev/)
- [GitHub](https://github.com/biomejs/biome)
- [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=biomejs.biome)
