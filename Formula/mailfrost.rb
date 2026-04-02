class Mailfrost < Formula
  desc "Maildir integrity tracking, confidence, and backup"
  homepage "https://github.com/nivoc/mailfrost"
  url "https://github.com/nivoc/mailfrost/releases/download/v0.1.12/mailfrost_v0.1.12_macos_apple_silicon.zip"
  sha256 "6c130f6476ff140ffb7524992fa81f459ba81cafb8d5138437f1ba1a1af5aade"
  version "0.1.12"

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
