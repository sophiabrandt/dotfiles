# Defined in $HOME/.config/fish/functions/apprentice.fish @ line 2
function apprentice
	kitty @ set-colors -a -c ~/.config/kitty/apprentice.conf
	echo 'colorscheme apprentice' > ~/.vim/custom/colorscheme.vim
end
