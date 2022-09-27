#
# ~/.bash_profile
#

#[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
#[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# disable interpreting <ctrl+s> as signal for stopping terminal updates
stty -ixon

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# add keychain only on Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval $(keychain --eval --quiet --nogui --noask github gitlab)
fi

# Fish
# drop into fish if parent process is NOT fish
# invoke `bash` from fish with `bash` (sources `~/.bashrc`)
if [[ $(ps -p $PPID -o command | tail -n +2) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
  exec fish
fi
