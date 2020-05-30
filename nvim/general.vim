" BASIC SETUP
set termguicolors
set hidden
set nobackup
set nowritebackup
set smartcase
set ignorecase
set inccommand=nosplit
set number
set completeopt=menu,menuone,noselect,noinsert
set scrolloff=4
set showtabline=2
set lazyredraw
set showmatch
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldcolumn=2
set foldnestmax=10
set history=500
set backupdir=~/.tmp
set directory=~/.tmp
set expandtab shiftwidth=2
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=300
set shortmess-=F

" NEOVIM PROVIDERS
let g:ruby_host_prog    = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
let g:node_host_prog    = '~/.npmbin/bin/neovim-node-host'
let g:python3_host_prog = '/usr/bin/python3'

" WHITESPACE
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
"Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" AUTOCOMPLETE & SPELL CHECKING
" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set spelllang=en
set spellfile=~/.config/nvim/spell/en.utf-8.add

" MARKDOWN
autocmd BufRead,BufNewFile *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.mdwn,*.mdx setlocal spell

" VISUALLY SELECT @ TO RUN MACRO ON ALL LINES
xnoremap @ :<c-u>call ExecuteMacroOverVisualRange()<cr>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" AUTO-CREATE DIRECTORY WHEN SAVING FILE
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup Auto_Create_Dir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" SET CURRENT WORKING DIRECTORY ON INSERT MODE
" http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
    let current_file = expand('%:p')
    " do not mess with 'fugitive://' etc
    if current_file =~ '^\w\+:/' || &filetype =~ '^git'
      return
    endif

    lcd %:p:h
    let git_dir = system("git rev-parse --show-toplevel")
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
    " if git project, change local directory to git project root
    if (git_dir != "") && empty(is_not_git_dir)
      lcd `=git_dir`
    endif
  endfunction

  " follow symlinked file
  function! FollowSymlink()
    let current_file = expand('%:p')
    " do not mess with 'fugitive://' etc
    if current_file =~ '^\w\+:/' || &filetype =~ '^git'
      return
    endif
    if getftype(current_file) == 'link'
      let actual_file = resolve(current_file)
      silent! execute 'file ' . actual_file
    end
  endfunction

augroup working_directory
  autocmd!
  " set current directory on insert mode
  autocmd InsertEnter * silent! lcd %:p:h
  " switch back to project root when leaving insert mode
  autocmd InsertLeave * silent
    \ call FollowSymlink() |
    \ call SetProjectRoot()
augroup END

" RELATIVE LINE NUMBER TOGGLE
" set relative line numbering when entering insert mode
" return to absolute line numbering when cursor leaves buffer/window/split
augroup number_toggle
  autocmd!
  autocmd InsertEnter * set relativenumber
  autocmd BufLeave,WinLeave,InsertLeave,FocusLost * set norelativenumber
augroup END

" " OCAML
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
"
