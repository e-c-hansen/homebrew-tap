cask "minicode" do
  version "1.0.0"
  sha256 "4c87a8bb79494153c2e4c26f678aeec8e00eabcb5f6b34aed0348a56e166d60c"

  url "https://github.com/e-c-hansen/homebrew-tap/releases/download/v#{version}/MiniCode.zip"
  name "MiniCode"
  desc "Tiny native macOS code editor, no Electron, no dependencies"
  homepage "https://github.com/e-c-hansen/homebrew-tap"

  app "MiniCode.app"

  # MiniCode is ad-hoc signed but not notarized (free, no Apple Developer
  # account). Homebrew quarantines downloads by default, so clear the flag
  # after install to avoid a Gatekeeper warning on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MiniCode.app"]
  end

  zap trash: "~/Library/Preferences/com.minicode.editor.plist"
end
