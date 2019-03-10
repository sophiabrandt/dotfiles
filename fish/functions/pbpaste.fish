# Defined in - @ line 1
function pbpaste --description 'alias pbpaste xsel --clipboard --output'
	xsel --clipboard --output $argv;
end
