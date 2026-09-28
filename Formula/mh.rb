class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4/mh_0.0.4_darwin_arm64.tar.gz"
      sha256 "f91419ce5dd72371ca0853d47266a7c700d467e9e0f7ef82a3f2715313952704"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4/mh_0.0.4_darwin_amd64.tar.gz"
      sha256 "9025647b15724aa12bb923ed529abc26e5941e472dcffba4a31e11f4961c133f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4/mh_0.0.4_linux_arm64.tar.gz"
      sha256 "c4154a9b408ad2af0a57f4cf92e7b401f342fcb1b014dec728e014d5e26fefb3"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.4/mh_0.0.4_linux_amd64.tar.gz"
      sha256 "e3fa3f129fc04bf5cb602946f0b2c3f0849faca7497f4a3a16efbc7cea1ccaf2"
    end
  end

  def install
    bin.install "mh" => "mh"
    generate_completions_from_executable(bin/"mh", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mh version")
  end
end
