# Defined in /home/owlhoot/.config/fish/functions/forest-night.fish @ line 2
function everforest
	kitty @ set-colors -a -c ~/.config/kitty/everforest.conf
	sed -e '1 c\packadd! everforest | colorscheme everforest' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end