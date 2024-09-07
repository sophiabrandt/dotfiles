function brinfo --description 'fuzzy brew info'
    brew info --json --eval-all \E | jq -r '.[].name' \E | fzf --cycle --tmux --preview 'brew info {}' --color bg:#222222,preview-bg:#333333 --info=inline-right --ellipsis=… --tabstop=4 --highlight-line
end
