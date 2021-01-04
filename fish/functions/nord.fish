function nord
	set -Ux TMUX_THEME nord
	kitty @ set-colors -a -c ~/.config/kitty/nord.conf
	sed -e "117 c\set -g @plugin 'arcticicestudio/nord-tmux'" ~/.tmux.conf > ~/.tmux.conf.tmp && mv ~/.tmux.conf.tmp ~/.tmux.conf
	sed -e '1 c\colorscheme nord' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
