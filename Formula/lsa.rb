class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.7.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.0/lsa-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "fc6dfb8614f7ef33610a09392ff495469251a53e7699f89aac19c9ee5c8f22d3"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.0/lsa-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "70c1ac00fe10ffd9285a877f49bd664162a6d8fdee3090ef99abfe0e610b7c43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.0/lsa-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "85a169e6f858bff920f5e0276e39142ca77ca5ca864da4c9c95d4d3a80d0a722"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.7.0/lsa-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73f371fe198fa449196cd3cd08eb8bc60c6afc9f4b228ed28ce05751fa4b949c"
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
