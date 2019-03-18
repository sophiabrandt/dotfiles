" AUTOSAVE
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

" VIMCOMPLETESME SETUP
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" SNEAK VIM
let g:sneak#label = 1
let g:sneak#s_next = 1

" RIPGREP FZF
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in FZF for listing files. Lightning fast and respects .gitignore
  let g:fzf_command_prefix = 'rg --files --no-ignore-vcs --nocolor --hidden -g "" %s'

  if !exists(":Rg")
    command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Rg<SPACE>
  endif
endif

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mapping

" DEVICONS FOR LIGHTLINE
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

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
let g:vim_jsx_pretty_colorful_config = 1

" ALE
let g:ale_linters = {
\   'clojure': ['joker'],
\   'javascript': ['prettier-eslint'],
\   'typescript': ['tsserver'],
\   'elixir': ['elixir-ls'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier-eslint'],
\   'typescript': ['prettier-eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'elixir': ['mix_format'],
\   'python' : ['autopep8', 'yapf'],
\   'graphql' : ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_elixir_elixir_ls_release='~/Coding/Elixir/elixir-ls/release'
let g:ale_typescript_tsserver_use_global = 1
let g:ale_javascript_prettier_options = '--no-semi --single-quote --trailing-comma es5'
