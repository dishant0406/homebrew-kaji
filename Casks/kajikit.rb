cask "kajikit" do
  version "0.4.1"
  sha256 "46bf6358e70a1cc51a860047320e6276ae078c6b25e853e577a21914a2d84ac1"

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
