function nord
	kitty @ set-colors -a -c ~/.config/kitty/nord.conf
sed -e '1 c\colorscheme nord' -e '2 c\let g:lightline.colorscheme="nord"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
