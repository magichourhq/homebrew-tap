class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.9/mh_0.0.9_darwin_arm64.tar.gz"
      sha256 "2c32f67c7ac03ba5e668c1df9848212d570f4064cb323bf2ad7ca8dd1dff4310"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.9/mh_0.0.9_darwin_amd64.tar.gz"
      sha256 "c8e4f1171413a5764923b08e8b59491aac7c3a215c328f50a2b4a85a8a6e7aab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.9/mh_0.0.9_linux_arm64.tar.gz"
      sha256 "9b9628d75777369bb1883a98ccb94326c32406a7ac112adc30f2bab659124347"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.9/mh_0.0.9_linux_amd64.tar.gz"
      sha256 "7a987d7d8aa28b8429d0a3bb7b7930ffc34dc0a5ebe60142b82cba2860b1d1d3"
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
