cask "gitabo" do
  version "0.1.2"
  sha256 "6fd4924a8ff196e58905cc91e49a41bc59eccd31d42d0d3261b71827ec2540dc"

  url "https://github.com/erichall/homebrew-tap/releases/download/gitabo-v#{version}/Gitabo-#{version}.zip"
  name "Gitabo"
  desc "Git worktree, stack, and diff viewer"
  homepage "https://github.com/erichall/gitabo"

  depends_on macos: :sonoma

  app "Gitabo.app"

  # gitabo is ad-hoc signed (not notarized). Homebrew quarantines downloads by default,
  # which would make Gatekeeper block first launch. Strip the quarantine attribute so the
  # app opens cleanly — a conscious tradeoff for a self-authored tool shared with a peer.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Gitabo.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.erichall.gitabo",
    "~/Library/Caches/com.erichall.gitabo",
    "~/Library/Preferences/com.erichall.gitabo.plist",
    "~/Library/Saved Application State/com.erichall.gitabo.savedState",
  ]
end
