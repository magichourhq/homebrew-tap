class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.3-dev.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.1/mh_0.0.3-dev.1_darwin_arm64.tar.gz"
      sha256 "531f5fce326a92d140569fe31ec29208b9d4d0d4c10d43288231366ee1662c08"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.1/mh_0.0.3-dev.1_darwin_amd64.tar.gz"
      sha256 "647f0aba850f920a318caf355d4fb544f2272dd954bb19e3074fd8f295cdce48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.1/mh_0.0.3-dev.1_linux_arm64.tar.gz"
      sha256 "b283479a951d62faa815cca2a9a1250aacf7d69b20ee666e099ca6a0278325fc"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.1/mh_0.0.3-dev.1_linux_amd64.tar.gz"
      sha256 "0691688f026285214d3216714f9e8f5d86d97ebfd101d4af93f0a593e29a4af6"
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
