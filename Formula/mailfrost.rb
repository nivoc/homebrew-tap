class Mailfrost < Formula
  desc "Maildir integrity tracking, confidence, and backup"
  homepage "https://github.com/nivoc/mailfrost"
  url "https://github.com/nivoc/mailfrost/releases/download/v0.1.9/mailfrost_v0.1.9_macos_apple_silicon.zip"
  sha256 "8922a74a5975e1c9fd61ce3aa6bb92d4f754b9e96df606c47538030181a2098c"
  version "0.1.9"

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
