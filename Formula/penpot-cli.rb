class PenpotCli < Formula
  desc "Lightweight CLI for coding agents using Penpot's MCP server"
  homepage "https://github.com/oscarhugopaz/penpot-cli"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.1/penpot-cli_0.2.1_darwin_arm64.tar.gz"
      sha256 "cd6a7ec1b204d1a399221da6a42819dab4afd429bac42e2d91de5fea505a9bbc"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.1/penpot-cli_0.2.1_darwin_amd64.tar.gz"
      sha256 "3e7a052e116e679bb0940f7efc4f2ee007261166300ecffade1d6ea23f336e32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.1/penpot-cli_0.2.1_linux_arm64.tar.gz"
      sha256 "20c23eb66f2da992ab54714896e53ddb821ee9bc39d4537168ed4d33371f8821"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.1/penpot-cli_0.2.1_linux_amd64.tar.gz"
      sha256 "e2879aea60fa93064efbe1822acb0a70594b8c3d2439c16b248ebd41c4f37561"
    end
  end

  def install
    bin.install "penpot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penpot version")
  end
end
