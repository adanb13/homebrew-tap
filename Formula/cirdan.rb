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
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.5/cirdan-darwin-arm64"
      sha256 "6a26eec2f421bba020e650e3b2a099bc752671826574e9dfd3fce79e7e17f657"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.5/cirdan-linux-arm64"
      sha256 "f73f9dac4057af269cb2baa6b27ab1cfbe43d0c96afaa7132758d69655a8ae3b"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.5/cirdan-linux-x64"
      sha256 "27b3e660c01e5447561683d9902bc9ed665d1d328eedcf5e26887643898c76de"
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
