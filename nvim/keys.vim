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

" jump to start of line and end of line
inoremap <c-a> <c-o>^
nnoremap B ^
inoremap <c-e> <c-o>$
nnoremap E $

" replace word with default register
nnoremap <leader>r "_diwP"
" paste from clipboard
nnoremap <leader>cv "+p

" switch current working directory to project root
nnoremap <leader>crd :<c-u>ProjectRootCD<cr>
" switch to the directory of currently openend file
nnoremap <leader>cwd :<c-u>cd %:p:h<cr>

" maximize/minimize current tab
nnoremap <leader>tx :<c-u>tabedit %<cr>
nnoremap <leader>ti :<c-u>tabclose<cr>

" Use ctrl-[hjkl] to navigate panes
nmap <silent> <c-k> <c-w><up>
nmap <silent> <c-j> <c-w><down>
nmap <silent> <c-h> <c-w><left>
nmap <silent> <c-l> <c-w><right>

" TERMINAL
" Getting out of Terminal mode
if has('nvim')
  " use esc to exit terminal mode
  tnoremap <esc> <c-\><c-n>
  " use ctrl+] to exit terminal mode
  tnoremap <c-]> <c-\><c-n>
  " use alt+[ to send escape key to underlying program in buffer
  tnoremap <a-[> <esc>
endif

" AUTOSAVE
nnoremap <leader>ast :<c-u>AutoSaveToggle<cr>

" Grip (Preview Markdown)
if executable('grip')
  nnoremap <silent> <leader>mp :<c-u>!grip % -b<cr>
endif

" MARKDOWN-PREVIEW
nnoremap <leader><md> <plug>MarkdownPreviewToggle

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

" Find with :Rg
nnoremap <leader>rg :<c-u>Rg<cr>

" PICKER
nmap <leader>pe <Plug>(PickerEdit)
nmap <leader>ps <Plug>(PickerSplit)
nmap <leader>pt <Plug>(PickerTabedit)
nmap <leader>pv <Plug>(PickerVsplit)
nmap <leader>bb <Plug>(PickerBuffer)
nmap <leader>p] <Plug>(PickerTag)
nmap <leader>pw <Plug>(PickerStag)
nmap <leader>po <Plug>(PickerBufferTag)
nmap <leader>ph <Plug>(PickerHelp)

" BUFFERS
" close the current buffer and move to the previous one
nnoremap <leader>bq :<c-u>bp <bar> bd #<cr>
" close all buffers except current one
nnoremap <leader>bd :<c-u>up <bar> %bd <bar> e#<cr>


" LANGUAGECLIENT
nnoremap <silent> gd :<c-u>call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gt :<c-u>call LanguageClient_textDocument_typeDefinition()<cr>
nnoremap <silent> gi :<c-u>call LanguageClient_textDocument_implementation()<cr>
nnoremap <silent> gR :<c-u>call LanguageClient_textDocument_rename()<cr>
nnoremap <silent> gf :<c-u>call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> gS :<c-u>call LanguageClient_textDocument_documentSymbol()<cr>
nnoremap <silent> gw :<c-u>call LanguageClient_workspace_symbol()<cr>
nnoremap <silent> gr :<c-u>call LanguageClient_textDocument_references()<cr>
nnoremap <silent> ga :<c-u>call LanguageClient_textDocument_codeAction()<cr>
nnoremap <silent> K  :<c-u>call LanguageClient_textDocument_hover()<cr>
nnoremap <silent> gh :<c-u>call LanguageClient_contextMenu()<cr>

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
