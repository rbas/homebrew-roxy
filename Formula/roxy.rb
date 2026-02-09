class Roxy < Formula
  desc "Local development proxy with custom .roxy domains and automatic HTTPS"
  homepage "https://github.com/rbas/roxy"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rbas/roxy/releases/download/v#{version}/roxy-#{version}-macos-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "roxy"
  end

  test do
    system "#{bin}/roxy", "--version"
  end
end
