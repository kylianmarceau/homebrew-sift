cask "sift" do
  version "0.1.3"
  sha256 "92a8dfb4f450e90f66652818c3747fbdbba772b78a489f66b386e67602753376"

  url "https://github.com/kylianmarceau/sift/releases/download/v#{version}/Sift-#{version}-arm64.zip"
  name "Sift"
  desc "Keyboard launcher for apps, files, snippets and calculations"
  homepage "https://github.com/kylianmarceau/sift"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Sift.app"

  uninstall quit: "io.github.kylianmarceau.sift"

  # ~/.config/sift is left alone: it may be part of the user's dotfiles.
  zap trash: [
    "~/Library/Application Support/sift",
    "~/Library/Logs/Sift",
  ]

  caveats <<~EOS
    Sift is not notarized yet. The first time you open it after an install
    or upgrade, macOS may say it cannot verify Sift: open
    System Settings > Privacy & Security and click Open Anyway.
  EOS
end
