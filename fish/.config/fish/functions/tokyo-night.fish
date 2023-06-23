function tokyo-night
	kitty +kitten themes --reload-in=all Tokyo Night
	echo -e 'colorscheme tokyonight-night' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
theme = "tokyonight"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
