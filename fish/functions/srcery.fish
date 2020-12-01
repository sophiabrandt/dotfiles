function srcery
	kitty @ set-colors -a -c ~/.config/kitty/srcery.conf
sed -e '1 c\colorscheme srcery' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
