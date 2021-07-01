# Defined in $HOME/.config/fish/functions/forest-night.fish @ line 2
function everforest
	kitty @ set-colors -a -c ~/.config/kitty/everforest.conf
	echo -e 'packadd! everforest\ncolorscheme everforest' > ~/.vim/custom/colorscheme.vim
end
