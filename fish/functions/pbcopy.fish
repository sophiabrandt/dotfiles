# Defined in - @ line 1
function pbcopy --description 'alias pbcopy xsel --clipboard --input'
	xsel --clipboard --input $argv;
end
