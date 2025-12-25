# Homebrew formula for Sendly CLI
# To install: brew install sendly-live/tap/sendly

class Sendly < Formula
  desc "CLI for Sendly SMS API - Send SMS from your terminal"
  homepage "https://sendly.live"
  url "https://registry.npmjs.org/@sendly/cli/-/cli-3.4.0.tgz"
  sha256 "323ddfb6a615e9790facdfac1032adac89587f9d9f7c04d5e6de014d4923b5a8"
  license "MIT"

  depends_on "node" # Requires Node.js >= 18.0.0

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "sendly", shell_output("#{bin}/sendly --version")
  end
end
