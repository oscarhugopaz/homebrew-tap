class EarthCli < Formula
  desc "Developer-friendly CLI for programmable Earth observation"
  homepage "https://github.com/oscarhugopaz/earth-cli"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.1.0/earth-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "1f65bee1e5cc8b5174f44a724c4c6eccf571eb3a196fe745d80838d1c4ae4b44"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.1.0/earth-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "0da0261f3a94d6319ea6eace48c1bcf266c40ad8567e069b6137ac59dfa20a2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.1.0/earth-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "fdc975932eeb07cfe2b262909211119ca0f0b3d75c30e8a9dd9d377ddc64a9b9"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.1.0/earth-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "70e286733553c839bd1a1b7b3a29a8132f3a835277d02367bc92453938009b1a"
    end
  end

  def install
    bin.install "earth"
    generate_completions_from_executable(bin/"earth", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/earth version")
    assert_match "copernicus", shell_output("#{bin}/earth providers")
  end
end
