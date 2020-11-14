# Defined in /home/owlhoot/.config/fish/functions/falcon.fish @ line 1
function falcon
	kitty @ set-colors -a -c ~/.config/kitty/falcon.conf
sed -e '1 c\colorscheme falcon' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
