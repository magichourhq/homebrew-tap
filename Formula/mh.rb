class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.1/mh_0.0.1_darwin_arm64.tar.gz"
      sha256 "1550383304f8fe1e30c4e5c9dbae700f5f50c419b820c6521b47594ced08efa0"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.1/mh_0.0.1_darwin_amd64.tar.gz"
      sha256 "70191ef330f95b6f1f042372a6e0588abcb8c3360e5afd7415bdf2bdacbc709f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.1/mh_0.0.1_linux_arm64.tar.gz"
      sha256 "41ff940e1d8de4da48896e07efc2db0f3401cc888d9d2e183ac8a153ad57ffb9"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.1/mh_0.0.1_linux_amd64.tar.gz"
      sha256 "c721c2a4bc2305e899545935c31ddd022c48aef9cfef22df0a60c25d105e74c2"
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
