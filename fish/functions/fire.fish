# Defined in - @ line 1
function fire --description 'alias fire nvim ./COMMIT_MSG && git commit -F ./COMMIT_MSG   && rm ./COMMIT_MSG'
	nvim ./COMMIT_MSG && git commit -F ./COMMIT_MSG   && rm ./COMMIT_MSG $argv;
end
