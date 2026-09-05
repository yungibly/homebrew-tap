class Clibrightness < Formula
  desc "Brightness-only control for ASUS PA249CGV over native USB-C on Apple Silicon"
  homepage "https://github.com/yungibly/clibrightness"
  url "https://github.com/yungibly/clibrightness/releases/download/v0.1.0/clibrightness-0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "aa641673e4a3e61e33d4ef46c44edbc43efef494f8046bb2187d9b6096af7997"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "clibrightness"
  end

  test do
    # Help and invalid arguments return before display discovery or device IO.
    assert_match "Only ASUS PA249CGV", shell_output("#{bin}/clibrightness --help")
    assert_match "0 to 400", shell_output("#{bin}/clibrightness set 401 2>&1", 2)
  end
end
