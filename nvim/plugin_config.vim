" SNEAK VIM
let g:sneak#label  = 1
let g:sneak#s_next = 1

" NEOTERM
let g:neoterm_autoscroll = 1

" VIM-GREPPER
let g:grepper       = {}
let g:grepper.tools = ["rg"]
let g:grepper.jump  = 1

" TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-t><c-p> :TmuxNavigatePrevious<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" VIM-DICT
let g:vim_dict_dict = [
    \ '~/.vim/dict',
    \ '~/.config/nvim/dict',
    \ ]
let g:vim_dict_config = {'html':'html,javascript,css','markdown':'text','javascriptreact':'javascript','typescriptreact':'typescript'}

" UNDOTREE
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4

" PEARTREE
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers     = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_backspace   = 1

" LIMELIGHT
let g:limelight_default_coefficient = 0.8
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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

" GITGUTTER
let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'

" VIM-LION
let g:lion_squeeze_spaces = 1

" EMMET
let g:user_emmet_settings={
\  'javascript' : {
\    'extends': 'jsx',
\    },
\  'typescript' : {
\    'extends': 'jsx',
\    },
\}

let g:user_emmet_leader_key='<c-z>'

" MARKDOWN-PREVIEW
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css ='~/.config/nvim/github-markdown-css/github-markdown.css'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" VIM-REASOML
autocmd FileType reason map <buffer> <leader>rf :ReasonPrettyPrint<cr>

" HY
let g:hy_enable_conceal = 1

" VIM-TMUX-RUNNER
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

" LSC & VSNIP
let g:lsc_server_commands = {
\  'elixir': {
\    'command': '~/.bin/elixir-ls/release/language_server.sh',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'fsharp': {
\    'command': 'fsharp-language-server',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'go': {
\    'command': 'gopls serve',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'javascript': {
\    'command': 'typescript-language-server --stdio',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'javascriptreact': {
\    'command': 'typescript-language-server --stdio',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'nim': {
\    'command': '~/.nimble/bin/nimlsp',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'ocaml': {
\    'command': 'ocamllsp',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'python': {
\    'command': '~/.local/bin/pyls',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'reason': {
\    'command': '~/.bin/rls-linux/reason-language-server',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'rust': {
\    'command': 'rls',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'typescript': {
\    'command': 'typescript-language-server --stdio',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\  'typescriptreact': {
\    'command': 'typescript-language-server --stdio',
\    'log_level': -1,
\    'suppress_stderr': v:true,
\  },
\}

let g:lsc_auto_map = {
\  'defaults': v:false,
\  'Completion': 'omnifunc',
\}

let g:lsc_enable_autocomplete    = v:false
let g:lsc_enable_diagnostics     = v:false
let g:lsc_reference_highlights   = v:false
let g:lsc_trace_level            = 'off'
let g:lsc_enable_snippet_support = v:true
let g:vsnip_snippet_dir          = expand('~/.config/nvim/vsnip')

" ALE
let g:ale_sign_error                      = '✘'
let g:ale_sign_warning                    = '⚠'
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

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

let g:ale_linter_aliases = {
\   'eelixir': ['elixir', 'html'],
\   'scss':    ['css'],
\   'svelte':  ['css', 'javascript'],
\}

let g:ale_linters = {
\   'clojure':                     ['joker', 'clj_kondo'],
\   'css':                         ['stylelint', 'csslint'],
\   'dart':                        ['language_server'],
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
