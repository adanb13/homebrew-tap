# Homebrew formula TEMPLATE for Cirdan's zero-Python standalone binary.
#
# This is the source of truth for the formula published to the tap repo
# (github.com/adanb13/homebrew-tap as Formula/cirdan.rb), enabling:
#   brew install adanb13/tap/cirdan
#
# The `update-homebrew` job in .github/workflows/release-npm.yml fills the
# version + per-platform sha256 placeholders from the release assets and pushes
# the result to the tap on every release. The placeholder values below are
# sentinels the job rewrites — do not treat them as real.
class Cirdan < Formula
  desc "AI infrastructure cartographer and MCP server"
  homepage "https://github.com/adanb13/cirdan"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.10.0/cirdan-darwin-arm64"
      sha256 "9badb00fb5cb982e76e947ccf50e35a5ac9ee142f5bb3fef22d9ca7293b6a36e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.10.0/cirdan-linux-arm64"
      sha256 "20b9d70d105c40012808cb2cc53bc1783418fa2fc01c59b5410482303cf8367e"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.10.0/cirdan-linux-x64"
      sha256 "ac1957efeb3eb4c734079f1c18caa9f95e3515762adee5c55619fa5ee27802f1"
    end
  end

  def install
    # The downloaded asset is the bare binary named cirdan-<target>.
    bin.install Dir["cirdan-*"].first => "cirdan"
  end

  test do
    assert_match "cirdan", shell_output("#{bin}/cirdan --version")
  end
end
