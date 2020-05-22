# Defined in /home/owlhoot/.config/fish/functions/iceberg.fish @ line 1
function iceberg
	kitty @ set-colors -a -c ~/.config/kitty/iceberg.conf
sed -e '1 c\colorscheme iceberg' -e '2 c\let g:lightline.colorscheme="iceberg"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
