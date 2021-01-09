# Defined in /home/owlhoot/.config/fish/functions/apprentice.fish @ line 2
function apprentice
	kitty @ set-colors -a -c ~/.config/kitty/apprentice.conf
	sed -e '1 c\colorscheme apprentice' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
