cask "displayhelp" do
  version "0.7.0"
  sha256 "8a1d1a214530ba1cf07b37c5687e555b67a917708281893aa70c081af2b0d6a1"

  url "https://github.com/hov172/DisplayHelp/releases/download/v#{version}/DisplayHelp-#{version}.pkg"
  name "DisplayHelp"
  desc "Menu bar app that makes projectors, TVs and external displays behave"
  homepage "https://github.com/hov172/DisplayHelp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  pkg "DisplayHelp-#{version}.pkg"

  uninstall launchctl: [
              "com.displayhelp.app",
              "com.displayhelp.updater",
            ],
            quit:      "com.displayhelp.app",
            pkgutil:   "com.displayhelp.app",
            delete:    "/Library/LaunchAgents/com.displayhelp.app.plist"

  zap trash: [
    "~/Library/Application Support/DisplayHelp",
    "~/Library/Preferences/com.displayhelp.app.plist",
  ]
end
