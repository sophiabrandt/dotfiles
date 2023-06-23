function nord
	kitty +kitten themes --reload-in=all Nord
	echo 'colorscheme nord' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
theme = "nord"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
