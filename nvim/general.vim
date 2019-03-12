" BASIC SETUP
colorscheme nova
set termguicolors
set nobackup
set backspace=indent,eol,start
set autoindent
set smartindent
set nowritebackup
set autowrite
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
filetype plugin on
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

" CLOJURE
" https://medium.com/@jebberjeb/vim-clojure-tooling-redux-16ce62e4d729
" Strip off the symbol’s namespace
function! SanitizeTag(word)
  return (split(a:word, ‘/’)[-1])
endfunction

" " Returns the job id of the first terminal buffer on the
" " current tab.
" function! FirstTermOfTabJobId()
"     let t_id = nvim_get_current_tabpage()
"     for w_id in nvim_tabpage_list_wins(t_id)
"         let b_id = nvim_win_get_buf(w_id)
"         if nvim_buf_get_option(b_id, 'buftype') == 'terminal'
"             return nvim_buf_get_var(b_id, 'terminal_job_id')
"         endif
"     endfor
" endfunction

" Returns the latest terminal job id
augroup Terminal
  au!
  au TermOpen * let g:term_jid = b:terminal_job_id
augroup END

" Sends to REPL
function! REPLSendSafe()
    " Hack to get character under the cursor.
    norm "ayl
    if index(["(", ")", "[", "]", "{", "}"], @a) >= 0
        " Hack to get text using % motion.
        norm v%"ay
        call REPLSend(@a)
    endif
endfunction

" function! REPLSend(cmd)
"     call jobsend(FirstTermOfTabJobId(), a:cmd."\n")
" endfunction

function! REPLSend(cmd)
    call jobsend(g:term_jid, a:cmd."\n")
endfunction

" EMMET
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" JSX
let g:jsx_ext_required = 0
