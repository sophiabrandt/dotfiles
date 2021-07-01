# Defined in $HOME/.config/fish/functions/falcon.fish @ line 1
function falcon
	kitty @ set-colors -a -c ~/.config/kitty/falcon.conf
	echo 'colorscheme falcon' > ~/.vim/custom/colorscheme.vim
end
