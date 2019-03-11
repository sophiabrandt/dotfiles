" LEADER SHORTCUTS
" leader is space
let mapleader=" "
nnoremap <space> <Nop>

" movement
nnoremap j gj
nnoremap k gk

" sx is escape in insert mode
inoremap sx <esc>

" jump to start of line and end of line
inoremap <c-a> <c-o>^
nnoremap B ^
inoremap <c-e> <c-o>$
nnoremap E $

" New Tab
noremap <c-t> :tabnew<cr>

" Quit help files
" type q to exit
autocmd Filetype help nnoremap <buffer> q :q<cr>

" Turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

"Split edit your vimrc. Type space, v, r in sequence to trigger
nnoremap <leader>vr :tabedit $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nnoremap <leader>so :source $MYVIMRC<cr>
" General Config
nnoremap <leader>vg :tabedit ~/.config/nvim/general.vim<cr>
" Packages
nnoremap <leader>vm :tabedit ~/.config/nvim/packages.vim<cr>
" Plugins
nnoremap <leader>vp :tabedit ~/.config/nvim/plugins.vim<cr>
" Keys
nnoremap <leader>vk :tabedit ~/.config/nvim/keys.vim<cr>

" FZF
nnoremap <c-p> :<c-u>FZF<cr>

" CLOJURE
" REPLSend
" If no visual selection, send safely
nnoremap <leader>ef :call REPLSendSafe()<cr>
" If there's a visual selection, just send it
vnoremap <leader>ef "ay:call REPLSend(@a)<cr>
" Send the entire buffer
nnoremap <leader>eb :call REPLSend("(load-file \"".expand('%:p')."\")")<cr>
" Get docs
nnoremap <leader>doc :call REPLSend("(clojure.repl/doc ".expand("<cword>").")")<cr>
" Jump to definition
nnoremap tt :exe “:tag “.SanitizeTag(expand(“<cword>”))
" Run tests in current namespace
nnoremap <leader>tb :norm gg,ef<cr>:call REPLSend("(require '[clojure.test]) (clojure.test/run-tests)")<cr>

" ALE
nnoremap <leader>af :ALEFix<cr>

"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
