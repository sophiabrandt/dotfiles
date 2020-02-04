function set-color-paper-light
	kitty @ set-colors --all ~/.config/kitty/papercolor-kitty/papercolor-light.conf
sed -e '1 c\colorscheme PaperColor' -e '/let/c\let g:lightline.colorscheme="PaperColor"' -e '$ a set background=light' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
