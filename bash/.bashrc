#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# disable interpreting <ctrl+s> as signal for stopping terminal updates
stty -ixon

#source /home/owlhoot/.config/broot/launcher/bash/br
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"

# add keychain only on Linux
# setup aliases for MacOs
if [[ "$OSTYPE" == "darwin"* ]]; then
	alias xdg-open="open"
else
	eval $(keychain --eval --quiet --nogui --noask github gitlab)
fi

# alias docker-compose to v2
alias docker-compose="docker compose"

# Fish
# drop into fish if parent process is NOT fish
# invoke `bash` from fish with `bash` (sources `~/.bashrc`)
if [[ $(ps -p $PPID -o command | tail -n +2) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
  exec fish
  echo 'fish shell'
fi
