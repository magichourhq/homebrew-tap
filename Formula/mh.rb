class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.5/mh_0.0.5_darwin_arm64.tar.gz"
      sha256 "5b4a8fb14834afc50852a70699b64a5ddc9cb152dbd86db14a1fdd5e610fb8b7"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.5/mh_0.0.5_darwin_amd64.tar.gz"
      sha256 "d515f2ff2ec49dd3bbdce9d8e32c85d3f7c0e5e94fc3282797c83c4e200c5798"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.5/mh_0.0.5_linux_arm64.tar.gz"
      sha256 "42381d6f3bb712263764c163f5a54e24a1b4127929238e5e1d139d2b5288d4c6"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.5/mh_0.0.5_linux_amd64.tar.gz"
      sha256 "411c9e03a2a4b4f09f452301354e8df98ecbf198f00939415216b1049946c121"
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
