" LEADER SHORTCUTS
" leader is space
let mapleader=" "
nnoremap <space> <nop>
" localleader is comma
let maplocalleader=","
nnoremap , <nop>

" swap semicolon and colon in normal mode to enter command mode more easily
nnoremap ; :
nnoremap : ;

" movement
nnoremap j gj
nnoremap k gk

" xx is escape in insert mode
inoremap xx <esc>

" jump to start of line and end of line
inoremap <c-a> <c-o>^
nnoremap B ^
inoremap <c-e> <c-o>$
nnoremap E $

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-v><esc> <esc>
endif

" NEOTERM
" <leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>
" REPLSend
nnoremap <leader>trf :<c-u>TREPLSendFile<cr>
nmap <leader>trs <plug>(neoterm-repl-send)
nmap <leader>trl <plug>(neoterm-repl-send-line)

" Grip (Preview Markdown)
nnoremap <silent> <leader>mp :<c-u>!grip % -b<cr>

" Quit help files
" type q to exit
autocmd Filetype help nnoremap <buffer> q :q<cr>

" Find with :Rg
nnoremap <leader>rg :<c-u>Rg<cr>

" replace f and t with one-character vim sneak
map f <plug>Sneak_f
map F <plug>Sneak_F
map t <plug>Sneak_t
map T <plug>Sneak_T

" Split edit your vimrc. Type space, v, r in sequence to trigger
nnoremap <leader>vr :<c-u>e $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nnoremap <leader>so :<c-u>source $MYVIMRC<cr>
" General Config
nnoremap <leader>vg :<c-u>e ~/.config/nvim/general.vim<cr>
" Packages
nnoremap <leader>vm :<c-u>e ~/.config/nvim/packages.vim<cr>
" Plugins
nnoremap <leader>vp :<c-u>e ~/.config/nvim/plugins.vim<cr>
" Keys
nnoremap <leader>vk :<c-u>e ~/.config/nvim/keys.vim<cr>

" FZF
nnoremap <c-p> :<c-u>FZF<cr>
nnoremap <leader>bb :<c-u>Buffers<cr>
nnoremap <leader>sn :<c-u>Snippets<cr>

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

" BUFFERS
" close the current buffer and move to the previous one
nnoremap <leader>bq :<c-u>bp <bar> bd #<cr>

" NVIM-TYPESCRIPT
nnoremap <leader>tsd :<c-u>TSDoc<cr>
nnoremap <leader>tsp :<c-u>TSDefPreview<cr>
nnoremap <leader>tsf :<c-u>TSTypeDef<cr>
nnoremap <leader>tst :<c-u>TSType<cr>
nnoremap <leader>tsr :<c-u>TSRefs<cr>
nnoremap <leader>tse :<c-u>TSEditConfig<cr>

" ALE
nnoremap <leader>ad :<c-u>ALEGoToDefinition<cr>
nnoremap <leader>af :<c-u>ALEFix<cr>
nnoremap <leader>al :<c-u>ALELint<cr>
nnoremap <Leader>ar :<c-u>ALEFindReferences<cr>
"Move between linting errors
nnoremap ]r :<c-u>ALENextWrap<cr>
nnoremap [r :<c-u>ALEPreviousWrap<cr>
