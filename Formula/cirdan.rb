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
  version "0.8.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.7/cirdan-darwin-arm64"
      sha256 "eaa97459fd93191aceac15480defab14f44364fef7a6acafca6fb00745df2af6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.7/cirdan-linux-arm64"
      sha256 "cba6f5e044b75959d6d5343a4f49bd5848e43482fad68bfab4c02296a77cac6e"
    end
    on_intel do
      url "https://github.com/adanb13/cirdan/releases/download/v0.8.7/cirdan-linux-x64"
      sha256 "3838aa7d92bbe6abccf57cf5cb5717e50aeb469fbb2512f7ece60581487655a2"
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
