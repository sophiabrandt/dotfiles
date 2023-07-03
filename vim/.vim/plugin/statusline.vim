" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" https://github.com/lukelbd/vim-statusline/blob/master/plugin/statusline.vim
" Define all the different modes
" Show whether in pastemode
function! PrintMode()
  if &ft && g:nostatus =~? &ft
    return ''
  endif
  let currentmode = {
    \ 'n':  'Normal',  'no': 'N-Operator Pending',
    \ 'v':  'Visual',  'V' : 'V-Line',  '': 'V-Block',
    \ 's':  'Select',  'S' : 'S-Line',  '': 'S-Block',
    \ 'i':  'Insert',  'R' : 'Replace', 'Rv': 'V-Replace',
    \ 'c':  'Command', 'r' : 'Prompt',
    \ 'cv': 'Vim Ex',  'ce': 'Ex',
    \ 'rm': 'More',    'r?': 'Confirm', '!' : 'shell',
    \ 't':  'Terminal',
    \}
  let string = currentmode[mode()]
  if &paste
    let string .= ':Paste'
  endif
  return '  [' . string . '] '
endfunction

set statusline=
set statusline+=%#PmenuSbar#
set statusline+=%{PrintMode()}
set statusline+=%#StatusLine#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
