function intellij-light
	kitty @ set-colors -a -c ~/.config/kitty/intellij-light.conf
	echo -e 'colorscheme intellij\nset background=light' > ~/.vim/custom/colorscheme.vim
end
