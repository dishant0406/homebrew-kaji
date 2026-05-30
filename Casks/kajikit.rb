cask "kajikit" do
  version "0.2.1"
  sha256 "9327c46b637105ef580ed84ee71b1f94db4be6012f1505ea5edf6180fd7765e1"

  url "https://github.com/dishant0406/kaji/releases/download/v#{version}/Kaji-#{version}-arm64.dmg"
  name "Kaji"
  desc "macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/dishant0406/kaji"

  depends_on macos: ">= :sonoma"

  app "Kaji.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Kaji.app"],
                   sudo: false
  end

  caveats <<~EOS
    Kaji is currently distributed as an unsigned developer preview.

    This cask removes the macOS quarantine attribute after install so Kaji can launch.
    Managed or corporate Macs may still block unsigned apps.
  EOS
end
