let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-k> :TmuxNavigateUp<Cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<Cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<Cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<Cr>
nnoremap <silent> <C-t><C-p> :TmuxNavigatePrevious<Cr>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
