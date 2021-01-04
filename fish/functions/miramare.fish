# Defined in /home/owlhoot/.config/fish/functions/miramare.fish @ line 1
function miramare
	set -Ux TMUX_THEME gruvbox
	kitty @ set-colors -a -c ~/.config/kitty/gruvbox.conf
	sed -e "117 c\# tpm plugin for nord theme" ~/.tmux.conf > ~/.tmux.conf.tmp && mv ~/.tmux.conf.tmp ~/.tmux.conf
	sed -e '1 c\colorscheme miramare' ~/.vim/custom/colorscheme.vim > ~/.vim/custom/colorscheme.vim.tmp && mv ~/.vim/custom/colorscheme.vim.tmp ~/.vim/custom/colorscheme.vim
end
