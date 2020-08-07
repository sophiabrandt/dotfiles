function oceanicnext
	kitty @ set-colors -a -c ~/.config/kitty/kitty-themes/themes/OneDark.conf
sed -e '1 c\colorscheme OceanicNext' -e '2 c\let g:lightline.colorscheme="oceanicnext"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
