cask "displayhelp" do
  version "0.6.13"
  sha256 "8f874927dc1375768c4edd528eeca79a5f208959f935e5f2eb79d4c40dcd70ee"

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
