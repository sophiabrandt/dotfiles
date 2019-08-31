" LEADER SHORTCUTS
" leader is space
let mapleader=" "
nnoremap <space> <nop>
" localleader is comma
let maplocalleader=","
nnoremap , <nop>

" swap semicolon and colon in normal mode to enter command mode more easily
nnoremap ; :
nnoremap : ;

" movement
nnoremap j gj
nnoremap k gk

" xx is escape in insert mode
inoremap xx <esc>

" jump to start of line and end of line
inoremap <c-a> <c-o>^
nnoremap B ^
inoremap <c-e> <c-o>$
nnoremap E $

" replace word with default register
nnoremap <leader>r "_diwP"
" paste from clipboard
nnoremap <leader>p "+p

" switch current working directory to project root
nnoremap <leader>prd :<c-u>ProjectRootCD<cr>
" switch to the directory of currently openend file
nnoremap <leader>cwd :<c-u>cd %:p:h<cr>

" maximize/minimize current tab
nnoremap <leader>tx :<c-u>tabedit %<cr>
nnoremap <leader>ti :<c-u>tabclose<cr>

" ctrl+s to save file
noremap <silent><c-s> :<c-u>update<cr>
vnoremap <silent><c-s> :<c-u><c-c>:update<cr>
inoremap <silent><c-s> :<c-u><c-o>:update<cr>

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-v><esc> <esc>
endif

" AUTOSAVE
nnoremap <leader>ast :<c-u>AutoSaveToggle<cr>

" NEOTERM
" <leader>tl will clear neoterm-3.
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>
" REPLSend
nnoremap <leader>trf :<c-u>TREPLSendFile<cr>
nmap <leader>trs <plug>(neoterm-repl-send)
nmap <leader>trl <plug>(neoterm-repl-send-line)

" Grip (Preview Markdown)
nnoremap <silent> <leader>mp :<c-u>!grip % -b<cr>

" Quit help files
" type q to exit
autocmd Filetype help nnoremap <buffer> q :q<cr>

" replace f and t with one-character vim sneak
map f <plug>Sneak_f
map F <plug>Sneak_F
map t <plug>Sneak_t
map T <plug>Sneak_T

" Split edit your vimrc. Type space, v, r in sequence to trigger
nnoremap <leader>vr :<c-u>e $MYVIMRC<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nnoremap <leader>so :<c-u>source $MYVIMRC<cr>
" General Config
nnoremap <leader>vg :<c-u>e ~/.config/nvim/general.vim<cr>
" Packages
nnoremap <leader>vm :<c-u>e ~/.config/nvim/packages.vim<cr>
" Plugins
nnoremap <leader>vp :<c-u>e ~/.config/nvim/plugins.vim<cr>
" Keys
nnoremap <leader>vk :<c-u>e ~/.config/nvim/keys.vim<cr>

" FZF
nnoremap <leader>f :<c-u>Files<cr>
nnoremap <leader>bb :<c-u>Buffers<cr>
nnoremap <leader>sn :<c-u>Snippets<cr>

" Find with :Rg
nnoremap <leader>rg :<c-u>Rg<cr>

" BUFFERS
" close the current buffer and move to the previous one
nnoremap <leader>bq :<c-u>bp <bar> bd #<cr>
" close all buffers except current one
nnoremap <leader>bd :<c-u>up <bar> %bd <bar> e#<cr>

" NVIM-TYPESCRIPT
nnoremap <leader>tsd :<c-u>TSDoc<cr>
nnoremap <leader>tsp :<c-u>TSDefPreview<cr>
nnoremap <leader>tsf :<c-u>TSTypeDef<cr>
nnoremap <leader>tst :<c-u>TSType<cr>
nnoremap <leader>tsr :<c-u>TSRefs<cr>
nnoremap <leader>tse :<c-u>TSEditConfig<cr>

" VIM-JS-FILE-IMPORT
let g:js_file_import_no_mappings = 1
nmap <leader>if <plug>(JsFileImport)
nmap <leader>iF <plug>(JsFileImportList)
nmap <leader>ig <plug>(JsGotoDefinition)
nmap <leader>iG <plug>(JsGotoDefinition)
nmap <leader>ip <plug>(PromptJsFileImport)
nmap <leader>is <plug>(SortJsFileImport)
nmap <leader>ic <plug>(JsFixImport)

" PYTHON-IMPORTS
nmap <leader>pi :<c-u>ImportName<cr>
nmap <leader>ph :<c-u>ImportNameHere<cr>

" LANGUAGECLIENT
nnoremap <silent> <leader>ld :<c-u>call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> <leader>lf :<c-u>call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <leader>lh :<c-u>call LanguageClient#textDocument_hover()<cr>
nnoremap <silent> <leader>lc :<c-u>call LanguageClient_contextMenu()<cr>

" ALE
nmap <leader>ag <plug>(ale_go_to_definition)
nmap <leader>at <plug>(ale_go_to_type_definition)
nmap <leader>ah <plug>(ale_hover)
nmap <leader>ad <plug>(ale_documentation)
nmap <leader>ap <plug>(ale_detail)
nmap <leader>af <plug>(ale_fix)
nmap <leader>al <plug>(ale_lint)
nmap <leader>ar <plug>(ale_find_references)
imap <c-c> <plug>(ale_complete)
"Move between linting errors
nmap ]r <plug>(ale_next_wrap)
nmap [r <plug>(ale_previous_wrap)
