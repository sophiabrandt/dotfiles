function tokyo-day
	kitty +kitten themes --reload-in=all Tokyo Night Day
	echo -e 'colorscheme tokyonight-day\nset background=light' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
theme = "nord_light"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
