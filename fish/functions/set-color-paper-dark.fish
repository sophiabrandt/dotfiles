function set-color-paper-dark
	kitty @ set-colors --all ~/.config/kitty/papercolor-kitty/papercolor-dark.conf
sed -e '1 c\colorscheme PaperColor' -e '/let/c\let g:lightline.colorscheme="PaperColor"' -e '$d' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
