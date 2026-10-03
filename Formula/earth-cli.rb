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
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.6.0/earth-cli_0.6.0_darwin_arm64.tar.gz"
      sha256 "619474f4249f9e96c48a788fe68593b5ea57d702246f1916f92d5ae81c84678d"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.6.0/earth-cli_0.6.0_darwin_amd64.tar.gz"
      sha256 "5d3b1143c0adfb0ad422fb1f381cb92018b40cfb9e650f4345e424c520bb34f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.6.0/earth-cli_0.6.0_linux_arm64.tar.gz"
      sha256 "2dce7e62a84322c62e2862de9623dd4f18259acfa717c8b29d0f090610cd1ee6"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.6.0/earth-cli_0.6.0_linux_amd64.tar.gz"
      sha256 "fbf4715af98a766729aeb92ce622083b6ca58fbbe99ce61fb73178617a92217d"
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
