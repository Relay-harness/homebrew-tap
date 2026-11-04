cask "relay-cat" do
  version "1.9.3"
  sha256 "3feff0cf85069ec6634c48c980a5d8d3a087a763f82ec07693c722a92aed3891"

  url "https://github.com/Relay-harness/miso/releases/download/v#{version}/Miso-#{version}-macos-arm64.zip"
  name "Miso"
  desc "Menu-bar cat that tracks subscription quota and feeds throttleindex.com"
  homepage "https://github.com/Relay-harness/miso"

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

    When you enable live quotas, Miso also shares rounded usage percentages
    with throttleindex.com. Turn it off in Data permissions.
  EOS
end
