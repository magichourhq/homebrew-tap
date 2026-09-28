class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.4-dev.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4-dev.1/mh_0.0.4-dev.1_darwin_arm64.tar.gz"
      sha256 "d056c9d25c86a77c0fb6a2c7da98bc299e154d897fbbd6b0c775f73a35e2680c"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4-dev.1/mh_0.0.4-dev.1_darwin_amd64.tar.gz"
      sha256 "4bdf47d2fa3061f987ea720f1a628cf1bd8a389ad29a041a4832b9bade2c36a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4-dev.1/mh_0.0.4-dev.1_linux_arm64.tar.gz"
      sha256 "a540ad72d3c26d07f66c868eeb9bc4b261f88672cd7c532d7876e926fe61cc32"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4-dev.1/mh_0.0.4-dev.1_linux_amd64.tar.gz"
      sha256 "5cde4c124a0140642d781d4cdb959440fbc0dcc850591b723f0661b8e6d976ac"
    end
  end

  def install
    bin.install "mh" => "mh-dev"
    generate_completions_from_executable(bin/"mh-dev", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mh-dev version")
  end
end
