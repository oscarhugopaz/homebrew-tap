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
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.4.0/earth-cli_0.4.0_darwin_arm64.tar.gz"
      sha256 "12128db5f3c991cf400303b25b1c10dfe1ca80e3d5dfa0bc299f91fd71ac94db"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.4.0/earth-cli_0.4.0_darwin_amd64.tar.gz"
      sha256 "06e90de42bb89db6cacb855fed07cec89e5d0280e0fe3ae413b11647a747d4a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.4.0/earth-cli_0.4.0_linux_arm64.tar.gz"
      sha256 "e401a71f6a13bf2ace873f89ea68ffdcd311eb7514b9482d1adf35191c0ec9d5"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.4.0/earth-cli_0.4.0_linux_amd64.tar.gz"
      sha256 "8974e07cd3ef31c85ecd19c2195a62707a7b6500608295c993591e5506c2de65"
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
