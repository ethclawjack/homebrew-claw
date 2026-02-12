class ClawRelay < Formula
  desc "Auto-approve Claude Code operations, save API credits"
  homepage "https://github.com/ethclawjack/claw-claude-code-relay"
  url "https://registry.npmjs.org/claw-claude-code-relay/-/claw-claude-code-relay-1.0.1.tgz"
  sha256 "b1a4a8ed7fed59eefad4765f4b26885c1e0002bb5f646131ed8b6e75fda5c6e9"
  license "MIT"
  
  depends_on "node"
  
  def install
    system "npm", "install", "--prefer-offline", "--no-audit"
    bin.install "bin/claw-relay"
  end
  
  test do
    system bin/"claw-relay", "--help"
  end
end
