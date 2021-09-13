function git-clean-merged
git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs -r git branch -D
end
