" AUTOSAVE
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

" VIMCOMPLETESME SETUP
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" SNEAK VIM
let g:sneak#label = 1
let g:sneak#s_next = 1

" NEOTERM
let g:neoterm_autoscroll = 1

" FZF & Ripgrep
" Support for buffers
let g:fzf_buffers_jump = 1

" search files in git project root
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner      =0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv        =1          " open splits to the right
let g:netrw_liststyle   =3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mapping

" LIGHTLINE
let lightline                           = {}
let g:lightline.colorscheme             = 'gruvbox'
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline                 = {'left': [['buffers']],'right': [['close']]}
let g:lightline.component_function      = {'filetype': 'MyFiletype', 'fileformat': 'MyFileformat'}
let g:lightline.component_expand        = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type          = {'buffers': 'tabsel'}
let g:lightline.active                  = {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']] }
let g:lightline.component_function      = {'gitbranch': 'fugitive#head'}

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" PEAR-TREE (AUTO-PAIRS SMART PAIRS)
let g:pear_tree_smart_openers   = 1
let g:pear_tree_smart_closers   = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_ft_disabled     = ['elixir', 'markdown']

" RAINBOW PARENS
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

" EMMET
let g:user_emmet_settings={
\  'javascript' : {
\    'extends': 'jsx',
\    },
\  'typescript' : {
\    'extends': 'jsx',
\    },
\}

" HEOKINASE (Hex color display)
let g:Hexokinase_ftAutoload = ['css', 'scss', 'html', 'javascript']

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" JSX
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1

" NVIM-TYPESCRIPT
let g:nvim_typescript#javascript_support = 1

" LANGUAGECLIENT
let g:LanguageClient_serverCommands = {
\   'reason': ['~/Coding/Reason/rls-linux/reason-language-server'],
\   'elixir': ['~/Coding/Elixir/elixir-ls/release/language_server.sh'],
\}

let g:LanguageClient_rootMarkers = {
\   'elixir': ['mix.exs'],
\}

" ALE
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1
let g:ale_completion_enabled          = 1
let g:ale_elixir_elixir_ls_release    = $HOME . '/Coding/Elixir/elixir-ls/release'
let g:ale_reason_ls_executable        = $HOME . '/Coding/Reason/rls-linux/reason-language-server'
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'

let g:ale_linter_aliases = {
\   'jsx':     ['css', 'javascript'],
\   'svelte':  ['css', 'javascript'],
\   'scss':    ['css'],
\   'eelixir': ['elixir', 'html'],
\}

let g:ale_linters = {
\   'clojure':    ['joker', 'clj_kondo'],
\   'javascript': ['tsserver', 'eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'json':       ['jsonlint'],
\   'css':        ['stylelint', 'csslint'],
\   'scss':       ['stylelint', 'csslint'],
\   'jsx':        ['tsserver', 'eslint', 'stylelint'],
\   'html':       ['fecs'],
\   'svelte':     ['eslint', 'stylelint', 'csslint'],
\   'markdown':   ['remark_lint', 'writegood'],
\   'elixir':     ['elixir-ls', 'credo'],
\   'eelixir':    ['fecs'],
\   'python':     ['flake8'],
\   'graphql':    ['gqlint'],
\   'dart':       ['language_server'],
\   'reason':     ['reason-language-server'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier', 'prettier_eslint'],
\   'typescript': ['eslint', 'prettier', 'prettier_eslint'],
\   'json':       ['prettier', 'fixjson'],
\   'css':        ['prettier', 'stylelint'],
\   'scss':       ['prettier', 'stylelint'],
\   'html':       ['prettier'],
\   'jsx':        ['eslint', 'prettier'],
\   'svelte':     ['eslint', 'prettier', 'prettier_eslint'],
\   'markdown':   ['prettier'],
\   'elixir':     ['mix_format'],
\   'eelixir':    ['prettier'],
\   'python' :    ['yapf', 'black'],
\   'graphql' :   ['prettier'],
\   'dart':       ['dartfmt'],
\   'reason':     ['refmt'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}
