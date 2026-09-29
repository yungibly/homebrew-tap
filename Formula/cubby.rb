class Cubby < Formula
  desc "Keep copies of your dotfiles in a store that mirrors your home directory"
  homepage "https://github.com/yungibly/cubby"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v3.0.0/cubby-3.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "55d1c21e630ed136e45e5ad775f52393fdd64cfb688028179d4020e46bb197a7"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v3.0.0/cubby-3.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "7e6bb58dfaacbb89dc720e9a727d10c6862287b7adab6fe6b2ee9686abb7f396"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yungibly/cubby/releases/download/v3.0.0/cubby-3.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "89133b11bb5b27dec44f493a2f03dac74c50a1e89d4a4ae5fe886771cfd6b420"
    end
    on_intel do
      url "https://github.com/yungibly/cubby/releases/download/v3.0.0/cubby-3.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a9de2523967bebe90fc799429bd054c2db6903f060168d94e7eeee6c387d8d4"
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
