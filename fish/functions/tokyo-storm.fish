function tokyo-storm
	kitty @ set-colors -a -c ~/.config/kitty/themes/tokyo-storm.conf
	echo -e 'let g:tokyonight_style="storm"\ncolorscheme tokyonight' > ~/.vim/custom/colorscheme.vim
end
