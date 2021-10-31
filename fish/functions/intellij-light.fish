function intellij-light
	kitty @ set-colors -a -c ~/.config/kitty/themes/intellij-light.conf
	echo -e 'colorscheme intellij\nset background=light' > ~/.vim/custom/colorscheme.vim
end
