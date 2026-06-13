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
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.2/cirdan-darwin-arm64"
      sha256 "32ca305ec0c167589c04a56cd4e1fae5217ca8c18303fbcc8ad694f60d5077f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.2/cirdan-linux-arm64"
      sha256 "8f358252bd2f09569202e369aeae27aabf36553c412ec146c0dcfc3c3039cf05"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.2/cirdan-linux-x64"
      sha256 "263c196167b8d6ccd2ae1a7d51221097f0eeda70870ea94b01746112e04bf24e"
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
