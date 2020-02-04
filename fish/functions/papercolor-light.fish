function papercolor-light
	kitty @ set-colors -a -c ~/.config/kitty/papercolor-kitty/papercolor-light.conf
sed -e '1 c\colorscheme PaperColor' -e '2a set background=light' -e '2 c\let g:lightline.colorscheme="PaperColor"' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
