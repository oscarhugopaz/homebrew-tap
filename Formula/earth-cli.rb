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
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.5.0/earth-cli_0.5.0_darwin_arm64.tar.gz"
      sha256 "ce5912cb18ce86ee0930a7f1c4b89ce354a3a0aaaa611d737146788f5713f0ad"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.5.0/earth-cli_0.5.0_darwin_amd64.tar.gz"
      sha256 "f43d2707558211d466c974142f3215f8cfbeb6919dfddb6a0462ee268733c4e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.5.0/earth-cli_0.5.0_linux_arm64.tar.gz"
      sha256 "f999fa2a88fe5ac0835a092c8a5c68a10e26b7352657ae51f13e778a5b6763e9"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.5.0/earth-cli_0.5.0_linux_amd64.tar.gz"
      sha256 "b2a8ce1474b1c98a2732b615411ecb958709d2818e54c15a271a3459a1d99406"
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
