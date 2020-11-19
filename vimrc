"===========================================================
" SETTINGS
"===========================================================
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent 
set backspace=indent,eol,start
set backupdir=~/.tmp
set complete=.,w,b,u,k,t
set completeopt=menu,menuone,noinsert,noselect
set directory=~/.tmp
set foldcolumn=2
set foldenable
set foldlevelstart=10
set foldmethod=indent
set foldnestmax=10
set hidden
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set nobackup
set nowritebackup
set number
set ruler
set scrolloff=4
set sessionoptions-=options
set shiftwidth=4
set showtabline=2
set smartcase
set tabstop=4
set termguicolors
set viewoptions-=options

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" diffopt
if has('nvim-0.3.2') || has('patch-8.1.0360')
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

" Set the persistent undo directory on temporary private fast storage.
let s:undoDir='/tmp/.undodir_' . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, '', 0700)
endif
let &undodir=s:undoDir

set shortmess+=I
set shortmess+=c
set softtabstop=4
set undofile
set updatetime=300

" whitespace
" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" use one space, not two, after punctuation.
set nojoinspaces

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" search down subfolders
set path+=**

" wildignore settings
set wildmenu
set wildignore+=*.git*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" autocomplete & spell checking
" autocomplete with dictionary words when spell check is on
set dictionary=/usr/share/dict/words
set complete+=kspell
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

" nvim specific settings
if has('nvim')
  set inccommand=nosplit
  let g:ruby_host_prog    = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
  let g:node_host_prog    = '~/.npmbin/bin/neovim-node-host'
  let g:python3_host_prog = '/usr/bin/python3'
endif

"===========================================================
" FUNCTIONS
"
" ~/dotfiles/vim/autoload - custom functions
"===========================================================

"===========================================================
" TERMINAL VIM SETTINGS
"===========================================================
runtime custom/terminal.vim

"===========================================================
" MAPPINGS
"===========================================================
runtime custom/mappings.vim

"===========================================================
" PLUGINS
"===========================================================
" initial 'vim-packager' installation:
" git clone https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager
" plugin setup under ~/.vim/plugin/packager.vim


"===========================================================
" AUTOCMDS
"===========================================================
runtime custom/autocmds.vim
    " ~/dotfiles/vim/ftplugin       - file type options, mappings
    " ~/dotfiles/vim/after/ftplugin - file type overrides


"===========================================================
" COLOR SCHEME
"===========================================================
runtime custom/colorscheme.vim
