# hansololz/homebrew-tap

Homebrew casks for [Autowright](https://autowright.ai).

## Install

```sh
brew install --cask hansololz/tap/autowright
```

That taps this repository and installs in one step. Once tapped, the short form works too:

```sh
brew install --cask autowright
```

## Upgrade

Autowright updates itself from inside the app (Settings > About > Check for updates), so the
cask is declared `auto_updates true` and `brew upgrade` leaves it alone. To move the Homebrew
copy to the latest release explicitly:

```sh
brew upgrade --cask --greedy autowright
```

## Uninstall

```sh
brew uninstall --cask autowright
```

This also stops and unregisters the `com.autowright.backend` LaunchAgent. To remove automations,
execution history, logs, and the optional `autowright` CLI shim as well:

```sh
brew uninstall --cask --zap autowright
```

Secrets stored in the macOS Keychain are never touched by either command; remove those in
Keychain Access.

## Casks

| Cask         | Description                                                          |
| ------------ | -------------------------------------------------------------------- |
| `autowright` | Recurring personal automations written by AI agents and run locally    |

Apple silicon only, macOS 12 (Monterey) or later. The app is Developer ID signed and notarized,
so no Gatekeeper override is needed.
