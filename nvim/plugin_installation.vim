command! PackInstall call PackagerInit() | source $MYVIMRC | redraw | call packager#install()
command! -bang PackUpdate call PackagerInit() | source $MYVIMRC | redraw | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean  call PackagerInit() | source $MYVIMRC | call packager#clean()
command! PackStatus call PackagerInit() | source $MYVIMRC | call packager#status()

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
  call packager#add('airblade/vim-gitgutter')
  call packager#add('ajh17/vimcompletesme')
  call packager#add('arcticicestudio/nord-vim')
  call packager#add('chaoren/vim-wordmotion')
  call packager#add('chrisbra/unicode.vim')
  call packager#add('christoomey/vim-system-copy')
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('christoomey/vim-tmux-runner')
  call packager#add('cocopon/iceberg.vim')
  call packager#add('dart-lang/dart-vim-plugin')
  call packager#add('dbakker/vim-projectroot')
  call packager#add('dense-analysis/ale')
  call packager#add('dsznajder/vscode-es7-javascript-react-snippets', { 'type': 'opt' })
  call packager#add('elixir-editors/vim-elixir')
  call packager#add('fivethree-team/vscode-svelte-snippets', { 'type': 'opt' })
  call packager#add('frazrepo/vim-rainbow')
  call packager#add('herringtondarkholme/yats.vim', { 'type': 'opt' })
  call packager#add('hrsh7th/vim-vsnip')
  call packager#add('hrsh7th/vim-vsnip-integ')
  call packager#add('hylang/vim-hy')
  call packager#add('iamcco/markdown-preview.nvim', { 'type': 'opt', 'do': { -> mkdp#util#install() } })
  call packager#add('itchyny/lightline.vim')
  call packager#add('jaredgorski/spacecamp')
  call packager#add('jordwalke/vim-reasonml')
  call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
  call packager#add('junegunn/limelight.vim', { 'type': 'opt' })
  call packager#add('justinmk/vim-dirvish')
  call packager#add('justinmk/vim-sneak')
  call packager#add('lervag/wiki.vim', { 'type': 'opt' })
  call packager#add('ludovicchabant/vim-gutentags')
  call packager#add('machakann/vim-highlightedyank')
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
  call packager#add('mbbill/undotree')
  call packager#add('mengelbrecht/lightline-bufferline')
  call packager#add('mhinz/vim-grepper')
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('nash0x7e2/awesome-flutter-snippets', { 'type': 'opt' })
  call packager#add('natebosch/vim-lsc')
  call packager#add('natebosch/vim-lsc-dart', { 'type': 'opt' })
  call packager#add('nlknguyen/papercolor-theme')
  call packager#add('norcalli/nvim-colorizer.lua', { 'type': 'opt' })
  call packager#add('reasonml-editor/vim-reason-plus', { 'type': 'opt' })
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('sgur/vim-editorconfig')
  call packager#add('sheerun/vim-polyglot', { 'type': 'opt' })
  call packager#add('srstevenson/vim-picker')
  call packager#add('tmsvg/pear-tree')
  call packager#add('tommcdo/vim-lion')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('wellle/targets.vim')
endfunction

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  autocmd FileType css,html,scss packadd nvim-colorizer.lua
  autocmd FileType dart packadd vim-lsc-dart
augroup END

"Lazy load plugins with a mapping
nnoremap <silent><leader>vp :<c-u>packadd vim-polyglot<cr>
