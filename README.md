# dotfiles

> dev setup with kitty, fish, helix, etc.

## OS

- macOS (ARM architecture) as main driver
- (deprecated} Manjaro Linux (Arch-derived distro), [i3 Community edition](https://manjaro.org/downloads/community/i3/)

## Terminal

- [kitty](https://sw.kovidgoyal.net/kitty/#)
- [tmux](https://github.com/tmux/tmux)
- [fish shell](https://fishshell.com/) with [fisher](https://github.com/jorgebucaran/fisher)

## Editor

- [Helix](https://helix-editor.com)
- [NeoVim](https://neovim.io/) via [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

_Note_: I have moved away from Vim. The config is still available as [vim](./vim).  
The [VIM config](vimrc) organization and setup is heavily inspired by [bluz71/dotfiles](https://github.com/bluz71/dotfiles/blob/master/vimrc).

## Look

- color scheme: [Nord][nord]
- font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)

## How to Install

I use [GNU Stow][stow] to symlink my files.

On macOS, install via Homebrew: `brew install stow`

After that, I run the setup script:

```bash
chmod +x setup.sh
./setup.sh
```

[nord]: https://www.nordtheme.com/
[stow]: https://www.gnu.org/software/stow/
