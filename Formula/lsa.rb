class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.6.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.6.0/lsa-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "87ed9e0d2e105ae0a7528de9f44ed14557535f97075cd40494cc96243600c31f"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.6.0/lsa-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "789d4ca113012a7af82e478f9a5e52d94704c0d783e9e416b691a3d86b6dc0ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.6.0/lsa-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1e41582bca898be98b775f4fa3be543cbb47cccd5a7ace5cd5cfb781ea6dfd35"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.6.0/lsa-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "62401062a0645d7112f859ce50c3021ef9a3986da0a4b1ae47fcb3d511418948"
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
