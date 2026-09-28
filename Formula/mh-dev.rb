class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.3-dev.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.2/mh_0.0.3-dev.2_darwin_arm64.tar.gz"
      sha256 "6c7e7d32da0613076e5e8551de9a33119c0606f5a050da17448ce60102a7c02a"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.2/mh_0.0.3-dev.2_darwin_amd64.tar.gz"
      sha256 "c6b3c437471821e977f074c7483a48bf07ebfe469b1a5723fa6f52a582059632"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.2/mh_0.0.3-dev.2_linux_arm64.tar.gz"
      sha256 "080bc677661aff3a17973aa19fb5e255b9c2fbe6caba6140301ea32639e210b5"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.2/mh_0.0.3-dev.2_linux_amd64.tar.gz"
      sha256 "bd73fd585fed7c8f3bca6ccbdcecd17af78f500168f1713218f9047c5ac7cd64"
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
