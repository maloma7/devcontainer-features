
# Google Gemini CLI (gemini-cli)

Installs the Google Gemini CLI globally

## Example Usage

```json
"features": {
    "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Specific version of Gemini CLI to install (e.g., '0.17.1' or 'latest') | string | latest |

## Customizations

### VS Code Extensions

- `Google.gemini-cli-vscode-ide-companion`

# Google Gemini CLI

This feature installs the [Google Gemini CLI](https://github.com/google-gemini/gemini-cli), an open-source AI agent that brings the power of Gemini directly into your terminal.

## Requirements

Gemini CLI requires Node.js 18 or higher (20+ recommended). This feature will automatically install Node.js if not present, or you can explicitly include the Node.js feature for better control.

## Authentication

Gemini CLI requires authentication with Google. Two methods are supported:

### Method 1: Google Account (Free Tier - Recommended)

On first run, execute `gemini` in your terminal and follow the browser authentication flow. This grants you:
- 60 requests per minute
- 1,000 requests per day
- Access to Gemini 2.5 Pro with 1M token context window

### Method 2: API Key (Paid Tier)

For paid API access with higher limits, set the API key as an environment variable:

```json
{
    "remoteEnv": {
        "GOOGLE_API_KEY": "${localEnv:GOOGLE_API_KEY}"
    }
}
```

Store your API key in your local `.bashrc` or `.zshrc`:
```bash
export GOOGLE_API_KEY="your-api-key-here"
```

## Usage Patterns

### Pattern 1: With Explicit Node.js Feature (Recommended)

```json
{
    "features": {
        "ghcr.io/devcontainers/features/node:1": {
            "version": "20"
        },
        "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
    }
}
```

This approach gives you full control over the Node.js version and ensures consistent behavior.

### Pattern 2: With Auto-Install

```json
{
    "features": {
        "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {}
    }
}
```

Node.js 20.x will be automatically installed if not present.

### Pattern 3: With Specific Gemini CLI Version

```json
{
    "features": {
        "ghcr.io/maloma7/devcontainer-features/gemini-cli:1": {
            "version": "0.17.1"
        }
    }
}
```

Pin to a specific version for reproducibility. Use `"version": "latest"` (default) for the newest release.

## Advanced Features

Gemini CLI includes powerful built-in capabilities:

### Built-in Tools
- **Google Search grounding**: Access real-time search results
- **File operations**: Read, write, and edit files
- **Shell commands**: Execute terminal commands
- **Web fetching**: Retrieve web content

### Extensibility
- **MCP (Model Context Protocol)**: Add custom integrations
- **Extensions ecosystem**: Access integrations from Google, Dynatrace, Elastic, Figma, Shopify, Stripe, and more
- **Custom commands**: Define your own slash commands
- **Context files**: Create `GEMINI.md` in your workspace for project-specific context

### Session Management
- **Checkpointing**: Save and resume conversations
- **Interactive commands**: Run vim, top, or interactive git rebase directly

### IDE Integration

The included VS Code extension (`Google.gemini-cli-vscode-ide-companion`) provides:
- Deep workspace context (10 most recently accessed files)
- Active cursor position and selected text awareness
- Native diff viewer for suggested changes
- Integrated terminal experience

You can also install it manually with `/ide install` in the terminal.

## Example Workflow

After your devcontainer starts:

```bash
# First time: Authenticate
gemini

# Follow browser OAuth flow, then use Gemini CLI:
gemini "Analyze the code in src/ and suggest improvements"

# With file context
gemini "Refactor this function" --files src/main.js

# Interactive mode with checkpointing
gemini --checkpoint my-session
```

## Compatibility Notes

- **nvm users**: If you use nvm (Node Version Manager), ensure nvm is initialized before this feature runs, or install Node.js explicitly via the Node.js feature
- **Alpine Linux**: Uses Node.js from Alpine's package repository (may be an older version)
- **Older distros**: NodeSource repositories support Node.js 20.x on most modern distributions

## Resources

- [Official Documentation](https://developers.google.com/gemini-code-assist/docs/gemini-cli)
- [GitHub Repository](https://github.com/google-gemini/gemini-cli)
- [Hands-on Codelab](https://codelabs.developers.google.com/gemini-cli-hands-on)
- [npm Package](https://www.npmjs.com/package/@google/gemini-cli)

## License

Gemini CLI is licensed under Apache 2.0. This devcontainer feature is MIT licensed.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/maloma7/devcontainer-features/blob/main/src/gemini-cli/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
