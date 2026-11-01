cask "relay-cat" do
  version "1.8.1"
  sha256 "1e11ebf4be174ca9ba96b66ba0bd0dd7b9c33df3c1a4fda8a3da34f505d38f0b"

  url "https://github.com/Relay-harness/relay-cat/releases/download/v#{version}/RelayCat-#{version}-macos-arm64.zip"
  name "Relay Cat"
  desc "Menu-bar cat and subscription quota usage tracker"
  homepage "https://github.com/Relay-harness/relay-cat"

  livecheck do
    skip "Public previews are updated manually in this tap"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Relay Cat.app"

  caveats <<~EOS
    This preview is ad-hoc signed, not Apple-notarized. Homebrew does not
    make it Apple-verified and keeps macOS quarantine protection enabled.
    If macOS blocks the first launch, review the source and checksum first.
    Only if you trust this build: try opening Relay Cat, then use System Settings
    > Privacy & Security > Open Anyway and confirm the macOS prompt.
    Do not bypass a warning that says the app contains malware or will
    damage your computer. Do not disable Gatekeeper system-wide.

    Quit any older Relay Cat copy before opening this one. Public builds use
    a separate preferences domain and need their own data permissions.
  EOS
end
