class Roxy < Formula
  desc "Local development proxy with custom .roxy domains and automatic HTTPS"
  homepage "https://github.com/rbas/roxy"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rbas/roxy/releases/download/v0.3.0/roxy-0.3.0-macos-arm64.tar.gz"
      sha256 "6a3c3382783bf8e7688f8698ca830f7e7673fe7f91d0274a07468698f2c26f2c"
    else
      odie "Roxy currently only supports Apple Silicon (ARM64). Intel Macs are not yet supported."
    end
  end

  def install
    bin.install "roxy"
  end

  service do
    name macos: "cz.rbas.roxy"
    run [opt_bin/"roxy", "--config", "/etc/roxy/config.toml", "start", "--foreground"]
    keep_alive true
    require_root true
    log_path "/var/log/roxy/roxy.log"
    error_log_path "/var/log/roxy/roxy.log"
  end

  def caveats
    <<~EOS
      Roxy requires a one-time setup before use:
        sudo roxy install

      To start roxy now and auto-start at boot:
        sudo brew services start roxy
    EOS
  end

  test do
    system "#{bin}/roxy", "--version"
  end
end
