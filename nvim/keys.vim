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

" New Tab
noremap <c-t> :<c-u>tabnew<cr>

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-v><esc> <esc>
endif

" <leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>

" Grip (Preview Markdown)
nnoremap <silent> <leader>mp :<c-u>!grip % -b<cr>

" Quit help files
" type q to exit
autocmd Filetype help nnoremap <buffer> q :q<cr>

" Find with :Rg
nnoremap <leader>rg :<c-u>Rg<cr>

" replace f and t with one-character vim sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Split edit your vimrc. Type space, v, r in sequence to trigger
nnoremap <leader>vr :<c-u>tabedit $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nnoremap <leader>so :<c-u>source $MYVIMRC<cr>
" General Config
nnoremap <leader>vg :<c-u>tabedit ~/.config/nvim/general.vim<cr>
" Packages
nnoremap <leader>vm :<c-u>tabedit ~/.config/nvim/packages.vim<cr>
" Plugins
nnoremap <leader>vp :<c-u>tabedit ~/.config/nvim/plugins.vim<cr>
" Keys
nnoremap <leader>vk :<c-u>tabedit ~/.config/nvim/keys.vim<cr>

" FZF
nnoremap <c-p> :<c-u>FZF<cr>

" NVIM-TYPESCRIPT
nnoremap <leader>tsd :<c-u>TSDoc<cr>
nnoremap <leader>tsp :<c-u>TSDefPreview<cr>
nnoremap <leader>tsf :<c-u>TSTypeDef<cr>
nnoremap <leader>tst :<c-u>TSType<cr>
nnoremap <leader>tsr :<c-u>TSRefs<cr>
nnoremap <leader>tse :<c-u>TSEditConfig<cr>

" ALE
nnoremap <Leader>ad :<c-u>ALEGoToDefinition<CR>
nnoremap <leader>af :<c-u>ALEFix<cr>
nnoremap <Leader>ar :<c-u>ALEFindReferences<CR>
"Move between linting errors
nnoremap ]r :<c-u>ALENextWrap<CR>
nnoremap [r :<c-u>ALEPreviousWrap<CR>
