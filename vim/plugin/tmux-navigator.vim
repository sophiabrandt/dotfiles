let g:tmux_navigator_no_mappings = 1

if exists('$TMUX')
    nnoremap <silent> <M-k> :TmuxNavigateUp<Cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<Cr>
    nnoremap <silent> <M-h> :TmuxNavigateLeft<Cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<Cr>
    " nnoremap <silent> <C-t><C-p> :TmuxNavigatePrevious<Cr>
endif

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
