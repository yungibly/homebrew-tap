class Cubby < Formula
  desc "Keep copies of your dotfiles in a store that mirrors your home directory"
  homepage "https://github.com/yungibly/cubby"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v2.1.0/cubby-2.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "203a408951b280cd70a8eacdd262a53e220d0a11d235425d4f0efed4c46455e1"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v2.1.0/cubby-2.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f548df6b570055212f3f579dbb69618b3e5fe3ee366caa83749c3440ce403376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v2.1.0/cubby-2.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5e5d3e09c4a6ce6386826e8a100b13680e1ea3ded3b5c1bc7e58c8e04aec53d5"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v2.1.0/cubby-2.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4554c93e8ba83f0c40f1cee081b03e840e958946e0a85a192277a6032da71c7e"
    end
  end

  def install
    bin.install "cubby"
    bash_completion.install "completions/cubby.bash" => "cubby"
    zsh_completion.install "completions/cubby.zsh" => "_cubby"
    fish_completion.install "completions/cubby.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubby --version")
    ENV["CUBBY_HOME"] = testpath
    system bin/"cubby", "init"
    assert_predicate testpath/".dotfiles/.cubby.toml", :exist?
  end
end
