# Defined in /home/owlhoot/.config/fish/functions/spacecamp.fish @ line 2
function spacecamp
	set -Ux TMUX_THEME spacecamp
	kitty @ set-colors -a -c ~/.config/kitty/spacecamp.conf
	sed -e "116 c\# tpm plugin for nord theme" ~/.tmux.conf > ~/.tmux.conf.tmp && mv ~/.tmux.conf.tmp ~/.tmux.conf
	sed -e '1 c\colorscheme spacecamp' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
