command! PackInstall call PackagerInit() | source $MYVIMRC | redraw | call packager#install()
command! -bang PackUpdate call PackagerInit() | source $MYVIMRC | redraw | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean  call PackagerInit() | source $MYVIMRC | call packager#clean()
command! PackStatus call PackagerInit() | source $MYVIMRC | call packager#status()

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
  call packager#add('NLKNguyen/papercolor-theme')
  call packager#add('arcticicestudio/nord-vim')
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('jeffkreeftmeijer/vim-numbertoggle')
  call packager#add('sgur/vim-editorconfig')
  call packager#add('dbakker/vim-projectroot')
  call packager#add('mbbill/undotree')
  call packager#add('justinmk/vim-dirvish')
  call packager#add('srstevenson/vim-picker')
  call packager#add('machakann/vim-highlightedyank')
  call packager#add('mhinz/vim-grepper')
  call packager#add('itchyny/lightline.vim')
  call packager#add('mengelbrecht/lightline-bufferline')
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-fugitive')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('tommcdo/vim-lion')
  call packager#add('chaoren/vim-wordmotion')
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('wellle/targets.vim')
  call packager#add('ajh17/VimCompletesMe')
  call packager#add('justinmk/vim-sneak')
  call packager#add('christoomey/vim-system-copy')
  call packager#add('dense-analysis/ale')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('ludovicchabant/vim-gutentags')
  call packager#add('chrisbra/unicode.vim')
  call packager#add('lervag/wiki.vim')

"Loaded only for specific filetypes on demand. Requires autocommands below.
  call packager#add('junegunn/goyo.vim')
  call packager#add('junegunn/limelight.vim')
  call packager#add('tpope/vim-endwise', { 'for': ['crystal', 'elixir', 'ruby', 'vim'] })
  call packager#add('mattn/emmet-vim')
  call packager#add('HerringtonDarkholme/yats.vim')
  call packager#add('elixir-editors/vim-elixir')
  call packager#add('reasonml-editor/vim-reason-plus')
  call packager#add('jordwalke/vim-reasonml')
  call packager#add('iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } })
  call packager#add('norcalli/nvim-colorizer.lua')
  call packager#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'})
endfunction

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  autocmd FileType css,html,scss packadd nvim-colorizer.lua
  autocmd FileType elixir packadd vim-elixir
  autocmd FileType elixir,vim packadd vim-endwise
  autocmd FileType elixir,javascript,javascriptreact,nim,ocaml,python,reason,typescript,typescriptreact packadd LanguageClient-neovim
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact packadd yats.vim
  autocmd FileType javascriptreact,typescriptreact packadd emmet-vim
  autocmd FileType markdown packadd markdown-preview.nim
  autocmd FileType markdown packadd goyo.vim
  autocmd FileType markdown packadd limelight.vim
  autocmd FileType markdown packadd emmet-vim
  autocmd FileType reason packadd vim-reason-plus
  autocmd FileType reason,ocaml packadd vim-reasonml
augroup END
