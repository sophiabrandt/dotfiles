" BASIC SETUP
colorscheme gruvbox8
set termguicolors
set hidden
set nobackup
set nowritebackup
set smartindent
set copyindent
set inccommand=nosplit
set completeopt=menu,menuone,preview,noselect,noinsert
set number relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=4
set expandtab
set showtabline=2
set ignorecase
set lazyredraw
set showmatch
set history=500
set backupdir=~/.tmp
set directory=~/.tmp

" NEOVIM PROVIDERS
let g:ruby_host_prog = '~/.gem/ruby/2.6.0/bin/neovim-ruby-host'
let g:node_host_prog = '/usr/bin/neovim-node-host'

" WHITESPACE
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
"Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmode=full

" Automatically change to current directory
" autocmd BufEnter * silent! lcd %:p:h

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R -f ./.git/tags .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE & SPELL CHECKING
" Autocomplete with dictionary words when spell check is on
set complete+=kspell
set spelllang=en
set spellfile=/media/Data/Gdrive/Coding/vim/spell/en.utf-8.add

" MARKDOWN
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.mdx set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.mdx setlocal spell
