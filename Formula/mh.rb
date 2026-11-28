class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.14/mh_0.0.14_darwin_arm64.tar.gz"
      sha256 "4867f14898c9f9dc8866952ff58493acd5e680a6b7af5e33f1c5a88e561fce99"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.14/mh_0.0.14_darwin_amd64.tar.gz"
      sha256 "bd58d16818066339311f6dbe5065800bc71a3c42336fa046b4488b74c486dfbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.14/mh_0.0.14_linux_arm64.tar.gz"
      sha256 "f9525b8a6241fd751d22cffb24444b56f290768845845c7372dc3f8f75292825"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.14/mh_0.0.14_linux_amd64.tar.gz"
      sha256 "0ea443749e084ea32b4a0a518143505b4ebe409031509a38ca93a4579d184c81"
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
