function set-color-nord
	kitty @ set-colors --all ~/.config/kitty/nord.conf
sed -e '1 c\colorscheme nord' -e '/let/c\let g:lightline.colorscheme="nord"' -e '$d' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
