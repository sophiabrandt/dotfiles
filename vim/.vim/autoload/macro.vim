" visually select @ to run macro on all lines
function! macro#ExecuteOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

