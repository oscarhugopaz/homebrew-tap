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
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.3.0/earth-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "33fd7470cbb92ddc1489827f8bde149af4007cdeae41e58c4e754e3e5530b2f3"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.3.0/earth-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "903dda4639a649c088624fd28fc7e1d1721f8356941afb8bce29cc38274dc313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.3.0/earth-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "02dc7787c0c16144148dfe44476e80dd0a4a45ec87f6c99655b5e6e91b1b1740"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.3.0/earth-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "1b7ff455a936b20db26ff8b7b7147a5ccc628cc5c6c5039cca9ab7a7cd03e203"
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
