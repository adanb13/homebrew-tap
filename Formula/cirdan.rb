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
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.9.0/cirdan-darwin-arm64"
      sha256 "aa534bed96b4c99707d91776ff78fa797a326f6a96c5d9aa37fa82d0c4d39592"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.9.0/cirdan-linux-arm64"
      sha256 "6e50e7fbe6617144125f64425a9a01d9c5d32b0d68f7bb28ae6f1f7eef3f8b8f"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.9.0/cirdan-linux-x64"
      sha256 "e46e0a9e5b3485a2199cad2d3250caf5e465fb81429c922145976d4f243b55b1"
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
