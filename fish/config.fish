set -g -x fish_greeting ''

# fnm for node management
fnm env --multi | source

# opam configuration
source /home/owlhoot/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# asdf
source ~/.asdf/asdf.fish
