class PenpotCli < Formula
  desc "Lightweight CLI for coding agents using Penpot's MCP server"
  homepage "https://github.com/oscarhugopaz/penpot-cli"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.0/penpot-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "d6b022df0c0ade99a0efdec9ab85081ed4cca17b218a300fd16da09506b15704"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.0/penpot-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "f232fd6f4b392846aa80924a0364c88a273c3bba5892290e8fcbab5f53984339"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.0/penpot-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "e04ee83e791af9a37d40279d8e398e24d61eea18d27810a6f719b59bf17772c0"
    end

    on_intel do
      url "https://github.com/oscarhugopaz/penpot-cli/releases/download/v0.2.0/penpot-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "a70c74ffee946a5a1bb9c37d1ae659b95b58c86c19ea69b916aa0868833c50d4"
    end
  end

  def install
    bin.install "penpot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/penpot version")
  end
end
