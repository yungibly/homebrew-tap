class Lsa < Formula
  desc "ls, augmented: colors, icons, and inline image thumbnails"
  homepage "https://github.com/yungibly/lsa"
  version "0.4.0"

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.4.0/lsa-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "e40c53d966b71f309ee7ce9bfedb04815f458df9bfaf33055d3f23adb0841627"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.4.0/lsa-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f420019609bbdaad58fa53981981953695bb87906369405cc0f8f6742be4d876"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/lsa/releases/download/v0.4.0/lsa-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "befcfb47287446664ca0ef9c8f9168ac0e0b2cadfd6eb03fe157211aa9dd5402"
    end
    on_intel do
      url "https://github.com/yungibly/lsa/releases/download/v0.4.0/lsa-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24fdd010cb0619dda9cf98d255c657dc2d05e8588b00bd21087e6077b47fa2c7"
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
