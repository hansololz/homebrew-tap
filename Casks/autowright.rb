cask "autowright" do
  version "0.6.0"
  sha256 "96ff430a7c8267d7ca9a5aac092fba36aeb538d01ec46b34d4d14e5ee3b96b69"

  url "https://github.com/hansololz/autowright/releases/download/v#{version}/Autowright-#{version}-darwin-arm64.dmg",
      verified: "github.com/hansololz/autowright/"
  name "Autowright"
  desc "Recurring personal automations written by AI agents and run locally"
  homepage "https://autowright.ai/"

  livecheck do
    url "https://raw.githubusercontent.com/hansololz/autowright/main/release/darwin-arm64/latest-mac.yml"
    strategy :yaml do |yaml|
      yaml["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Autowright.app"

  # The app registers a per-user LaunchAgent for its Python backend on first
  # launch; launchd would otherwise keep restarting a backend whose bundled
  # interpreter has just been removed. Both identifier generations are listed:
  # ai.autowright.* is current, com.autowright.* was shipped through v0.3.5.
  uninstall launchctl: [
              "ai.autowright.backend",
              "com.autowright.backend",
            ],
            quit:      [
              "ai.autowright.app",
              "com.autowright.app",
            ]

  zap trash: [
    "~/.local/bin/autowright",
    "~/Library/Application Support/Autowright",
    "~/Library/Caches/autowright-updater",
    "~/Library/LaunchAgents/ai.autowright.backend.plist",
    "~/Library/LaunchAgents/com.autowright.backend.plist",
    "~/Library/Logs/Autowright",
    "~/Library/Preferences/ai.autowright.app.plist",
    "~/Library/Preferences/com.autowright.app.plist",
    "~/Library/Saved Application State/ai.autowright.app.savedState",
    "~/Library/Saved Application State/com.autowright.app.savedState",
  ]
end
