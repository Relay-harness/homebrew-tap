cask "relay-cat" do
  version "1.9.10"
  sha256 "abf105da477600ec92cf200814ae1b80d8f87fd58dd004fee6fc86c2dfb605f5"

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

    Miso sends rounded 5-hour and weekly usage to throttleindex.com right
    after install and then once a day, and shows a one-time notice. Every
    Miso member is counted on the website; with one member, that member's
    usage is visible. A previously revoked sharing choice stays off. To
    stop, open the popover's gear menu and uncheck "Share usage with
    throttleindex". Delete my shared readings removes what was sent.

    Miso opens at login so it is running when Claude or Codex starts.
    Untick "Open at login" in the same menu to turn that off.
  EOS
end
