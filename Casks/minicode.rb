cask "minicode" do
  version "1.1.0"
  sha256 "494de1eff9885991b69fc89fdfb672555712fdee97fd62c287e161397de13360"

  url "https://github.com/e-c-hansen/homebrew-tap/releases/download/v#{version}/MiniCode.zip"
  name "MiniCode"
  desc "Tiny native macOS code editor, no Electron, no dependencies"
  homepage "https://github.com/e-c-hansen/homebrew-tap"

  app "MiniCode.app"
  binary "#{appdir}/MiniCode.app/Contents/Resources/minicode"   # `minicode` on PATH

  # Ad-hoc signed but not notarized (free, no Apple Developer account). Homebrew
  # quarantines downloads by default, so clear the flag after install to avoid a
  # Gatekeeper warning on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MiniCode.app"]
  end

  zap trash: "~/Library/Preferences/com.minicode.editor.plist"
end
