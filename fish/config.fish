set -g -x fish_greeting ''

# fnm for node management
fnm env --multi | source

# asdf for elixir/erlang
source ~/.asdf/asdf.fish

# opam configuration
source /home/owlhoot/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
