class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.5.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.5.0/lsa-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "42a0c6f306b2945c086397888f6edb47f420358c5fe3542af8fed5c4d7ed31c9"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.5.0/lsa-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "e199b8c8877a08feb635369017129eb347734640c255f5b1b7d9fe4c8f105264"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.5.0/lsa-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cf3b0e89f853aebad6de66b6ccf81f45684e33e4b2994eaa49cdfaf5bbeba3db"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.5.0/lsa-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "75b569e7ca2499bbb0d1d76899934ba1e36d1ceb3026f454aff068ae3fdf72ae"
    end
  end

  def install
    bin.install "bin/lsa"
    doc.install "README.txt", "HELP.txt", "BUILD.txt"
  end

  test do
    assert_equal "lsa #{version}\n", shell_output("#{bin}/lsa --version")
    (testpath/"listing/folder").mkpath
    (testpath/"listing/photo.png").write "text fallback"
    assert_equal "folder\nphoto.png\n", shell_output("#{bin}/lsa #{testpath}/listing")
  end
end
