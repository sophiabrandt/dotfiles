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
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export HELIX_RUNTIME="$HOME/src/helix/runtime"
export BASH_SILENCE_DEPRECATION_WARNING=1
if command -v go &>/dev/null; then
    export GOPATH="$HOME/.go"
    export PATH="$PATH:$(go env GOPATH)/bin"
fi
# dotnet 6
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"


# grapheasy
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# add keychain only on Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	eval $(keychain --eval --quiet --nogui --noask github gitlab)
fi

# check if fish is installed
if ! command -v fish &> /dev/null; then
  echo "Fish shell is not installed."
  return
fi

# check if the current shell is interactive
if [[ $- != *i* ]]; then
  return
fi

# get the name of the parent shell process
parent_shell=$(ps -p $PPID -o comm=)

# check if the parent shell is not fish or a subshell
if [[ "$parent_shell" != "fish" ]] && [[ "$parent_shell" != "bash" ]] && [[ "$parent_shell" != "zsh" ]]; then
  # check if the current shell is not fish or a subshell
  if [[ "$0" != "fish" ]] && [[ "$0" != "-fish" ]] && [[ "$0" != "/usr/bin/fish" ]] && [[ "$0" != "/opt/homebrew/bin/fish" ]]; then
    exec fish
  fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source /Users/me/.config/broot/launcher/bash/br
