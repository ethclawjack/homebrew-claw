class ClawRelay < Formula
  desc "Auto-approve Claude Code operations, save API credits"
  homepage "https://github.com/ethclawjack/claw-claude-code-relay"
  url "https://github.com/ethclawjack/claw-claude-code-relay/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  
  depends_on "node"
  
  def install
    system "npm", "install", "--prefer-offline", "--no-audit"
    system "npm", "run", "build"
    libexec.install "bin", "dist", "node_modules", "package.json"
    
    (bin/"claw-relay").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/claw-relay" "$@"
    EOS
    bin.chmod_R 0o755
  end
  
  test do
    system bin/"claw-relay", "--help"
  end
end
