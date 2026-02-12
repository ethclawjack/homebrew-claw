class ClawRelay < Formula
  desc "Auto-approve Claude Code operations, save API credits"
  homepage "https://github.com/ethclawjack/claw-claude-code-relay"
  url "https://registry.npmjs.org/claw-claude-code-relay/-/claw-claude-code-relay-1.0.1.tgz"
  sha256 "b1a4a8ed7fed59eefad4765f4b26885c1e0002bb5f646131ed8b6e75fda5c6e9"
  license "MIT"
  
  depends_on "node"
  
  def install
    system "npm", "install", "--prefer-offline", "--no-audit"
    system "npm", "run", "build"
    # Install to libexec (keeps everything together)
    libexec.install Dir["*"]
    # Create a node wrapper script
    (bin/"claw-relay").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/claw-relay" "$@"
    EOS
    (bin/"claw-relay").chmod 0o755
  end
  
  test do
    system bin/"claw-relay", "--help"
  end
end
