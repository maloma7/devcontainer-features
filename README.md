# Dev Container Features

This repository contains [Dev Container Features](https://containers.dev/implementors/features/), including one that installs the Google Gemini CLI.

## Contents

- `src/gemini-cli`: The Google Gemini CLI feature
- `test`: Automated tests for the feature

## Usage

To use this feature in your devcontainer, add it to your `devcontainer.json` file:

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
}
```

### With Specific Version

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {
        "version": "0.17.1"
    }
}
```

### Recommended Configuration

For best results, explicitly include the Node.js feature:

```json
"features": {
    "ghcr.io/devcontainers/features/node:1": {
        "version": "20"
    },
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
}
```

## Requirements

The feature requires Node.js 18+ (20+ recommended) and will automatically install it if not already present.

## Authentication

After installing, run `gemini` in your terminal and follow the browser authentication flow to connect with your Google account. See the [feature documentation](./src/gemini-cli/NOTES.md) for details on authentication methods.

## Building and Testing

You can build and test the feature using the [dev container CLI](https://github.com/devcontainers/cli):

```bash
# Test the feature
devcontainer features test -f gemini-cli .

# Publish the feature
devcontainer features publish -n maloma7/devcontainer-features .
```

## About Gemini CLI

[Gemini CLI](https://github.com/google-gemini/gemini-cli) is an open-source AI agent from Google that brings the power of Gemini directly into your terminal. It includes:

- Access to Gemini 2.5 Pro with 1M token context window
- Built-in tools (Google Search, file operations, shell commands, web fetching)
- MCP (Model Context Protocol) support
- Extensions ecosystem
- VS Code integration

## License

This project is licensed under the MIT License - see the LICENSE file for details.

Gemini CLI itself is licensed under Apache 2.0.