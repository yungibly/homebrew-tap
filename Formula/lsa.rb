class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.3.1"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.1/lsa-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "1928bdd699421045d48c402a286b49f1e0b888777b77cc6c8dd35adb8e59e5b5"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.1/lsa-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "26db6da0b0b73b820e9c38c19fb740771f287e7f835a0dc8b050f7e426fcc124"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.1/lsa-0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5eb13e4c5cc9f48edc136c36cefff15e970034618325ce6c06e902450e33a7d"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.3.1/lsa-0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "353284cc83d17ecb19d53de8ad892dcacb9532fe65ceb11a8d4bbb14888d1caf"
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
