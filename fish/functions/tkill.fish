function tkill
for s in (tmux list-sessions | awk '{print \$1}' | rg ':' -r '' | fzy); tmux kill-session -t \$s; end
end
