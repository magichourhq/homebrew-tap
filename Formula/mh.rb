class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.8/mh_0.0.8_darwin_arm64.tar.gz"
      sha256 "468b6d52b7ac83e67c3e0a2c21891ed17ac5e84546054c207cd0f9344d3b0b1f"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.8/mh_0.0.8_darwin_amd64.tar.gz"
      sha256 "2068a20b320e9d0f713a31ff7efb2882e7622152c2dae3216bb58b6fafad0d75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.8/mh_0.0.8_linux_arm64.tar.gz"
      sha256 "b8f9079cd0329a6ebe0e0225f6913ac58d234544db3780ac82271e0efe369db2"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.8/mh_0.0.8_linux_amd64.tar.gz"
      sha256 "adec213c784c694a4ad3f823ba76ffb215e1b2106d1ebdaa46cbf62aa0a57cf7"
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
