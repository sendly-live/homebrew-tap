# typed: false
# frozen_string_literal: true

# Homebrew formula for Sendly CLI
# Install: brew install sendly-live/tap/sendly
# Upgrade: brew upgrade sendly

class Sendly < Formula
  desc "CLI for Sendly SMS API - Send SMS messages from your terminal"
  homepage "https://sendly.live"
  url "https://registry.npmjs.org/@sendly/cli/-/cli-1.0.8.tgz"
  sha256 "6ff7d0fbae8c66f7d89f72a501aec214fb69a762b04d18c0a14544b5b64dd0f2"
  license "MIT"
  head "https://github.com/sendly-live/sendly-cli.git", branch: "main"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    
    # Generate shell completions
    generate_completions_from_executable(bin/"sendly", "autocomplete", "--script", shells: [:bash, :zsh])
  end

  def caveats
    <<~EOS
      To get started with Sendly CLI:
        sendly login        # Authenticate with your account
        sendly sms send     # Send your first SMS
        sendly --help       # See all commands

      Documentation: https://sendly.live/docs/cli
    EOS
  end

  test do
    assert_match "sendly", shell_output("#{bin}/sendly --version")
    assert_match "COMMANDS", shell_output("#{bin}/sendly --help")
  end
end
