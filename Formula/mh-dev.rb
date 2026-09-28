class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.2-dev.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.2/mh_0.0.2-dev.2_darwin_arm64.tar.gz"
      sha256 "3152197c1443e9e8d302ae984342067baf6f00731279264deed0819bd0f90f3d"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.2/mh_0.0.2-dev.2_darwin_amd64.tar.gz"
      sha256 "45bb7cd81d733f980592a355e180f50417c29852ed5c1ecec91074e32d652fa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.2/mh_0.0.2-dev.2_linux_arm64.tar.gz"
      sha256 "da313c2a12f0ba712adbfd7f40b2bc4759aff1c546f65b66a8abf5eeaff4d75b"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.2/mh_0.0.2-dev.2_linux_amd64.tar.gz"
      sha256 "27a3cb2b43816827d3cd2f0c471e49c160281150da8fa698dd79868dce351fe9"
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
