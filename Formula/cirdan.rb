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
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.0/cirdan-darwin-arm64"
      sha256 "7d935fce87b03b9dceb3ff89d7e3c1742e387189537714d68ed865b962b5efd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.0/cirdan-linux-arm64"
      sha256 "547425a1f023e25568745cb69f336106a4888dbb7d1c586a62e4609a5d8a63f9"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.11.0/cirdan-linux-x64"
      sha256 "951ea3a96422489bda73cd80405022c59e846c1649c737539f1795598796a707"
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
