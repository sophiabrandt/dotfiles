" BASIC SETUP
colorscheme nova
set termguicolors
set nobackup
set backspace=indent,eol,start
set autoindent
set smartindent
set nowritebackup
set autowrite
set inccommand=nosplit
set number relativenumber
set tabstop=2
set softtabstop=2
set scrolloff=4
set smarttab
set expandtab
set encoding=utf-8
set ignorecase
set nocompatible
set autoread
set lazyredraw
set showcmd
set showmatch
set laststatus=2
set history=500
set backupdir=~/.tmp
set directory=~/.tmp
filetype plugin indent on
syntax enable

" WHITESPACE
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
"Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" SEARCHING
set incsearch
set hlsearch

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=full

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R -f ./.git/tags .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" MARKDOWN
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.mdx set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.mdx setlocal spell
" Grip (Preview Markdown)
nnoremap <silent> <leader>mp :!grip % -b<cr>

" EMMET
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" JSX
let g:jsx_ext_required = 0
