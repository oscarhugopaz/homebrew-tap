class PenpotCli < Formula
  desc "Lightweight CLI for coding agents using Penpot's MCP server"
  homepage "https://github.com/oscarhugopaz/penpot-cli"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.1.0/penpot-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "694310447c626d263af3d732197a5088969da2e41c2a426c0d33c632feacf1f4"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.1.0/penpot-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "7fdc8b26adce718e08b3af9f85b1d2823398b10c573b6a63445cf0d6c3a89105"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.1.0/penpot-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "e2c0614a4910d625d4cdab2f3ff552c2f04522851ecf08adebb3271c5e0205c2"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.1.0/penpot-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "7a78d91b29edeefaf5e46456a4930ea21be618d202019a2205351c52a2c2917f"
    end
  end

  def install
    bin.install "penpot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penpot version")
  end
end
