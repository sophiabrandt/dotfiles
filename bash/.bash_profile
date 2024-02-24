#
# ~/.bash_profile
#

#[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
#[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi ;; esac

source /Users/me/.config/broot/launcher/bash/br

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.bash 2>/dev/null || :
