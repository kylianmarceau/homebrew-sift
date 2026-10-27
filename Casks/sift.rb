cask "sift" do
  version "0.4.2"
  sha256 "1120e135e6d09fc124ac4bb021065bbd821a7cab627e022b317a4cf7b169acc4"

  url "https://github.com/kylianmarceau/sift/releases/download/v#{version}/Sift-#{version}-arm64.zip"
  name "Sift"
  desc "Keyboard launcher, file search and native window manager"
  homepage "https://github.com/kylianmarceau/sift"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Sift.app"
  binary "#{appdir}/Sift.app/Contents/MacOS/sift-cli", target: "sift"

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
