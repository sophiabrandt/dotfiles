function git-clean-br
git branch | egrep -v "(^\*|master|main|dev)" | xargs -r git branch -D
end
