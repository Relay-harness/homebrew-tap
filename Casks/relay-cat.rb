cask "relay-cat" do
  version "1.9.0"
  sha256 "c6185ed693ee7c9e4dd2371c0b2f33ccfe096b61b0f786cc974143dccdb934af"

  url "https://github.com/Relay-harness/miso/releases/download/v#{version}/RelayCat-#{version}-macos-arm64.zip"
  name "Relay Cat"
  desc "Menu-bar cat that tracks subscription quota and feeds throttleindex.com"
  homepage "https://github.com/Relay-harness/miso"

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

    Community sharing with throttleindex.com is off until you agree in the app.
  EOS
end
