# Defined in /home/owlhoot/.config/fish/functions/forest-night.fish @ line 2
function everforest-light
	kitty @ set-colors -a -c ~/.config/kitty/everforest-light.conf
	echo -e 'packadd! everforest\ncolorscheme everforest\nset background=light' > ~/.vim/custom/colorscheme.vim
end
