set -g -x fish_greeting ''

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# zoxide
zoxide init fish | source

# starship
starship init fish | source

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

# abbreviations
abbr -a -- cn 'colima nerdctl' # imported from a universal variable, see `help abbr`
abbr -a -- gam 'git commit --amend' # imported from a universal variable, see `help abbr`
abbr -a -- gai 'git add -i' # imported from a universal variable, see `help abbr`
abbr -a -- ee 'nvim (fd | fzy)' # imported from a universal variable, see `help abbr`
abbr -a -- fe 'hx (fd | fzy)' # imported from a universal variable, see `help abbr`
abbr -a -- gmg 'git merge' # imported from a universal variable, see `help abbr`
abbr -a -- hs 'history search' # imported from a universal variable, see `help abbr`
abbr -a -- - 'cd -' # imported from a universal variable, see `help abbr`
abbr -a -- cl colima # imported from a universal variable, see `help abbr`
abbr -a -- p pnpm # imported from a universal variable, see `help abbr`
abbr -a -- d docker # imported from a universal variable, see `help abbr`
abbr -a -- dc 'docker compose' # imported from a universal variable, see `help abbr`
abbr -a -- gcf 'git cdd fire' # imported from a universal variable, see `help abbr`
abbr -a -- gd 'git pull' # imported from a universal variable, see `help abbr`
abbr -a -- pd podman # imported from a universal variable, see `help abbr`
abbr -a -- dv devbox # imported from a universal variable, see `help abbr`
abbr -a -- gc 'git commit' # imported from a universal variable, see `help abbr`
abbr -a -- np npx # imported from a universal variable, see `help abbr`
abbr -a -- ex exit # imported from a universal variable, see `help abbr`
abbr -a -- gfom 'git fetch origin master' # imported from a universal variable, see `help abbr`
abbr -a -- kn kind # imported from a universal variable, see `help abbr`
abbr -a -- gst 'git status -sb' # imported from a universal variable, see `help abbr`
abbr -a -- g git # imported from a universal variable, see `help abbr`
abbr -a -- ga 'git add' # imported from a universal variable, see `help abbr`
abbr -a -- gaim 'git cdd aim' # imported from a universal variable, see `help abbr`
abbr -a -- gpl 'git pull' # imported from a universal variable, see `help abbr`
abbr -a -- gbr 'git branch' # imported from a universal variable, see `help abbr`
abbr -a -- kz kustomize # imported from a universal variable, see `help abbr`
abbr -a -- ll 'exa -la' # imported from a universal variable, see `help abbr`
abbr -a -- gapn 'git add --intent-to-add . && git add --patch' # imported from a universal variable, see `help abbr`
abbr -a -- gsw 'git switch' # imported from a universal variable, see `help abbr`
abbr -a -- gap 'git add -p' # imported from a universal variable, see `help abbr`
abbr -a -- gbrk 'git brk' # imported from a universal variable, see `help abbr`
abbr -a -- hr 'history merge' # imported from a universal variable, see `help abbr`
abbr -a -- gcdd 'git cdd' # imported from a universal variable, see `help abbr`
abbr -a -- gcr 'git cdd forget' # imported from a universal variable, see `help abbr`
abbr -a -- gcm 'git commit -m' # imported from a universal variable, see `help abbr`
abbr -a -- gcs 'git cdd status' # imported from a universal variable, see `help abbr`
abbr -a -- h hx # imported from a universal variable, see `help abbr`
abbr -a -- gdf 'git df' # imported from a universal variable, see `help abbr`
abbr -a -- gca 'git cdd amend' # imported from a universal variable, see `help abbr`
abbr -a -- gdif 'git diff' # imported from a universal variable, see `help abbr`
abbr -a -- gfix 'git fix' # imported from a universal variable, see `help abbr`
abbr -a -- gft 'git fetch' # imported from a universal variable, see `help abbr`
abbr -a -- bd buildah # imported from a universal variable, see `help abbr`
abbr -a -- gfu 'git fetch upstream' # imported from a universal variable, see `help abbr`
abbr -a -- ca cargo # imported from a universal variable, see `help abbr`
abbr -a -- n npm # imported from a universal variable, see `help abbr`
abbr -a -- gim 'git imp' # imported from a universal variable, see `help abbr`
abbr -a -- gin 'git add -N .' # imported from a universal variable, see `help abbr`
abbr -a -- gp 'git push' # imported from a universal variable, see `help abbr`
abbr -a -- gpo 'git pull origin' # imported from a universal variable, see `help abbr`
abbr -a -- gpu 'git pull upstream' # imported from a universal variable, see `help abbr`
abbr -a -- grb 'git rebase' # imported from a universal variable, see `help abbr`
abbr -a -- gco 'git checkout' # imported from a universal variable, see `help abbr`
abbr -a -- grs 'git reset' # imported from a universal variable, see `help abbr`
abbr -a -- gtst 'git tst' # imported from a universal variable, see `help abbr`
abbr -a -- kb kubectl # imported from a universal variable, see `help abbr`
abbr -a -- hd 'history delete' # imported from a universal variable, see `help abbr`
abbr -a -- gadn 'git add . && git diff --cached' # imported from a universal variable, see `help abbr`
abbr -a -- ls exa # imported from a universal variable, see `help abbr`
abbr -a -- gnew 'git new' # imported from a universal variable, see `help abbr`
abbr -a -- mk minikube # imported from a universal variable, see `help abbr`
abbr -a -- mkb 'minicube kubectl --' # imported from a universal variable, see `help abbr`
abbr -a -- gdoc 'git doc' # imported from a universal variable, see `help abbr`
abbr -a -- tls 'tmux ls' # imported from a universal variable, see `help abbr`
abbr -a -- mkt mktouch # imported from a universal variable, see `help abbr`
abbr -a -- dm docker-machine # imported from a universal variable, see `help abbr`
abbr -a -- mpsp 'mpv --speed=2.5 --af=rubberband=pitch-scale=0.981818181818181' # imported from a universal variable, see `help abbr`
abbr -a -- nd nerdctl # imported from a universal variable, see `help abbr`
abbr -a -- grlz 'git rlz' # imported from a universal variable, see `help abbr`
abbr -a -- glst 'git last' # imported from a universal variable, see `help abbr`
abbr -a -- e nvim # imported from a universal variable, see `help abbr`
abbr -a -- nvimin 'nvim -u /home/owlhoot/dotfiles/minimalvimrc --noplugin' # imported from a universal variable, see `help abbr`
abbr -a -- pe 'pnpm exec' # imported from a universal variable, see `help abbr`
abbr -a -- px 'pnpm dlx' # imported from a universal variable, see `help abbr`
abbr -a -- t tmux # imported from a universal variable, see `help abbr`
abbr -a -- ta 'tmux new-session -As' # imported from a universal variable, see `help abbr`
abbr -a -- tma 'tmux new-session -As' # imported from a universal variable, see `help abbr`
abbr -a -- tn 'tmux new -t' # imported from a universal variable, see `help abbr`
abbr -a -- yd 'youtubedr download' # imported from a universal variable, see `help abbr`
abbr -a -- v nvim # imported from a universal variable, see `help abbr`
abbr -a -- vi nvim # imported from a universal variable, see `help abbr`
abbr -a -- vimin 'vim -u /home/owlhoot/dotfiles/minimalvimrc --noplugin' # imported from a universal variable, see `help abbr`
abbr -a -- y yarn # imported from a universal variable, see `help abbr`
abbr -a -- lz lazygit
