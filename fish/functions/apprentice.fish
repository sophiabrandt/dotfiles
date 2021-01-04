# Defined in /home/owlhoot/.config/fish/functions/apprentice.fish @ line 1
function apprentice
	set -Ux TMUX_THEME apprentice
	kitty @ set-colors -a -c ~/.config/kitty/apprentice.conf
	sed -e "116 c\# tpm plugin for nord theme" ~/.tmux.conf > ~/.tmux.conf.tmp && mv ~/.tmux.conf.tmp ~/.tmux.conf
	sed -e '1 c\colorscheme apprentice' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
