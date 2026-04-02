class Mailfrost < Formula
  desc "Maildir integrity tracking, confidence, and backup"
  homepage "https://github.com/nivoc/mailfrost"
  url "https://github.com/nivoc/mailfrost/releases/download/v0.1.10/mailfrost_v0.1.10_macos_apple_silicon.zip"
  sha256 "092878ab2e141e6e089420eeb930a290ff9988405352bc8b2ee1a0773f45ba7a"
  version "0.1.10"

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
