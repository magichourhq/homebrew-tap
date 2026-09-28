class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.3-dev.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.3/mh_0.0.3-dev.3_darwin_arm64.tar.gz"
      sha256 "86197eb7f0a5fcef8eee9a16ff53d42a85219d2cca3e82c9e28019f1b15ade17"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.3/mh_0.0.3-dev.3_darwin_amd64.tar.gz"
      sha256 "da7d1cbae729d8d0efb7f823d5a642741050a9a53e73f9da51b4d8318035b5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.3/mh_0.0.3-dev.3_linux_arm64.tar.gz"
      sha256 "4def719ba1057a8e84092f12696bb8b6b6626416dc415dcc21d7caabc058424a"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.3-dev.3/mh_0.0.3-dev.3_linux_amd64.tar.gz"
      sha256 "d429446c53bd4c83fe4c14399b1ca2b3f0a28a65018f033eec660df9cd37ba03"
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
