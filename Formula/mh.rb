class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2/mh_0.0.2_darwin_arm64.tar.gz"
      sha256 "92d93982d80f989652500ada201e0555d8d3df458f04491366d744e7f6961196"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2/mh_0.0.2_darwin_amd64.tar.gz"
      sha256 "fc00a764958295d779df44cdbece8ac143ee46e1d3bf8a8ecadd0dc1d1d9bd39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2/mh_0.0.2_linux_arm64.tar.gz"
      sha256 "ab36a01481b096a79127245230dba30f440824ad49114d8e26764a80a19acc30"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.2/mh_0.0.2_linux_amd64.tar.gz"
      sha256 "031fb4c8f3238a2207f1d94198dc3bbfe81449f2c3392d432a6433aa3c7c8996"
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
