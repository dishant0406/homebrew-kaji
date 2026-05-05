cask "droidkit" do
  version "0.0.12"
  sha256 "1a821a95ebc513e300811cd57cfb533de454e55d18342b7de7c2f4781ffc7ba4"

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
