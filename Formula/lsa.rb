class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.7.1"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.1/lsa-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "e0a015deb65479da3324e6f2c053d92088bfb51b71385c2f52685ede35dd33b5"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.1/lsa-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "0666b8b0fde9aa1d8b89f4a4857e39ecbedb2f145531ba484f92d1860d769241"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.1/lsa-0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c18a7e3458709088ddfd276f4ef5790f2e7c89a92382180645b842186f4cf90"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.1/lsa-0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b6df61492e3aba9201a62cc7b79877076a6a17b0c537fa27bfb31b4795b5e6f2"
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
