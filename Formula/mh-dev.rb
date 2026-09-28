class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.3-dev.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.4/mh_0.0.3-dev.4_darwin_arm64.tar.gz"
      sha256 "942c01969c153f49e95d13cbea4833975f6f8693731605728368e82e5630504d"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.4/mh_0.0.3-dev.4_darwin_amd64.tar.gz"
      sha256 "03319fee2ebef9bd508fd375f3411aeec7f8d2813dbcb57dc06c3feea44db3a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.4/mh_0.0.3-dev.4_linux_arm64.tar.gz"
      sha256 "b75aea474fea94bd9fdfe495adade4cf89ec310354e981027b46bbfc7ff43b95"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.4/mh_0.0.3-dev.4_linux_amd64.tar.gz"
      sha256 "3b8079053113006e439f13663b294a7a3796ba240176a72692a55fa4937e1bf7"
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
