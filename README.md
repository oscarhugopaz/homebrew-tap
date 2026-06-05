# homebrew-tap

Homebrew tap for [mainwp-cli](https://github.com/oscarhugopaz/mainwp-cli),
a command-line interface for the [MainWP Dashboard](https://mainwp.com)
REST API v2.

## Install

```bash
brew install oscarhugopaz/tap/mainwp-cli
```

The `oscarhugopaz/tap` part is the tap (this repository); `mainwp-cli`
is the formula name. Homebrew will tap the repository automatically
on first install, so there is no separate `brew tap` step.

To upgrade later:

```bash
brew update
brew upgrade mainwp-cli
```

## What's in the formula

The `Formula/mainwp-cli.rb` formula installs:

- `mainwp` → entry point script
- `~/.config/mainwp-cli/config.json` is created on first run by `mainwp init`
- Shell completions for bash and zsh

The bash script follows its own symlink at runtime to find the bundled
`lib/` tree, so the formula installs the full repository into Homebrew's
`libexec` and exposes only the binary in `bin/`.

## Releasing a new version

1. Tag the release in the [mainwp-cli](https://github.com/oscarhugopaz/mainwp-cli)
   repo (e.g. `git tag v0.2.0 && git push origin v0.2.0`).
2. Create a GitHub release for the tag.
3. Download the source tarball, compute its SHA256, and update the
   `url` and `sha256` lines at the top of `Formula/mainwp-cli.rb`:

   ```bash
   curl -L -o /tmp/mainwp-cli.tar.gz \
     https://github.com/oscarhugopaz/mainwp-cli/archive/refs/tags/v0.2.0.tar.gz
   shasum -a 256 /tmp/mainwp-cli.tar.gz
   ```
4. Open a PR here with the updated formula. The `test` block in the
   formula double-checks the install by running `mainwp --version`,
   listing subcommands in `--help`, and verifying the error path for an
   unconfigured profile.

## License

MIT - see the corresponding file in the mainwp-cli repo.
