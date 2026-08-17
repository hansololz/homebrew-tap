cask "autowright" do
  version "0.3.4"
  sha256 "a9111ae79cf5cfc31cc82da053caa2f6c3a6ada497de93bebd37ca3b77a58545"

  url "https://github.com/hansololz/autowright/releases/download/v#{version}/Autowright-#{version}-darwin-arm64.dmg",
      verified: "github.com/hansololz/autowright/"
  name "Autowright"
  desc "Recurring personal automations written by AI agents and run locally"
  homepage "https://autowright.ai/"

  livecheck do
    url "https://autowright.ai/updates/darwin-arm64.json"
    strategy :json do |json|
      json["currentRelease"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Autowright.app"

  # The app registers a per-user LaunchAgent for its Python backend on first
  # launch; launchd would otherwise keep restarting a backend whose bundled
  # interpreter has just been removed.
  uninstall launchctl: "com.autowright.backend",
            quit:      "com.autowright.app"

  zap trash: [
    "~/.local/bin/autowright",
    "~/Library/Application Support/Autowright",
    "~/Library/LaunchAgents/com.autowright.backend.plist",
    "~/Library/Logs/Autowright",
    "~/Library/Preferences/com.autowright.app.plist",
    "~/Library/Saved Application State/com.autowright.app.savedState",
  ]
end
