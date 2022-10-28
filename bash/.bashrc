#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# disable interpreting <ctrl+s> as signal for stopping terminal updates
stty -ixon

alias ef="exec fish"

bind '"\C-f":"tmux-sessionizer\n"'

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# add keychain only on Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval $(keychain --eval --quiet --nogui --noask github gitlab)
fi

# Fish
# drop into fish if parent process is NOT fish
# invoke `bash` from fish with `bash` (sources `~/.bashrc`)
shellName=$(ps -p $PPID -o command | tail -n +2)
if [[ $shellName != "fish" && $shellName != *"devbox"* && -z ${BASH_EXECUTION_STRING} ]]
then
  exec fish
fi
