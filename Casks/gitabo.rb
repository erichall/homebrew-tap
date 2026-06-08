cask "gitabo" do
  version "0.1.1"
  sha256 "a30390b6af3659fcb521eb4a3d0f9385d9b7cbb630c69c5fbe46b4826f319bd7"

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
