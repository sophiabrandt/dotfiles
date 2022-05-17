function tokyo-night
	kitty @set-colors -a -c ~/.config/kitty/themes/tokyo-night.conf
	echo -e 'let g:tokyonight_style="night"\ncolorscheme tokyonight' > ~/.vim/custom/colorscheme.vim
end
