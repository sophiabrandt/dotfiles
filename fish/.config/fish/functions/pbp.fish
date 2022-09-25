# Defined in - @ line 1
function pbp --description 'alias pbp xsel --clipboard --output'
	xsel --clipboard --output $argv;
end
