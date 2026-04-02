class Mailfrost < Formula
  desc "Maildir integrity tracking, confidence, and backup"
  homepage "https://github.com/nivoc/mailfrost"
  url "https://github.com/nivoc/mailfrost/releases/download/v0.1.7/mailfrost_v0.1.7_macos_apple_silicon.zip"
  sha256 "bd1d729a1e8ad4798d69233a2e43254a0f8e216290eb42b47d57512a5b18a1f5"
  version "0.1.7"

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
