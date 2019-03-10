" RUNTIMEPATH
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" CONFIG FILES
source ~/.config/nvim/general.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/packages.vim
source ~/.config/nvim/keys.vim
