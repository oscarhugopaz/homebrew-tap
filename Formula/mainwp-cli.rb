class MainwpCli < Formula
  desc "Command-line interface for the MainWP Dashboard REST API v2"
  homepage "https://github.com/oscarhugopaz/mainwp-cli"
  url "https://github.com/oscarhugopaz/mainwp-cli/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "3f834b42737aea18058ae771a9076447ee7803bfe4cc716e046d6c06b473107d"
  license "MIT"

  depends_on "bash" => :build
  # gum and jq are declared as required (not :recommended) so that
  # `brew install mainwp-cli` always pulls them in. The CLI is technically
  # usable without them, but the experience is degraded enough that we
  # want every user to get the same setup out of the box.
  depends_on "gum"
  depends_on "jq"

  def install
    # Install the full repo into libexec so the bash script can resolve
    # its lib/ tree by following its own symlink (see bin/mainwp).
    libexec.install Dir["*"]

    # The user-facing entry point. Homebrew symlinks libexec/bin/mainwp
    # into bin/, and the script's _mainwp_resolve_root function follows
    # the symlink back to libexec, which is MAINWP_ROOT.
    bin.install_symlink libexec/"bin/mainwp"

    # Shell completions.
    bash_completion.install libexec/"completions/mainwp.bash" => "mainwp"
    zsh_completion.install  libexec/"completions/_mainwp"     => "_mainwp"
  end

  test do
    # Test 1: version flag works.
    assert_match "mainwp #{version}", shell_output("#{bin}/mainwp --version")

    # Test 2: top-level help lists every documented subcommand.
    help = shell_output("#{bin}/mainwp --help")
    %w[init config sites clients tags updates costs users settings
       monitoring api-keys posts pages batch].each do |cmd|
      assert_match cmd, help
    end

    # Test 3: shell completions are installed.
    assert_match "complete -F _mainwp_completions mainwp",
                 (bash_completion/"mainwp").read
    assert_match "#compdef mainwp", (zsh_completion/"_mainwp").read

    # Test 4: error path points to `mainwp init` when no profile is set.
    output = shell_output("#{bin}/mainwp sites list --no-input 2>&1", 1)
    assert_match "mainwp init", output
  end
end
