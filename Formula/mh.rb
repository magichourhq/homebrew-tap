class Mh < Formula
  desc "Magic Hour command-line tool"
  homepage "https://github.com/magichourhq/magic-hour-cli"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.6/mh_0.0.6_darwin_arm64.tar.gz"
      sha256 "98272410056379a16533ccc1dad1b0441b9a6d311057829b6a5fe36f0e3a0cae"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.6/mh_0.0.6_darwin_amd64.tar.gz"
      sha256 "2e785ce9ce8f34ebb4ec07ef1868479b5b77406361530a7588d2aa2791f84463"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.6/mh_0.0.6_linux_arm64.tar.gz"
      sha256 "e15ed322e117e8903ececad4af2154ca6307c168737e2282024bcd8018d0aace"
    else
      url "https://github.com/magichourhq/magic-hour-cli/releases/download/v0.0.6/mh_0.0.6_linux_amd64.tar.gz"
      sha256 "3002f82e6960bc78608e999092ddef6dd98fd5597113bdf91a16d4fb260f047d"
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
