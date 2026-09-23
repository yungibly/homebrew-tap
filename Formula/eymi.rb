class Eymi < Formula
  desc "Terminal Markdown editor with live preview and familiar shortcuts"
  homepage "https://github.com/yungibly/eymi"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/eymi/releases/download/v0.2.0/eymi-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "71283d08aee87f8ee418e2ed120c85fc5dbf1310fef729cb3f849b9367ebda49"
    end
    on_intel do
      url "https://github.com/yungibly/eymi/releases/download/v0.2.0/eymi-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7f5d7a35460150be1adab14bc69425e1fde6d25217920372cfeef646cfd16800"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/eymi/releases/download/v0.2.0/eymi-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "12ade81c5ce097713415d870f459819b4dddc7d4cb2023f1a776e0ce8fd64001"
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
