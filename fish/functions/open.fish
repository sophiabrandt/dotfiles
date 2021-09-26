function open
switch (uname)
case Linux
xdg-open $argv
case Darwin
open $argv
end
end
