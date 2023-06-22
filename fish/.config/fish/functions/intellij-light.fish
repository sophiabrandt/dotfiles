function intellij-light
	kitty +kitten themes --reload-in=all Intellij Light
	echo -e 'colorscheme intellij\nset background=light' > ~/.vim/custom/colorscheme.vim
end
