function github-light
	kitty +kitten themes --reload-in=all Github Light
	echo 'colorscheme github_light' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
theme = "github_light"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
