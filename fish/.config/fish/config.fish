set -g -x fish_greeting ''

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# zoxide
zoxide init fish | source

# tmux-sessionizer
bind \cf tmux-sessionizer