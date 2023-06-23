function kanagawa
	kitty +kitten themes --reload-in=all Kanagawa
	echo 'colorscheme kanagawa' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
		theme = "kanagawa"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
