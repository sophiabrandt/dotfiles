let g:ale_sign_error                      = '✖'
let g:ale_sign_warning                    = '✖'
let g:ale_sign_info                       = '●'
let g:ale_sign_priority                   = 50
if has("nvim")
    let g:ale_echo_cursor                 = 0
    let g:ale_virtualtext_cursor          = 1
    let g:ale_virtualtext_prefix          = ' ■ '
endif
highlight ALEErrorSign ctermbg            =NONE ctermfg=red
highlight ALEWarningSign ctermbg          =NONE ctermfg=yellow
let g:ale_open_list                       = 0
let g:ale_linters_explicit                = 1
let g:ale_lint_on_text_changed            = 'never'
let g:ale_lint_on_filetype_changed        = 0
let g:ale_lint_on_insert_leave            = 0
let g:ale_lint_on_enter                   = 0
let g:ale_lint_on_save                    = 0
let g:ale_fix_on_save                     = 0
let g:ale_completion_enabled              = 0
let g:ale_elixir_elixir_ls_release        = $HOME . '/.bin/elixir-ls/release'
let g:ale_reason_ls_executable            = $HOME . '/.bin/rls-linux/reason-language-server'
let g:ale_javascript_prettier_options     = '--no-semi --single-quote --trailing-comma es5'
let g:ale_markdown_remark_lint_use_global = 1

nmap <Leader>ad <Plug>(ale_go_to_definition)
nmap <Leader>at <Plug>(ale_go_to_type_definition)
nmap <Leader>ah <Plug>(ale_hover)
nmap <Leader>ao <Plug>(ale_documentation)
nmap <Leader>ae <Plug>(ale_detail)
nmap <Leader>f  <Plug>(ale_fix)
nmap <Leader>l  <Plug>(ale_lint)
nmap <Leader>ar <Plug>(ale_find_references)

" move between linting errors
nmap ]r <Plug>(ale_next_wrap)zz
nmap [r <Plug>(ale_previous_wrap)zz

let g:ale_linter_aliases = {
\   'eelixir': ['elixir', 'html'],
\   'scss':    ['css'],
\   'svelte':  ['css', 'javascript'],
\}

let g:ale_linters = {
\   'clojure':                     ['joker', 'clj_kondo'],
\   'css':                         ['stylelint', 'csslint'],
\   'dart':                        ['dart-analysis-server-lsp'],
\   'elixir':                      ['elixir-ls'],
\   'graphql':                     ['gqlint'],
\   'go':                          ['gopls'],
\   'javascript':                  ['tsserver', 'eslint'],
\   'javascriptreact':             ['tsserver', 'eslint'],
\   'json':                        ['jsonlint'],
\   'markdown':                    ['remark_lint', 'proselint', 'writegood'],
\   'nim':                         ['nimlsp', 'nimcheck'],
\   'ocaml':                       ['merlin'],
\   'python':                      ['flake8'],
\   'reason':                      ['reason-language-server'],
\   'rust':                        ['rls', 'rust-analyzer'],
\   'scss':                        ['stylelint', 'csslint'],
\   'svelte':                      ['eslint', 'stylelint', 'csslint'],
\   'typescript':                  ['tsserver', 'eslint', 'stylelint'],
\   'typescriptreact':             ['tsserver', 'eslint', 'stylelint'],
\   'yaml':                        ['yamllint'],
\}

let g:ale_fixers = {
\   'css':                  ['prettier', 'stylelint'],
\   'dart':                 ['dartfmt'],
\   'eelixir':              ['prettier'],
\   'elixir':               ['mix_format'],
\   'graphql' :             ['prettier'],
\   'go':                   ['gofmt'],
\   'html':                 ['prettier'],
\   'javascript':           ['eslint', 'prettier', 'prettier_eslint'],
\   'javascriptreact':      ['eslint', 'prettier', 'prettier_eslint'],
\   'json':                 ['prettier', 'fixjson'],
\   'markdown':             ['prettier'],
\   'nim':                  ['nimpretty'],
\   'ocaml':                ['ocamlformat'],
\   'python' :              ['black'],
\   'reason':               ['refmt'],
\   'rust':                 ['rustfmt'],
\   'scss':                 ['prettier', 'stylelint'],
\   'svelte':               ['eslint', 'prettier', 'prettier_eslint'],
\   'typescript':           ['eslint', 'prettier', 'prettier_eslint'],
\   'typescriptreact':      ['eslint', 'prettier', 'prettier_eslint'],
\   'yaml':                 ['prettier'],
\   '*':                    ['remove_trailing_lines', 'trim_whitespace'],
\}

" use the Dart Analysis Server (LSP)
call ale#linter#Define('dart', {
 \  'name': 'dart-analysis-server-lsp',
 \  'lsp': 'stdio',
 \  'executable': 'dart',
 \  'command': 'dart $DART_SDK/bin/snapshots/analysis_server.dart.snapshot --lsp',
 \  'project_root': function('ale_linters#dart#language_server#GetProjectRoot'),
 \})