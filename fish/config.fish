set -g -x fish_greeting ''

# fnm for node management
fnm env --multi | source

# opam configuration
source /home/owlhoot/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf
source ~/.asdf/asdf.fish

# zoxide
zoxide init fish | source

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
