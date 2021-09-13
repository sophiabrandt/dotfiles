function git-clean-br
git for-each-ref --format '%(refname:short)' refs/heads | grep -v $argv | xargs git branch -D
end
