function intellij-light
	kitty +kitten themes --reload-in=all Intellij Light
	echo -e 'colorscheme intellij\nset background=light' > ~/.vim/custom/colorscheme.vim
	sed -e '1 c\colorscheme base16_default_light' ~/.config/helix/config.toml > ~/.config/helix/config.toml.tmp && mv ~/.config/helix/config.toml.tmp ~/.config/helix/config.toml
end
