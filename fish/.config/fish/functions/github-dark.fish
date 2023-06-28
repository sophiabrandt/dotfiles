function github-dark
	kitty +kitten themes --reload-in=all Github Dark
	echo 'colorscheme github_dark' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\
theme = "github_dark"' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
