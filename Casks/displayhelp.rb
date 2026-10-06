cask "displayhelp" do
  version "0.6.11"
  sha256 "d0a1fa5a12a74bf787a87a5fd8e3bc60d32b7e20e5d3042951f50264f9ae0db1"

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
