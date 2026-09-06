class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.1.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.1.0/lsa-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7dc6f694929a72e682f862213efaf78cd2ed422ff4c3f6c2dc49da0a4e1b8523"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.1.0/lsa-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bb57b2794e45816841bcf1d624cfa69ffa531020b5091bd9ec75c823a9e822db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.1.0/lsa-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d294c35a08c98d0ee6e2a1074b98e161473c8847a74950335e99677401176e70"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.1.0/lsa-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3d8efc9c64442b50a74332f9e8f7b0e80e83265d054d40a9e168f108f2a06d0d"
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
