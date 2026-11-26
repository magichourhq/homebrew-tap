class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.13/mh_0.0.13_darwin_arm64.tar.gz"
      sha256 "6d172665899202aba7f1fe66c461ae2cb4d6f0f0bb7ed2b6f5955808e5db0c62"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.13/mh_0.0.13_darwin_amd64.tar.gz"
      sha256 "4426a60d0c7e28ea9e38941b5b0b98126aae9d6f7d166e510c66c086885668c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.13/mh_0.0.13_linux_arm64.tar.gz"
      sha256 "55e615aaac950be31d5f6f920306b8a6bea0b6632c309fd585bc734f5d3c3895"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.13/mh_0.0.13_linux_amd64.tar.gz"
      sha256 "f27a1af73b4e1246637344aea666c309c09a4081f245f0f858175c1e2d08bed3"
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
