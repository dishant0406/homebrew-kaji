cask "droidkit" do
  version "0.0.10"
  sha256 "1cfa4028814b6365019db78e9ee768769390747824400cc3199ffcf2be8e530d"

  url "https://github.com/dishant0406/droid/releases/download/v#{version}/Droid-#{version}-arm64.dmg"
  name "Droid"
  desc "macOS terminal multiplexer for AI coding agents"
  homepage "https://github.com/dishant0406/droid"

  depends_on macos: ">= :sonoma"

  app "Droid.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Droid.app"],
                   sudo: false
  end

  caveats <<~EOS
    Droid is currently distributed as an unsigned developer preview.

    This cask removes the macOS quarantine attribute after install so Droid can launch.
    Managed or corporate Macs may still block unsigned apps.
  EOS
end
