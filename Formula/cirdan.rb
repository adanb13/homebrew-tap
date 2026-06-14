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
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.4/cirdan-darwin-arm64"
      sha256 "d662217ee7ade8523c67150003aba17f6f31612c471794873925c20c169889f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.4/cirdan-linux-arm64"
      sha256 "09f36da22758af707017680d3e36c0aae08eaefa5169846f460d918f7eb2d466"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.4/cirdan-linux-x64"
      sha256 "35d6c6c4db68b20103e761546a661ac18e14717d4580a73b9467f2356e40a41f"
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
