function fahrenheit
	kitty @ set-colors -a -c ~/.config/kitty/kitty-themes/themes/IC_Orange_PPL.conf
sed -e '1 c\colorscheme fahrenheit' -e '2 c\let g:lightline.colorscheme="fahrenheit"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
