class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.3.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.0/lsa-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca850adfc65c290da94d28fbca641dd57f5ab72d67fa78051a1cec09d32f2888"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.0/lsa-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "0b964549070d418f5e57c7dd4a861b27952b46a6a6fce279b0e8227a40486cc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.0/lsa-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4ae935cbc092a4b7df930a6a17a4052377ac2080123eb656c7e1deecbb266ec4"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.0/lsa-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "34e4427c9cd606cc732e799f931b86671b0e6abdbef6638f4ad6fcb2889c579a"
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
