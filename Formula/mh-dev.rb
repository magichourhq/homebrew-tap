class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.2-dev.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.1/mh_0.0.2-dev.1_darwin_arm64.tar.gz"
      sha256 "0a2144a92ab5ab87afb91516f586a2351e0899a0970aed134be31c83f181ca01"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.1/mh_0.0.2-dev.1_darwin_amd64.tar.gz"
      sha256 "c360f80cacf81da5dc7fade3d3845c0bd6489a65500906fb9f0f8f69b1bdc99b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.1/mh_0.0.2-dev.1_linux_arm64.tar.gz"
      sha256 "6897f151a847f24e1fa226739bc44eccd7a8dea2aa9da4b52b54b125ce4d0369"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.1/mh_0.0.2-dev.1_linux_amd64.tar.gz"
      sha256 "238171ba0d52551c1dd2b3293ce576e60da21692535966f9c172f8c7f4b289d3"
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
