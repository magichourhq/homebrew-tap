class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.0-alpha.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.2/mh_0.0.0-alpha.2_darwin_arm64.tar.gz"
      sha256 "59864b9c2c291c0f274cfaa658bad8cf697a630a085dcb99dbc658c10a1c7e58"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.2/mh_0.0.0-alpha.2_darwin_amd64.tar.gz"
      sha256 "0a941d0dc5beed06fb6306575728fd6feac2726ad75b9230d105c07fc2de6bb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.2/mh_0.0.0-alpha.2_linux_arm64.tar.gz"
      sha256 "9de9292ce5f1e17172e8a95e6b3af0f646487dbff3a622bcb4f1a00507b235f3"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.0-alpha.2/mh_0.0.0-alpha.2_linux_amd64.tar.gz"
      sha256 "5aa001fbfd75c0f32612d3897920019391151ef0563e852b2f3322b648cf066c"
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
