# Defined in /home/owlhoot/.config/fish/functions/forest-night.fish @ line 2
function forest-night
	kitty @ set-colors -a -c ~/.config/kitty/forest-night.conf
	sed -e '1 c\packadd! forest-night | colorscheme forest-night' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
