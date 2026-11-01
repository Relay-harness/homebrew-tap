cask "miso-track" do
  version "1.8.0"
  sha256 "9924315ab47043e4296491d728c8031ac0619e5421bb39869e0cfa194d50b51c"

  url "https://github.com/Relay-harness/miso-track/releases/download/v#{version}/Miso-#{version}-macos-arm64.zip",
      verified: "github.com/Relay-harness/miso-track/"
  name "Miso Track"
  desc "Menu-bar cat and subscription quota usage tracker"
  homepage "https://github.com/Relay-harness/miso-track"

  livecheck do
    skip "Public previews are updated manually in this tap"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Miso.app"

  caveats <<~EOS
    This preview is ad-hoc signed, not Apple-notarized. Homebrew does not
    make it Apple-verified and keeps macOS quarantine protection enabled.
    If macOS blocks the first launch, review the source and checksum first.
    Only if you trust this build: try opening Miso, then use System Settings
    > Privacy & Security > Open Anyway and confirm the macOS prompt.
    Do not bypass a warning that says the app contains malware or will
    damage your computer. Do not disable Gatekeeper system-wide.

    Quit any older Miso copy before opening this one. Public builds use
    a separate preferences domain and need their own data permissions.
  EOS
end
