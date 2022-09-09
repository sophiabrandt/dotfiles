#!/bin/sh

cd ~
ln -s dotfiles/bash/bash_profile    .bash_profile
ln -s dotfiles/bash/bashrc          .bashrc
ln -s dotfiles/bash/profile         .profile
ln -s dotfiles/fish                 .config/fish
ln -s dotfiles/git/gitconfig        .gitconfig
ln -s dotfiles/git/gitignore_global .gitconfig
ln -s dotfiles/tmux/tmux.conf       .tmux.conf
ln -s dotfiles/kitty                .config/kitty
ln -s dotfiles/vim/                 .vim
ln -s dotfiles/vimrc                .vimrc
ln -s dotfiles/idea/ideavimrc       .ideavimrc
ln -s dotfiles/homebrew/Brewfile    Brewfile

mkdir -p .config/nvim
ln -s ~/dotfiles/nvim/init.vim .config/nvim/init.vim

mkdir -p .config/broot
ln -s ~/dotfiles/broot/conf.toml .config/broot/conf.toml

mkdir -p .config/helix
ln -s ~/dotfiles/helix/config.toml .config/helix/config.toml
ln -s ~/dotfiles/helix/languages.toml .config/helix/languages.toml

ln -s ~/dotfiles/bin .bin
