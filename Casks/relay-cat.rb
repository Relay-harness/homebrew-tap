cask "relay-cat" do
  version "1.9.4"
  sha256 "853ca77ad9822ec9a87b839a01d930750c60cfbaf4d7d7aee8c6506ca88e772d"

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

    First connection discloses sharing rounded usage with throttleindex.com.
    A previously revoked sharing choice stays off. Live usage can be public
    from one reporting installation. Review Data permissions and Connection
    details for your sharing state and last server acknowledgement.
  EOS
end
