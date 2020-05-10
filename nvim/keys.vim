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
" move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" jump to start of line and end of line
inoremap <c-a> <c-o>^
nnoremap B ^
inoremap <c-e> <c-o>$
nnoremap E $

" undo & redo
nnoremap <F8> :<c-u>UndotreeToggle<cr>
nnoremap <F9> g-
nnoremap <F10> g+

" switch to sudo to override readonly
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" make . work with visually selected lines
vnoremap . :normal.<cr>

" replace word with default register
nnoremap <leader>rr "_diwP"
" paste from clipboard
nnoremap <leader>pp "+p
inoremap <c-p> :<c-u><c-o>"+p<cr>

" switch current working directory to project root
nnoremap <leader>crd :<c-u>ProjectRootCD<cr>
" switch to the directory of currently openend file
nnoremap <leader>cwd :<c-u>cd %:p:h<cr>

" maximize/minimize current tab
nnoremap <leader>tx :<c-u>tabedit %<cr>
nnoremap <leader>ti :<c-u>tabclose<cr>
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" ctrl+s to save file
nnoremap <silent><c-b> :<c-u>update<cr>
vnoremap <silent><c-b> <c-c>:update<cr>gv
inoremap <silent><c-b> <c-o>:update<cr>

" open/close Loclist and quickfix window
nnoremap <localleader>L :<c-u>lop<cr>
nnoremap <localleader>l :<c-u>lcl<cr>
nnoremap <localleader>Q :<c-u>cop<cr>
nnoremap <localleader>q :<c-u>ccl<cr>

" " Use ctrl-[hjkl] to navigate panes
" nmap <silent> <c-k> <c-w><up>
" nmap <silent> <c-j> <c-w><down>
" nmap <silent> <c-h> <c-w><left>
" nmap <silent> <c-l> <c-w><right>

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  " use esc to exit terminal mode
  tnoremap <esc> <c-\><c-n>
  " use ctrl+] to exit terminal mode
  tnoremap <c-]> <c-\><c-n>
  " use alt+[ to send escape key to underlying program in buffer
  tnoremap <a-[> <esc>
endif

" MATCHING BRACKETS
inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
nnoremap % v%

" VIM-GITGUTTER
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)
nmap <localleader>p <Plug>(GitGutterPreviewHunk)
nmap <localleader>+ <Plug>(GitGutterStageHunk)
nmap <localleader>- <Plug>(GitGutterUndoHunk)

" VIM-FUGITIVE
nnoremap <silent> <leader>B :Gblame<cr>
nnoremap <silent> <leader>C :Gclog %<cr>
nnoremap <silent> <leader>G :Gstatus<cr>

" GOYO
nnoremap <leader>gg :<c-u>Goyo<cr>
xnoremap <leader>gg :<c-u>Goyo<cr>

" WIKI.VIM
nmap <leader>wt <plug>(wiki-list-toggle)
nmap <leader>jp <plug>(wiki-journal-prev)
nmap <leader>jn <plug>(wiki-journal-next)

" WIKI.VIM
let g:wiki_mappings_global = {
      \ '<plug>(wiki-list-toggle)'   : '<a-s>',
      \ 'i_<plug>(wiki-list-toggle)' : '<a-s>',
      \ '<plug>(wiki-journal-prev)'  : '<leader>jp',
      \ '<plug>(wiki-journal-next)'  : '<leader>jn',
      \}

" Grip (Preview Markdown)
if executable('grip')
  nnoremap <silent> <leader>mp :<c-u>!grip % -b<cr>
endif

" MARKDOWN-PREVIEW
nmap <leader>md <plug>MarkdownPreviewToggle

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
" Plugin Installation
nnoremap <leader>vi :<c-u>e ~/.config/nvim/plugin_installation.vim<cr>
" Plugin Configuration/Management
nnoremap <leader>vm :<c-u>e ~/.config/nvim/plugin_config.vim<cr>
" Keys
nnoremap <leader>vk :<c-u>e ~/.config/nvim/keys.vim<cr>
" Colorscheme
nnoremap <leader>vc :<c-u>e ~/.config/nvim/colorscheme.vim<cr>

" VIM-GREPPER
nnoremap <leader>/ :<c-u>GrepperRg<space>
nnoremap gs :Grepper -cword -noprompt<cr>
xmap gs <plug>(GrepperOperator)

" PICKER
nmap <leader>be <Plug>(PickerEdit)
nmap <leader>bs <Plug>(PickerSplit)
nmap <leader>bt <Plug>(PickerTabedit)
nmap <leader>bv <Plug>(PickerVsplit)
nmap <leader>bb <Plug>(PickerBuffer)
nmap <leader>b] <Plug>(PickerTag)
nmap <leader>bw <Plug>(PickerStag)
nmap <leader>bo <Plug>(PickerBufferTag)
nmap <leader>bh <Plug>(PickerHelp)

" BUFFERS
" close the current buffer and move to the previous one
nnoremap <leader>bq :<c-u>bp<bar>bd! #<cr>
" close all buffers except current one
nnoremap <leader>bd :<c-u>up<bar>%bd<bar>e#<cr>

" LSC
vnoremap <silent> ga :call lsc#edit#findCodeActions(lsc#edit#filterActions(), 0, 0)<CR>

" VSNIP
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" ALE
nmap <leader>ag <plug>(ale_go_to_definition)
nmap <leader>at <plug>(ale_go_to_type_definition)
nmap <leader>ah <plug>(ale_hover)
nmap <leader>ad <plug>(ale_documentation)
nmap <leader>ap <plug>(ale_detail)
nmap <leader>f <plug>(ale_fix)
nmap <leader>l <plug>(ale_lint)
nmap <leader>ar <plug>(ale_find_references)
imap <c-c> <plug>(ale_complete)
"Move between linting errors
nmap ]r <plug>(ale_next_wrap)
nmap [r <plug>(ale_previous_wrap)
