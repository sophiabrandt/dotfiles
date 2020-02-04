function papercolor-dark
	kitty @ set-colors -a -c ~/.config/kitty/papercolor-kitty/papercolor-dark.conf
sed -e '1 c\colorscheme PaperColor' -e '2 c\let g:lightline.colorscheme="PaperColor"' -e '3d' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
