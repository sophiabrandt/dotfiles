set -g -x fish_greeting ''

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# zoxide
zoxide init fish | source

# tmux-sessionizer
bind \cf tmux-sessionizer

switch (uname)
  case Darwin
    alias xdg-open='open &>/dev/null'
  case Linux
    alias open='xdg-open &>/dev/null'
    alias pbcopy=xsel --clipboard --input $argv;
    alias pbpaste=xsel --clipboard --output $argv;
end

# dotnet
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

# direnv
direnv hook fish | source

# abbreviations
abbr -a -- - 'cd -' 
abbr -a -- b bun
abbr -a -- bx bunx
abbr -a -- bd buildah 
abbr -a -- ca cargo 
abbr -a -- cl colima 
abbr -a -- cn 'colima nerdctl' 
abbr -a -- d docker 
abbr -a -- dc 'docker compose' 
abbr -a -- dt 'dotnet'
abbr -a -- dy 'dig +noall +answer +additional $argv @dns.toys'
abbr -a -- dm docker-machine 
abbr -a -- dv devbox 
abbr -a -- e nvim 
abbr -a -- ee 'nvim (fd | fzy)' 
abbr -a -- ex exit 
abbr -a -- g git 
abbr -a -- ga 'git add' 
abbr -a -- gadn 'git add . && git diff --cached' 
abbr -a -- gai 'git add -i' 
abbr -a -- gaim 'git cdd aim' 
abbr -a -- gam 'git commit --amend' 
abbr -a -- gap 'git add -p' 
abbr -a -- gapn 'git add --intent-to-add . && git add --patch' 
abbr -a -- gbl 'git blame' 
abbr -a -- gbr 'git branch' 
abbr -a -- gbrk 'git brk' 
abbr -a -- gc 'git commit' 
abbr -a -- gca 'git cdd amend' 
abbr -a -- gcdd 'git cdd' 
abbr -a -- gcf 'git cdd fire' 
abbr -a -- gcm 'git commit -m' 
abbr -a -- gco 'git checkout' 
abbr -a -- gcr 'git cdd forget' 
abbr -a -- gcs 'git cdd status' 
abbr -a -- gd 'git pull' 
abbr -a -- gdf 'git df' 
abbr -a -- gdif 'git diff' 
abbr -a -- gdoc 'git doc' 
abbr -a -- gfix 'git fix' 
abbr -a -- gfom 'git fetch origin master' 
abbr -a -- gft 'git fetch' 
abbr -a -- gfu 'git fetch upstream' 
abbr -a -- gim 'git imp' 
abbr -a -- gin 'git add -N .' 
abbr -a -- glst 'git last' 
abbr -a -- gmg 'git merge' 
abbr -a -- gmt 'git mergetool' 
abbr -a -- gnew 'git new' 
abbr -a -- gp 'git push' 
abbr -a -- gpl 'git pull' 
abbr -a -- gpo 'git pull origin' 
abbr -a -- gpu 'git pull upstream' 
abbr -a -- grb 'git rebase' 
abbr -a -- grlz 'git rlz' 
abbr -a -- grs 'git reset' 
abbr -a -- gst 'git status -sb' 
abbr -a -- gsw 'git switch' 
abbr -a -- gtst 'git tst' 
abbr -a -- gu 'gitui' 
abbr -a -- h hx 
abbr -a -- hd 'history delete' 
abbr -a -- hr 'history merge' 
abbr -a -- hs 'history search' 
abbr -a -- kb kubectl 
abbr -a -- kn kind 
abbr -a -- kz kustomize 
abbr -a -- ll 'eza -la' 
abbr -a -- ls eza 
abbr -a -- lz lazygit
abbr -a -- mk minikube 
abbr -a -- mkb 'minicube kubectl --' 
abbr -a -- mkt mktouch 
abbr -a -- mpsp 'mpv --speed=2.5 --af=rubberband=pitch-scale=0.981818181818181' 
abbr -a -- n npm 
abbr -a -- nd nerdctl 
abbr -a -- np npx 
abbr -a -- nt notes 
abbr -a -- nvimin 'nvim -u /home/owlhoot/dotfiles/minimalvimrc --noplugin' 
abbr -a -- p pnpm 
abbr -a -- pd podman 
abbr -a -- pe 'pnpm exec' 
abbr -a -- px 'pnpm dlx' 
abbr -a -- t tmux 
abbr -a -- ta 'tmux new-session -As' 
abbr -a -- tls 'tmux ls' 
abbr -a -- tma 'tmux new-session -As' 
abbr -a -- tn 'tmux new -t' 
abbr -a -- v nvim 
abbr -a -- vi nvim 
abbr -a -- vimin 'vim -u /home/owlhoot/dotfiles/minimalvimrc --noplugin' 
abbr -a -- y yarn 
abbr -a -- yd 'youtubedr download' 
