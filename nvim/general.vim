" BASIC SETUP
set termguicolors
set hidden
set nobackup
set nowritebackup
set smartcase
set ignorecase
set inccommand=nosplit
set number relativenumber
set completeopt=menu,menuone,preview,noselect,noinsert
set scrolloff=4
set showtabline=2
set lazyredraw
set showmatch
set history=500
set backupdir=~/.tmp
set directory=~/.tmp
set expandtab shiftwidth=2
set colorcolumn=80

" NEOVIM PROVIDERS
let g:ruby_host_prog    = '~/.gem/ruby/2.6.0/bin/neovim-ruby-host'
let g:node_host_prog    = '~/.npmbin/bin/neovim-node-host'
let g:python_host_prog  = '/usr/bin/python2'
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

" OCAML/MERLIN
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" AUTOCOMPLETE & SPELL CHECKING
" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set spelllang=en
set spellfile=~/.config/nvim/spell/en.utf-8.add

" VISUALLY SELECT, @ TO RUN MACRO ON ALL LINES
xnoremap @ :<c-u>call ExecuteMacroOverVisualRange()<cr>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" " MARKDOWN
" au BufNewFile,BufFilePre,BufRead   *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.mdwn,*.mdx set ft=markdown
autocmd BufRead,BufNewFile         *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.mdwn,*.mdx setlocal spell

" AUTO-CREATE DIRECTORY WHEN SAVING FILE
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
