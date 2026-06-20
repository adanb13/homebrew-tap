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
  version "0.11.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.1/cirdan-darwin-arm64"
      sha256 "571e7c846219d37dcc0c4331ed0affd590d3a532258dfbd6f1d945742d0a0f65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.1/cirdan-linux-arm64"
      sha256 "ffe51096b3a930254e293efa9e00ce034c409d46baa2b0d71ba5917731572f54"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.1/cirdan-linux-x64"
      sha256 "1c10d1ee926e24a656edc6321f87da94d129f769869a5cfcc8b0c9bdb5099049"
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
