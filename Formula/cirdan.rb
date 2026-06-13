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
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.3/cirdan-darwin-arm64"
      sha256 "5d6902148a0eb4813fdfe47af7a88bf8ad8eb4ac5f8df8bc5613eedd4a473219"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.3/cirdan-linux-arm64"
      sha256 "e428ca7ada2f9fa9bc950388ba53efcba1725e11de197cc548f9a9434f7fbc0b"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.3/cirdan-linux-x64"
      sha256 "c5430dac9080ecea2e2ff62031933e2e9d857a474c3c1d7e4aa2b389308cdf9e"
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
