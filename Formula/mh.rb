class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.11/mh_0.0.11_darwin_arm64.tar.gz"
      sha256 "22355c9214d4c863c65420bc12fc9422123011354ede1a26fb46a6c2ef4c2d1c"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.11/mh_0.0.11_darwin_amd64.tar.gz"
      sha256 "56821a7a14a2a95e064f2f4ee53fe5240d552129fe891ccd63b93918d00a15bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.11/mh_0.0.11_linux_arm64.tar.gz"
      sha256 "6bfb8fbb7366e9a202b4babf2d66a425753e600b6eb2eb6ca8dbc9ee234346b4"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.11/mh_0.0.11_linux_amd64.tar.gz"
      sha256 "7b26783b7ce077a114564a5e1084da433e87d82dc40d008b83fa86804c42cf84"
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
