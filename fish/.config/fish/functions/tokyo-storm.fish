function tokyo-storm
	kitty +kitten themes --reload-in=all Tokyo Night Storm
	echo -e 'colorscheme tokyonight-storm' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
		theme = "tokyonight"_storm' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
