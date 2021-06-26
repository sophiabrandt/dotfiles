# Defined interactively
function mkfile
mkdir -p (dirname $argv) && touch $argv
end
