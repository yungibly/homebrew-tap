class Qpic < Formula
  desc "Terminal image viewer you zoom and pan with the mouse"
  homepage "https://github.com/yungibly/qpic"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/qpic/releases/download/v0.1.0/qpic-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d78469a4d1150aa95a81ab40ab06d855605d42b8b2a03a81a36fb854b2c2693d"
    end
    on_intel do
      url "https://github.com/yungibly/qpic/releases/download/v0.1.0/qpic-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "859570f17bac087125f163f07732ac2b1be9860a7e569c6cbe2db46f95e24a6c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/yungibly/qpic/releases/download/v0.1.0/qpic-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "312fb636a183c24c0e97a080c64b7ecea9e2164ec4de2220fe0ec1d5c138d3a1"
  end

  def install
    bin.install "qpic"
    doc.install "README.md", "LICENSE"
    (pkgshare/"third_party").install "third_party/rust"
  end

  test do
    assert_equal "qpic #{version}\n", shell_output("#{bin}/qpic --version")
    assert_match "Usage: qpic", shell_output("#{bin}/qpic --help")
    assert_match "no images found", shell_output("#{bin}/qpic #{testpath} 2>&1", 1)
  end
end
