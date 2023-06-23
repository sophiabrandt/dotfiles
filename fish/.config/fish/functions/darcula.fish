function darcula
	kitty +kitten themes --reload-in=all darcula
	echo 'colorscheme darcula' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
		theme = "darcula"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
