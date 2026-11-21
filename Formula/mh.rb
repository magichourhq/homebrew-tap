class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.12/mh_0.0.12_darwin_arm64.tar.gz"
      sha256 "d7b04d99c5574b38d4eee61668ee45b23fc36235a119166c621d0851e7ffdbf7"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.12/mh_0.0.12_darwin_amd64.tar.gz"
      sha256 "ee6f060558be1bde3aa250f37662973394c82f4fa2e24f6b90dc47c79ffc884e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.12/mh_0.0.12_linux_arm64.tar.gz"
      sha256 "83a8b429c81707fff1d82f2db1a26315960f85778e72462605e5d1314a671c29"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.12/mh_0.0.12_linux_amd64.tar.gz"
      sha256 "75e258a401d8d06f626bffcfe51c048d6d4aac4c275dc2269209b1fd15e6c31a"
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
