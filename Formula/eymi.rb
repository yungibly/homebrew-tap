class Eymi < Formula
  desc "Terminal Markdown editor with live preview and familiar shortcuts"
  homepage "https://github.com/yungibly/eymi"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/eymi/releases/download/v0.2.1/eymi-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "d97528cd64362d25babcd66fd74d6e13522fbd3a96fb7b32e4c395ddd8464201"
    end
    on_intel do
      url "https://github.com/yungibly/eymi/releases/download/v0.2.1/eymi-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "f1af1953d0e199870d8ddca5ea1ae30879a3fc5131701c201b31174386335032"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/eymi/releases/download/v0.2.1/eymi-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d56d558f1debc6cba0d914e57664c2ecfa112ef5104bb8fbc4303f1acc5344e6"
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
