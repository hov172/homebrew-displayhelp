# homebrew-displayhelp

Homebrew tap for [DisplayHelp](https://github.com/hov172/DisplayHelp), a macOS menu bar app that makes projectors, TVs and external displays behave.

## Install

```sh
brew tap hov172/displayhelp
brew trust hov172/displayhelp   # Homebrew 5+ refuses third-party taps until you trust them
brew install --cask displayhelp
```

Homebrew runs the signed and notarized installer package, so the result is identical to a manual install: `DisplayHelp.app` lands in `/Applications` and the global login agent starts it at login for every account. Expect an administrator password prompt.

## Update

```sh
brew upgrade --cask displayhelp
```

DisplayHelp can also update itself from **Check for Update…** once an administrator, or an MDM profile, approves the DisplayHelp Updater helper.

## Uninstall

```sh
brew uninstall --cask displayhelp        # quits the app, removes it, the login agent and the updater helper
brew uninstall --zap --cask displayhelp  # also removes saved profiles and preferences
```

Requires macOS 14 (Sonoma) or later. Managed Macs should keep deploying the package through their MDM; the cask is for people with a terminal.

The cask is rewritten on every DisplayHelp release by `scripts/update-cask.sh` in the source repository.
