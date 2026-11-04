# Relay Cat (Miso) - Homebrew tap

Official tap for [Relay Cat](https://github.com/Relay-harness/miso), a native macOS menu-bar cat and subscription-quota tracker that can optionally share data with [throttleindex.com](https://www.throttleindex.com).

## Install

Requires [Homebrew](https://brew.sh/), Apple Silicon and macOS 14 or newer.

```sh
brew install --cask relay-harness/tap/relay-cat
```

Then open **Miso** from Applications. The old `miso-track` cask is renamed to `relay-cat`. If you had it installed, run `brew update && brew upgrade --cask` and Homebrew moves you over. Quit any older copy first. If an existing manual install occupies the destination, move that copy somewhere safe before retrying; do not use `--force` to overwrite it blindly. To install only for your macOS user, add `--appdir="$HOME/Applications"` to the command.

### First-launch security warning

**The current preview is ad-hoc signed, not Developer ID signed or Apple-notarized. Homebrew does not turn it into an Apple-verified app.** The cask preserves quarantine and never removes security attributes or disables Gatekeeper.

If macOS says Apple cannot check the app for malicious software:

1. Review the [source](https://github.com/Relay-harness/miso), [release notes and SHA256SUMS](https://github.com/Relay-harness/miso/releases/tag/v1.9.1). Homebrew verifies the ZIP against the cask's pinned SHA-256. A checksum is not independent proof of publisher identity.
2. Try to open Miso once. Dismiss the unverified-developer warning.
3. **Only if you trust the build**, open **System Settings → Privacy & Security**, find the blocked Miso entry, choose **Open Anyway**, authenticate if asked, and confirm **Open**.

The option may appear only shortly after the blocked launch. Managed Macs may forbid this override; ask your administrator. On current macOS versions, Control-click → Open alone may not bypass this warning. See [Apple's guidance](https://support.apple.com/102445).

**Do not override an alert that says the app contains malware or will damage your computer.** Stop and report it privately through the project's [security policy](https://github.com/Relay-harness/miso-track/blob/main/SECURITY.md). Never disable Gatekeeper system-wide or use blanket quarantine-removal commands.

## Update

Quit Miso, then:

```sh
brew update
brew upgrade --cask relay-harness/tap/miso-track
```

Preview versions are pinned and updated manually by the maintainer after each release; `brew upgrade` cannot discover an unlisted release by itself. New ad-hoc builds may need approval again. Public builds use `org.relayharness.miso-track` and need their own consent when replacing an older private/local build.

## Remove

```sh
brew uninstall --cask miso-track
```

This removes the Homebrew-managed app only. The cask has no zap operation: it does not erase preferences, shared helper configuration, provider credentials, or another manually installed Miso copy. See the app's [privacy policy](https://github.com/Relay-harness/miso-track/blob/main/PRIVACY.md) for optional non-secret cleanup.

## Maintainers

@cicada0007 maintains this tap. Report app bugs to [miso-track](https://github.com/Relay-harness/miso-track/issues); report cask/download failures here. Never include tokens, cookies, account emails or raw quota responses.

For a new release, update the cask's version and independently verified ZIP SHA-256. Keep the immutable release URL, architecture/OS checks and first-launch warning. Do not add postflight security bypasses. Run `brew style --cask relay-harness/tap/miso-track`, `brew audit --cask --online relay-harness/tap/miso-track`, and `brew fetch --cask relay-harness/tap/miso-track` against the changed cask. CI copies the proposed cask into its tap before checking it; it never launches the app or reads provider accounts.

Tap code: [MIT](LICENSE). The downloaded app retains its own MIT/third-party notices. A third-party tap is not an endorsement by Homebrew or Apple.

Homebrew 7 automatically records trust for this specific cask when you run the fully qualified install command above. Standalone metadata commands such as `brew info`, `brew fetch` and `brew audit` can instead require `brew trust --cask relay-harness/tap/miso-track` first. That trusts this cask’s package definition, not every package in the tap, and is separate from macOS approval. Only grant it after reviewing the cask. CI grants only this narrow trust in its disposable runner.

The only audit exception is `github_prerelease_allowlist.json`, pinned specifically to version 1.8.0 because this is intentionally a public preview. It does not waive SHA verification, quarantine or Apple trust. Update the exact version only after reviewing a new preview; remove the entry when distributing a stable release.
