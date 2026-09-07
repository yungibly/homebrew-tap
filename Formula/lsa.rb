class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.2.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.2.0/lsa-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "69248c06355c8652adcd9df64681f85310125f7f1d0b475739c280808b2157db"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.2.0/lsa-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "d67af1c88a55bf3f55346043a1af0eaf7f8b5251c19130a8b388905f6d709dde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.2.0/lsa-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "32562b8fc2d4e18b103c4c0260c526a2852a9bdfeaa673bedf257e82352b4d08"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.2.0/lsa-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0626d8c38b9878e3b86694b6b67a39eaa231d5ec37b5a4d907cd2246a3c6ac8e"
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
