# Defined in /home/owlhoot/.config/fish/functions/spacecamp.fish @ line 1
function spacecamp
	kitty @ set-colors -a -c ~/.config/kitty/spacecamp.conf
sed -e '1 c\colorscheme spacecamp' -e '2 c\let g:lightline.colorscheme="wombat"' -e '3 c\ ' ~/.config/nvim/colorscheme.vim > ~/.config/nvim/colorscheme.vim.tmp && mv ~/.config/nvim/colorscheme.vim.tmp ~/.config/nvim/colorscheme.vim
end
