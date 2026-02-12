class ClawRelay < Formula
  desc "Auto-approve Claude Code operations, save API credits"
  homepage "https://github.com/ethclawjack/claw-claude-code-relay"
  url "https://registry.npmjs.org/claw-claude-code-relay/-/claw-claude-code-relay-1.0.1.tgz"
  sha256 "0e8f8c5d8f5c5e5c5d5c5e5c5d5c5e5c5d5c5e5c5d5c5e5c5d5c5e5c5d5c5e5c"
  license "MIT"
  
  depends_on "node"
  
  def install
    system "npm", "install", "-g", "--prefix=#{prefix}", "claw-claude-code-relay"
  end
  
  test do
    system "#{prefix}/bin/claw-relay", "--help"
  end
end
