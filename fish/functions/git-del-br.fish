function git-del-br
git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D
end
