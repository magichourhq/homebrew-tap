class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.4/mh_0.0.0-alpha.4_darwin_arm64.tar.gz"
      sha256 "4dd8eed94f274709d79924813f9fc9459c5f40994894ccebeda0a32928c12a78"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.4/mh_0.0.0-alpha.4_darwin_amd64.tar.gz"
      sha256 "c5d8abeb083ff293fc9af5df62541db7d6b697eee54ecdeb17948ce2454a1c3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.4/mh_0.0.0-alpha.4_linux_arm64.tar.gz"
      sha256 "f27570f0c8a840e35a0d2c4d1317d2c0492fc32f03df67e7b8455248450ebfef"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.4/mh_0.0.0-alpha.4_linux_amd64.tar.gz"
      sha256 "1a96d6bd27be742b4539cabc94d30c8abd4a31e2026f400ba27244f6633bc1c5"
    end
  end

  def install
    bin.install "mh"
    bash_completion.install "completions/mh.bash" => "mh"
    zsh_completion.install "completions/mh.zsh" => "_mh"
    fish_completion.install "completions/mh.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mh version")
  end
end
