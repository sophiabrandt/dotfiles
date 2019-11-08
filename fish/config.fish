set -g -x fish_greeting ''
fnm env --multi | source

# opam configuration
source /home/owlhoot/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
