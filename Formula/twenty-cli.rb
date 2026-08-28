class TwentyCli < Formula
  desc "Terminal and automation interface for Twenty CRM"
  homepage "https://github.com/salmonumbrella/twenty-cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/salmonumbrella/twenty-cli/releases/download/v0.1.14/twenty_0.1.14_darwin_arm64.tar.gz"
      sha256 "1c153b35aafe190201fc34f44dd6a453a0cd912a7348a011a8dac939e5836502"
    end

    on_intel do
      url "https://github.com/salmonumbrella/twenty-cli/releases/download/v0.1.14/twenty_0.1.14_darwin_amd64.tar.gz"
      sha256 "f52af7b8566c4b980a5e579e5a95cd9bbed9190d02246fe24b54de4a048ddaef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/salmonumbrella/twenty-cli/releases/download/v0.1.14/twenty_0.1.14_linux_arm64.tar.gz"
      sha256 "3efb646e984e42180f72fc10286b69917f7bd2d6727e33d30e60af7655cf5015"
    end

    on_intel do
      url "https://github.com/salmonumbrella/twenty-cli/releases/download/v0.1.14/twenty_0.1.14_linux_amd64.tar.gz"
      sha256 "a2595bc3815fc347b7bf0034464dd2f8b0fc99e9411ffe6129b43751ecf45b80"
    end
  end

  def install
    bin.install "twenty"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twenty --version")
  end
end
