function fire
	nvim ./COMMIT_MSG
git commit -F ./COMMIT_MSG $argv
rm ./COMMIT_MSG
end
