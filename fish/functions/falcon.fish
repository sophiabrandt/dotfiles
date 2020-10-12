# Defined in /home/owlhoot/.config/fish/functions/falcon.fish @ line 1
function falcon
	kitty @ set-colors -a -c ~/.config/kitty/falcon.conf
sed -e '1 c\colorscheme falcon' -e '2 c\let g:lightline.colorscheme="falcon"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
