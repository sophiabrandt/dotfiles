"-----------------------------
" leader, localleader
"-----------------------------
let mapleader=" "
nnoremap <space> <nop>
" localleader is comma
let maplocalleader=","
nnoremap , <nop>


"-----------------------------
" general mappings
"-----------------------------
" make dot work on visual line selections.
xnoremap . :norm.<CR>
" Y should behave like D and C, from cursor till the end of line.
noremap Y y$
" U for redo, the opposite of u for undo.
nnoremap U <C-r>
" prevent clipboard hijacking
" https://old.reddit.com/r/vim/comments/hqt7ij/prevent_clipboard_hijacking/
inoremap <C-r> <C-r><C-o>
" visually select @ to run macro on all lines
xnoremap @ :<C-u>call macro#ExecuteOverVisualRange()<CR>
" matching brackets, scroll screen
inoremap } }<Left><C-o>%<C-o>:sleep 500m<CR><C-o>%<C-o>a
inoremap ] ]<Left><C-o>%<C-o>:sleep 500m<CR><C-o>%<C-o>a
inoremap ) )<Left><C-o>%<C-o>:sleep 500m<CR><C-o>%<C-o>a
" direct changes into the black hole register.
nnoremap c "_c
nnoremap C "_C
" sane behavior for <C-u> & <C-w>
if empty(mapcheck('<C-u>', 'i'))
  inoremap <C-u> <C-g>u<C-u>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-w> <C-g>u<C-w>
endif
" use <C-y> to clear the highlighting of :set hlsearch.
if maparg('<C-y>', 'n') ==# ''
  nnoremap <silent> <C-y> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-y>
endif
" open/close Loclist and quickfix window
nnoremap <LocalLeader>q :call quickfix#Toggle()<CR>
nnoremap <LocalLeader>l :call loclist#Toggle()<CR>
" make current file executable
nnoremap <Leader>x :!chmod +x %<CR>
" use tmux-sessionizer script
nnoremap <silent><C-f> :silent !tmux neww tmux-sessionizer<CR>


"-----------------------------
" helper mappings
"-----------------------------
" switch to sudo to override readonly
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null'<bar>edit!
" prompt for external command and insert
inoremap <C-r>! <-r>=ExternalCommandResult()<CR>
" reselect pasted text
nnoremap gp `[v`]
" paste from X11 system clipboard
nnoremap <silent><a-v> "*p
inoremap <silent><a-v> :<C-u><C-r>*<CR>
vnoremap <silent><a-v> <C-c>"*p
" yank into primary selection clipboard
nnoremap <silent><a-y> "+yy
vnoremap <silent><a-y> "+y
" paste previous yank
noremap <LocalLeader>p "0p
" yank into the 'y' register
noremap <Leader>y "yy
" paste from the 'y' register
noremap <Leader>p "yp
noremap <Leader>P "yP
" insert from the yank register.
inoremap <C-y> <C-r>y
nnoremap <Leader>u :<C-u>up<CR>
" hashrocket
inoremap hsr =>
" normal rocket
inoremap nsr ->
" fold the current indent.
nnoremap <Leader>z zazz
" source (reload) vimrc
nnoremap <Leader>vs:<c-u>source $MYVIMRC<cr>
" insert result of external command
inoremap <C-R>! <C-R>=extCmd#InsertResult()<CR>
" close quickfix and loclist
nnoremap <LocalLeader>c :cclose<CR>:lclose<CR>

"-----------------------------
" navigation mappings
"-----------------------------
" screen screen up and down
nnoremap <A-j> 10j
nnoremap <A-k> 10k
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Navigate buffers via 'wildmenu'.
nnoremap <Leader><Tab> :buffer<Space><Tab>
" Alternate the last two files.
nnoremap <Backspace> <C-^>
" Navigate the jumplist.
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
" Navigate the changelist.
nnoremap [c g;zz
nnoremap ]c g,zz
" close the current buffer and move to the previous one
nnoremap <Leader>bq :<C-u>bp<bar>bd! #<CR>
" close all buffers except current one
nnoremap <Leader>bd :<C-u>up<bar>%bd<bar>e#<CR>
" easily move to config
nnoremap <Leader>vc :<c-u>e $HOME/.vimrc<cr>


"-----------------------------
" center navigation mappings
"-----------------------------
noremap {  {zz
noremap }  }zz
noremap n  nzz
noremap N  Nzz
noremap ]s ]szz
noremap [s [szz


"-----------------------------
" window managment mappings
"-----------------------------
" zoom a vim pane, <C-w>= to re-balance
nnoremap <LocalLeader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <LocalLeader>= :wincmd =<CR>


"-----------------------------
" completion mappings
"-----------------------------
"   ]     - 'tags' file completion
"   t     - context aware omni completion (via 'omnifunc' setting)
"   Space     - user defined completion (via 'completefunc' setting)
"   b     - keyword completion from the current buffer (<C-n><C-b> to extend)
"   d     - dictionary completion (via 'dictionary' setting)
"   f     - file path completion
"   l     - line completion (repeat an existing line)
inoremap <C-]>     <C-x><C-]>
inoremap <C-t>     <C-x><C-o>
inoremap <C-Space> <C-x><C-u>
inoremap <C-b>     <C-x><C-p>
inoremap <C-d>     <C-x><C-k>
inoremap <C-f>     <C-x><C-f>
inoremap <C-l>     <C-x><C-l>
"   c - term completion that combines the sources of the 'complete' option
inoremap <expr> <C-c> pumvisible() ? "\<C-e>\<C-n>": "\<C-n>"
" Snippet completion: see vim/plugin/vsnip.vim


"-----------------------------
" readline-like mappings
"-----------------------------
" - Ctrl-a - go to the start of line
" - Ctrl-e - go to the end of the line
" - Alt-b  - back a word
" - Alt-f  - forward a word
" - Alt-BS - delete backward word
" - Alt-d  - delete forward word
nnoremap B ^
nnoremap E $
inoremap <C-a>  <C-o>^
inoremap <C-e>  <C-o>$
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
" as above but for command mode.
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>


"-----------------------------
" find & replace helpers
"-----------------------------
" - star search that does not move forward to the next match
nnoremap <silent> g* :let @/='\<'.expand('<cword>').'\>'<CR>
xnoremap <silent> g* "sy:let @/=@s<CR>

" - star search that does an immediate change on the match
nnoremap <silent> \c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> \c "sy:let @/=@s<CR>cgn
" accept/reject helpers after completing a \c cgn-based star search
" change operation.
"
" - go to the next star search match and highlight it
nnoremap <M-CR> gnzz
" - accept the star search change and go to the next match and highlight it
xmap <M-CR> .<Esc>gnzz
" - reject the star search change and go to the next match and highlight it
xnoremap ! <Esc>ngnzz

" - star search and substitute within the current file
noremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>

" - project-wide star search and substitute using the grepper plugin
nnoremap \S
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xmap \S
  \ "sy \|
  \ :GrepperRg <C-r>s<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


"-----------------------------
" NeoTerm
"-----------------------------
" getting out of terminal mode
if has('nvim')
  " use esc to exit terminal mode
  tnoremap <ESC> <C-\><C-n>
  " use ctrl+] to exit terminal mode
  tnoremap <C-]> <C-\><C-n>
  " use alt+[ to send escape key to underlying program in buffer
  tnoremap <a-[> <ESC>
endif
