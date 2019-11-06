" AUTOSAVE
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

" SNEAK VIM
let g:sneak#label  = 1
let g:sneak#s_next = 1

" WIKI.VIM
let g:wiki_root             = '~/wiki'
let g:wiki_filetypes        = ['md']
let g:wiki_link_target_type = 'md'
let g:wiki_list_todos       = ['TODO', 'IN_PROGRESS', 'DONE']
let g:wiki_journal          = {
    \ 'name': 'log'
    \}

" LIGHTLINE
let lightline                              = {}
let g:lightline.colorscheme                = 'nord'
let g:lightline#bufferline#show_number     = 1
let g:lightline#bufferline#shorten_path    = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed         = '[No Name]'
let g:lightline.tabline                    = {'left': [['buffers']], 'right': []}
let g:lightline.component_function         = {'filetype': 'MyFiletype', 'fileformat': 'MyFileformat', 'gitbranch': 'fugitive#head'}
let g:lightline.component_expand           = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type             = {'buffers': 'tabsel'}
let g:lightline.active                     = {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']] }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" EMMET
let g:user_emmet_settings={
\  'javascript' : {
\    'extends': 'jsx',
\    },
\  'typescript' : {
\    'extends': 'jsx',
\    },
\}

" MARKDOWN-PREVIEW
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css ='~/.config/nvim/github-markdown-css/github-markdown.css'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" LANGUAGECLIENT
 let g:LanguageClient_serverCommands = {
 \   'elixir': ['~/Coding/Elixir/elixir-ls/release/language_server.sh'],
 \   'javascript': ['typescript-language-server', '--stdio'],
 \   'javascriptjsx': ['typescript-language-server', '--stdio'],
 \   'nim': ['nimlsp', '~/.choosenim/toolchains/nim-1.0.0'],
 \   'reason': ['~/Coding/Reason/rls-linux/reason-language-server'],
 \   'typescript': ['typescript-language-server', '--stdio'],
 \   'typescript.tsx': ['typescript-language-server', '--stdio'],
 \   'python': ['~/.local/bin/pyls'],
 \}

 let g:LanguageClient_diagnosticsList = 'Disabled'

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
\   'css':        ['stylelint', 'csslint'],
\   'dart':       ['language_server'],
\   'elixir':     ['elixir-ls', 'credo'],
\   'graphql':    ['gqlint'],
\   'javascript': ['tsserver', 'eslint'],
\   'json':       ['jsonlint'],
\   'jsx':        ['tsserver', 'eslint', 'stylelint'],
\   'markdown':   ['remark_lint', 'writegood'],
\   'nim':        ['nimlsp', 'nim check'],
\   'python':     ['flake8'],
\   'reason':     ['reason-language-server'],
\   'scss':       ['stylelint', 'csslint'],
\   'svelte':     ['eslint', 'stylelint', 'csslint'],
\   'typescript': ['tsserver', 'eslint'],
\}

let g:ale_fixers = {
\   'css':        ['prettier', 'stylelint'],
\   'dart':       ['dartfmt'],
\   'eelixir':    ['prettier'],
\   'elixir':     ['mix_format'],
\   'graphql' :   ['prettier'],
\   'html':       ['prettier'],
\   'javascript': ['eslint', 'prettier', 'prettier_eslint'],
\   'json':       ['prettier', 'fixjson'],
\   'jsx':        ['eslint', 'prettier'],
\   'markdown':   ['prettier'],
\   'python' :    ['yapf', 'black'],
\   'reason':     ['refmt'],
\   'scss':       ['prettier', 'stylelint'],
\   'svelte':     ['eslint', 'prettier', 'prettier_eslint'],
\   'typescript': ['eslint', 'prettier', 'prettier_eslint'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}
