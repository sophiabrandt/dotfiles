" BASIC SETUP
set termguicolors
set hidden
set nobackup
set nowritebackup
set smartcase
set ignorecase
set inccommand=nosplit
set number
set completeopt=menu,menuone,longest
set scrolloff=4
set showtabline=2
set lazyredraw
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldcolumn=2
set foldnestmax=10
set history=500
set backupdir=~/.tmp
set directory=~/.tmp
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set undodir=~/.config/nvim/undodir
set undofile
set updatetime=300
set shortmess-=F
set shortmess+=c
set cpt=.,k,w,b

" NEOVIM PROVIDERS
let g:ruby_host_prog    = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'
let g:node_host_prog    = '~/.npmbin/bin/neovim-node-host'
let g:python3_host_prog = '/usr/bin/python3'

" DON'T SAVE NETRW HISTORY
let g:netrw_dirhistmax = 0

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
command! MakeTags !ctags -R --exclude=@/home/$USER/.config/nvim/.ctagsignore .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" Wildignore settings
set wildignore+=*.git*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" AUTOCOMPLETE & SPELL CHECKING
" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set spelllang=en
set spellfile=~/.config/nvim/spell/en.utf-8.add

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

augroup working_directory
  autocmd!
  " set current directory on insert mode
  autocmd InsertEnter * silent! lcd %:p:h
  " switch back to project root when leaving insert mode
  autocmd InsertLeave * silent call ProjectRootCD()
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

" TOGGLE LOCLIST WINDOW
" https://learnvimscriptthehardway.stevelosh.com/chapters/38.html
let g:loclist_is_open = 0

function! LoclistToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
        execute g:loclist_return_to_window . "wincmd w"
    else
        let g:loclist_return_to_window = winnr()
        lopen
        let g:loclist_is_open = 1
    endif
endfunction

" TOGGLE QUICKFIX WINDOW
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
nnoremap <leader>q :call QuickfixToggle()<cr>

" TOGGLE CLAVICHORD/APC
" https://github.com/vim-add-ons/clavichord-omni-completion
let g:apc_is_active = 0

function! ApcToggle()
    if g:apc_is_active
        ApcDisable
        let g:apc_is_active = 0
    else
        ApcEnable
        let g:apc_is_active = 1
    endif
endfunction
