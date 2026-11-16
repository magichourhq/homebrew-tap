class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.10/mh_0.0.10_darwin_arm64.tar.gz"
      sha256 "507df201f70a2438cf04a08ea1bbb8725fd944c6bfd46bf388533c02e589ff13"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.10/mh_0.0.10_darwin_amd64.tar.gz"
      sha256 "509d0af00aa1dd401f63eafc8ea3674ad7b4ae9fd494e5bb7f2bcd0eacea8e99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.10/mh_0.0.10_linux_arm64.tar.gz"
      sha256 "4bc14f721a89dcadf9c41f76a0cc7ebd09bb5f63fa6fa66453a39bf8895806fb"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.10/mh_0.0.10_linux_amd64.tar.gz"
      sha256 "15b3f27cd6429ff6bc65ffaf3b211564a3f107d54358b9035c491ee923f5c81a"
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
