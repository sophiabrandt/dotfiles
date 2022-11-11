set -g -x fish_greeting ''

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# zoxide
zoxide init fish | source

# tmux-sessionizer
bind \cf tmux-sessionizer

switch (uname)
  case Darwin
    alias xdg-open='open &>/dev/null'
    alias pbc=pbcopy
    alias pbp=pbpaste
  case Linux
    alias open='xdg-open &>/dev/null'
    alias pbcopy=pbc
    alias pbpaste=pbp
end
