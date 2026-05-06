cask "droidkit" do
  version "0.0.15"
  sha256 "ea84c4cd81ac124eac0facbb89e4b6ca485fffe359d075cab25f1ac19bd9242a"

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
