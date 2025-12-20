# typed: false
# frozen_string_literal: true

# Homebrew formula for Sendly CLI
# Install: brew install sendly-live/tap/sendly
# Upgrade: brew upgrade sendly

class Sendly < Formula
  desc "CLI for Sendly SMS API - Send SMS messages from your terminal"
  homepage "https://sendly.live"
  url "https://registry.npmjs.org/@sendly/cli/-/cli-1.0.5.tgz"
  sha256 "05c893e2f116de60f2187435f8d7779ca6488b281928091872bf20951651ce28"
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
