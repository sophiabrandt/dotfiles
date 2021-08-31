# Defined interactively
function mktouch
mkdir -p (dirname $argv) && touch $argv
end
