class Cubby < Formula
  desc "Keep copies of your dotfiles in a store that mirrors your home directory"
  homepage "https://github.com/yungibly/cubby"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v2.0.1/cubby-2.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "6473338c98217c3afc4d23391bac5ba0448afc55f30a87bda960f09ad11877b5"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v2.0.1/cubby-2.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "412fbd1364edee1fad3805729a18a79501ab62ad7fe73cb35f232907ed5abf74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v2.0.1/cubby-2.0.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "659cea9d52eb40de60dc5feafb7a2b9ea37720a0ac41e5466bfacb2dc90239ef"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v2.0.1/cubby-2.0.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f5bb11dcf950417deee5bf6c27ccfaaef0dbbfc23f6becc84501bbe3c30bc5a"
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
