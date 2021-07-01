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

mkdir -p .config/nvim
ln -s ~/dotfiles/nvim/init.vim .config/nvim/init.vim

mkdir .todo
# todo.sh config file needs to be a a hard link
ln dotfiles/todo.txt-cli/config      .todo/config
ln -s dotfiles/todo.txt-cli/addons   .todo.actions.d

mkdir -p .config/broot
ln -s dotfiles/broot/conf.toml .config/broot/conf.toml

ln -s ~/dotfiles/bin ~/.bin
