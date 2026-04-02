class Mailfrost < Formula
  desc "Maildir integrity tracking, confidence, and backup"
  homepage "https://github.com/nivoc/mailfrost"
  url "https://github.com/nivoc/mailfrost/releases/download/v0.1.8/mailfrost_v0.1.8_macos_apple_silicon.zip"
  sha256 "e635a149ef1fbcea2ee8dacb169ea059d04ebe09d2fa81d3cf86bd6aca2dbd35"
  version "0.1.8"

  depends_on arch: :arm64

  def install
    odie "Mailfrost is currently packaged only for macOS Apple Silicon." unless OS.mac? && Hardware::CPU.arm?

    bin.install "mailfrost"
    prefix.install "README.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mailfrost version")
  end
end
