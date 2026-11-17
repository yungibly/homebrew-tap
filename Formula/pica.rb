class Pica < Formula
  desc "Small terminal text editor with micro-style keys and live Markdown"
  homepage "https://github.com/yungibly/pica"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/pica/releases/download/v0.3.0/pica-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "33cd5c0461661d6276a3ac44250b7b13c29edfd1c951aead3bde6e32ea732fd7"
    end
    on_intel do
      url "https://github.com/yungibly/pica/releases/download/v0.3.0/pica-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "06e5e2091b82d4b52e7d28d49638e36ae971cc8d75cf764afa56a6df85f789c0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/pica/releases/download/v0.3.0/pica-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "90a78141f2bad4e970f6c87efc80594aaf529f3ce50ea656e683a4936f1844c9"
  end

  def install
    bin.install "pica"
    doc.install "README.md", "LICENSE"
    (pkgshare/"third_party").install "third_party/iterm2-themes", "third_party/rust"
  end

  test do
    assert_equal "pica #{version}\n", shell_output("#{bin}/pica --version")
    source = "# Homebrew\n\n- [ ] Keep source.\n"
    (testpath/"note.md").write(source)
    output = shell_output("#{bin}/pica --no-state --snapshot --theme dark #{testpath}/note.md")
    assert_match "Homebrew", output
    assert_equal source, (testpath/"note.md").read
    assert_match "Catppuccin Mocha", shell_output("#{bin}/pica --list-themes")
  end
end
