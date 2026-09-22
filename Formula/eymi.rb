class Eymi < Formula
  desc "Terminal Markdown editor with live preview and familiar shortcuts"
  homepage "https://github.com/yungibly/eymi"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/eymi/releases/download/v0.1.0/eymi-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a68a564e9513ffef8b570bd7146e12fc65ed4845fd8456666d72f3a21d3443b1"
    end
    on_intel do
      url "https://github.com/yungibly/eymi/releases/download/v0.1.0/eymi-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "eec7ceaab88a839d1552782dd74a768d9d20554c0a015c6a9c6fb459cc35a7e7"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/eymi/releases/download/v0.1.0/eymi-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0bd3e192f96bc27416a5f2f954ce9f609f8678cca7f7c11ef45014cded74df10"
  end

  def install
    bin.install "eymi"
    doc.install "README.md", "LICENSE"
    (pkgshare/"third_party").install "third_party/iterm2-themes", "third_party/rust"
  end

  test do
    assert_equal "eymi #{version}\n", shell_output("#{bin}/eymi --version")
    source = "# Homebrew\n\n- [ ] Keep source.\n"
    (testpath/"note.md").write(source)
    output = shell_output("#{bin}/eymi --no-state --snapshot --theme dark #{testpath}/note.md")
    assert_match "Homebrew", output
    assert_equal source, (testpath/"note.md").read
    assert_match "Catppuccin Mocha", shell_output("#{bin}/eymi --list-themes")
  end
end
