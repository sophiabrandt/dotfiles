" https://learnvimscriptthehardway.stevelosh.com/chapters/38.html
let g:loclist_is_open = 0

function! loclist#Toggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
        execute g:loclist_return_to_window . "wincmd w"
    else
        let g:loclist_return_to_window = winnr()
        lopen
        let g:loclist_is_open = 1
    endif
endfunction
