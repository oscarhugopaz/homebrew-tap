class PenpotCli < Formula
  desc "Lightweight CLI for coding agents using Penpot's MCP server"
  homepage "https://github.com/oscarhugopaz/penpot-cli"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.3.0/penpot-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "edfb75aac8bc517738e26a022c178249aa9ab0f62b9636f0321830b7a03bbb7e"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.3.0/penpot-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "107ba528913297fa0ca6f64fdd0e827fd63ba3c3b9c4d9dbc459f239997e135d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.3.0/penpot-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "9bed07339b3d1cd25c8abd78de7042e0f0b05f7e1d0bb31bde367ef62a239fd1"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.3.0/penpot-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "2c5503278ba697c788bb5ea81447a87c0e907ae61abfee7934af3257c78eaced"
    end
  end

  def install
    bin.install "penpot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penpot version")
  end
end
