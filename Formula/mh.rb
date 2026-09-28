class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3/mh_0.0.3_darwin_arm64.tar.gz"
      sha256 "9ae0b703397d247e404ddd0898fb8a5a11b1e5f30b3375d5b2b9ca1a8df74b96"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3/mh_0.0.3_darwin_amd64.tar.gz"
      sha256 "9cd0e118d6fefedd65db198f5202b100bc70197404173a44c6c92a3981c6456e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3/mh_0.0.3_linux_arm64.tar.gz"
      sha256 "ad4b30b2c0f34aba2551cbe93ebae666ca98935475f9217bc923efd96472ea71"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3/mh_0.0.3_linux_amd64.tar.gz"
      sha256 "03d0c07309fc4ca0f816e7caccd249d63e94966399edf7ea358d0b209498bf59"
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
