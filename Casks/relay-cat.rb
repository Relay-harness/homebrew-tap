cask "relay-cat" do
  version "1.9.6"
  sha256 "cb497774af5119a395b3649b990f9215bfd6520f729a6252b0243fdcb5437a90"

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

    Miso shares rounded 5-hour and weekly usage with throttleindex.com
    from the first launch and shows a one-time notice. A previously
    revoked sharing choice stays off. Live usage can be public from one
    reporting installation. To stop, open the popover's gear menu and
    uncheck "Share usage with throttleindex".
  EOS
end
