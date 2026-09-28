class MhDev < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.2-dev.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.3/mh_0.0.2-dev.3_darwin_arm64.tar.gz"
      sha256 "4c5a982743d05ebb00169ccd806c87b6c0d887f01ca89d4b2d1151da752df764"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.3/mh_0.0.2-dev.3_darwin_amd64.tar.gz"
      sha256 "29cd6fb0a43740fcce9806dead993745bc125cf616c8e4699040a084dd60d297"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.3/mh_0.0.2-dev.3_linux_arm64.tar.gz"
      sha256 "5a2384b9b34adeeb589eff5ec9201268bf209f83431558ccba971165d0005912"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2-dev.3/mh_0.0.2-dev.3_linux_amd64.tar.gz"
      sha256 "961506055bf267a2e9b25e8d9dde49aa481aa4b3eec18ad57b156324bcf70d32"
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
