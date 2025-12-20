# Sendly Homebrew Tap

Official [Homebrew](https://brew.sh) tap for [Sendly](https://sendly.live) CLI.

## Installation

```bash
# Add the tap
brew tap sendly-live/tap

# Install Sendly CLI
brew install sendly
```

Or install directly:

```bash
brew install sendly-live/tap/sendly
```

## Upgrade

```bash
brew upgrade sendly
```

## Usage

```bash
# Authenticate
sendly login

# Send an SMS
sendly sms send --to "+15551234567" --message "Hello from Sendly!"

# Check your balance
sendly credits balance

# See all commands
sendly --help
```

## Documentation

- [CLI Documentation](https://sendly.live/docs/cli)
- [API Reference](https://sendly.live/docs)
- [GitHub Repository](https://github.com/sendly-live/sendly)

## Other Installation Methods

### npm (recommended for Node.js users)

```bash
npm install -g @sendly/cli
```

### From source

```bash
git clone https://github.com/sendly-live/sendly-cli.git
cd sendly-cli
npm install
npm link
```

## License

MIT - see [LICENSE](https://github.com/sendly-live/sendly/blob/main/LICENSE)
