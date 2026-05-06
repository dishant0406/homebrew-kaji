cask "droidkit" do
  version "0.0.17"
  sha256 "dc3fcdb6ad30f997b76c3aeb5152cb90c59b39b55cd6486438c56ad1eb123b70"

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
