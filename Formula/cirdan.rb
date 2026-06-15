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
  version "0.8.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.6/cirdan-darwin-arm64"
      sha256 "958506d5c9223e7f6ac9695a5b4fcac5b6de3bed454883b7895d1372fed2b4b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.6/cirdan-linux-arm64"
      sha256 "764f73efd5b3ea9951d625252d79045b50024cf07615e4d4832b1bb7da38c3da"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.6/cirdan-linux-x64"
      sha256 "59d19e0867ff6b9582f05eade2283ca47a3f41bee19c23caf1ae91467ff4a860"
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
