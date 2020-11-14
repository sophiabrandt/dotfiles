" https://shapeshed.com/vim-statuslines/
" https://jdhao.github.io/2019/11/03/vim_custom_statusline/
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! CurrentMode()
  let l:currentmode={
         \ 'n'  : 'NORMAL ',
         \ 'v'  : 'VISUAL ',
         \ 'V'  : 'V·Line ',
         \ '' : 'V·Block ',
         \ 'i'  : 'INSERT ',
         \ 'r'  : 'REPLACE ',
         \ 'Rv' : 'V·Replace ',
         \ 'c'  : 'Command ',
         \ 's'  : 'Select ',
         \ 't'  : 'Terminal ',
         \}
  return toupper(l:currentmode[mode()])
endfunction

set statusline=
set statusline+=%#PmenuSbar#
set statusline+=%{CurrentMode()}
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
