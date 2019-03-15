" LEADER SHORTCUTS
" leader is space
let mapleader=" "
nnoremap <space> <nop>
" localleader is comma
let maplocalleader=","
nnoremap , <nop>

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
noremap <c-t> :tabnew<cr>

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" <leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>

" Grip (Preview Markdown)
nnoremap <silent> <leader>mp :!grip % -b<cr>

" Quit help files
" type q to exit
autocmd Filetype help nnoremap <buffer> q :q<cr>

" Find with :Rg
nnoremap <leader>rg :Rg<cr>

" replace f and t with one-character vim sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Split edit your vimrc. Type space, v, r in sequence to trigger
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

" ALE
nnoremap <leader>af :ALEFix<cr>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
