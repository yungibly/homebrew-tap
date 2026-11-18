class Pica < Formula
  desc "Small terminal text editor with micro-style keys and live Markdown"
  homepage "https://github.com/yungibly/pica"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/pica/releases/download/v0.3.1/pica-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "52215253aca11a6afeed57a9e899ab5663f7c701fd2d522a72827510fee4f9e0"
    end
    on_intel do
      url "https://github.com/yungibly/pica/releases/download/v0.3.1/pica-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "9e28519a3f501201a0a85b93a425ef6ca851a78cdd97118103e8d3ed3dd0567d"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/pica/releases/download/v0.3.1/pica-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "53788db1640014770c6aa01899490bd3676ec80539aae3bec986a26711ae1c5a"
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
