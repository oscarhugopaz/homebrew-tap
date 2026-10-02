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
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.2.0/earth-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "31ff2408445e8dbb07e4adfc630854687a20f73ecc93d37c527506eb001c1170"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.2.0/earth-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "9f7a29e4f25a946ef36661ca5a07f9b7658b91e9d348137ee09df173df0fe6f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.2.0/earth-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "8ec435176795debfec86b9ebc3c1a6a932e689e2e39cbd9f8bd951b89be96401"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/earth-cli/releases/download/v0.2.0/earth-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "5494317e029ec03c8b0d6d039690f12cd5a0c6f06a3db223e1fa3a6e8c8127c0"
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
