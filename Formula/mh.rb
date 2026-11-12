class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.7/mh_0.0.7_darwin_arm64.tar.gz"
      sha256 "253ceef4c55f9c85d2cdca57e3427bc5fe2d23ebc996c8529688cf35ea854bc0"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.7/mh_0.0.7_darwin_amd64.tar.gz"
      sha256 "be4e41ea33f3eb3ec64bac5fbf5bc6ed0e6191a60834ccd9ff560b195e4e0365"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.7/mh_0.0.7_linux_arm64.tar.gz"
      sha256 "7b98c3dd8fe0ec56b9f16ad9669f63e171c3cf8587dd9aae556cae52321fd48b"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.7/mh_0.0.7_linux_amd64.tar.gz"
      sha256 "371e48afdb91ac9ca53cfdf0630df2eb5d1646db865458ef98c5944d10eb5eb0"
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
