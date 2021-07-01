# Defined in $HOME/.config/fish/functions/forest-night.fish @ line 2
function everforest-dark
	kitty @ set-colors -a -c ~/.config/kitty/everforest-dark.conf
	echo -e 'packadd! everforest\ncolorscheme everforest' > ~/.vim/custom/colorscheme.vim
end
