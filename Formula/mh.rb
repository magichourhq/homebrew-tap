class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.0-alpha.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.3/mh_0.0.0-alpha.3_darwin_arm64.tar.gz"
      sha256 "86907f99e3455f06020dd07e6eb93d2af82ba4706d821f36b7ddd7ffdc87fe7d"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.3/mh_0.0.0-alpha.3_darwin_amd64.tar.gz"
      sha256 "dcbc4b4e075eb40a39804ed99e7c63d6386e3db2e8ba395500b5877e527273ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.3/mh_0.0.0-alpha.3_linux_arm64.tar.gz"
      sha256 "2b6d6d3971219d1d6db396116cb3e1c675ea1a94672bb31f7ce6a78ab100f8d7"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.3/mh_0.0.0-alpha.3_linux_amd64.tar.gz"
      sha256 "f89ccfee9807754fc4d5ad65ace9d05a7e53d5b4a7d21684f698ecfd8704bdf8"
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
