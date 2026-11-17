# homebrew-tap

Homebrew formulae for [yungibly](https://github.com/yungibly)'s tools.

```sh
brew tap yungibly/tap
brew install cubby
```

Or in one step: `brew install yungibly/tap/cubby`.

## Tools

| Formula | What it does |
| --- | --- |
| [`cubby`](https://github.com/yungibly/cubby) | Keeps copies of your dotfiles in a store that mirrors your home directory. |
| [`clibrightness`](https://github.com/yungibly/clibrightness) | Controls ASUS PA249CGV brightness over native USB-C on Apple Silicon macOS. |
| [`lsa`](https://github.com/yungibly/lsa) | ls, augmented: colors, icons, and inline image thumbnails. |
| [`pica`](https://github.com/yungibly/pica) | Small terminal text editor in the nano and micro family, with Markdown rendered as you write. |

Install pica with `brew install yungibly/tap/pica`.

Install lsa with `brew install yungibly/tap/lsa`.

Install clibrightness with `brew install yungibly/tap/clibrightness` (macOS Tahoe
or later, Apple Silicon).

Each formula is written and updated by its own project's release workflow when a
version is tagged, so the files in `Formula/` are never edited by hand.
