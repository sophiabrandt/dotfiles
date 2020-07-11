# Defined in - @ line 1
function vimdiff --wraps='nvim -d' --description 'alias vimdiff=nvim -d'
  nvim -d $argv;
end
