command! PackInstall call PackagerInit() | source $MYVIMRC | redraw | call packager#install()
command! -bang PackUpdate call PackagerInit() | source $MYVIMRC | redraw | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean  call PackagerInit() | source $MYVIMRC | call packager#clean()
command! PackStatus call PackagerInit() | source $MYVIMRC | call packager#status()

" load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
  "-----------------------------
  " color scheme plugins
  "-----------------------------
  call packager#add('arcticicestudio/nord-vim')
  call packager#add('chiendo97/intellij.vim')
  call packager#add('doums/darcula')

  "-----------------------------
  " style plugins
  "-----------------------------

  "-----------------------------
  " behaviour plugins
  "-----------------------------
  call packager#add('bronson/vim-visual-star-search')
  call packager#add('chaoren/vim-wordmotion')
    " ~/.vim/plugin/after/wordmotion.vim - options, mappings
  call packager#add('easymotion/vim-easymotion')
    " ~/.vim/plugin/vim-easymotion.vim - options, mappings
  call packager#add('mbbill/undotree')
    " ~/.vim/after/plugin/undotree.vim - mappings
    " ~/.vim/after/ftplugin/undotree.vim - options
  call packager#add('mhinz/vim-grepper')
    " ~/.vim/after/plugin/grepper.vim - options, mappings
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('tmsvg/pear-tree', { 'type': 'opt' })
  call packager#add('skywind3000/vim-auto-popmenu', { 'type': 'opt' })
  call packager#add('tommcdo/vim-lion')
    " ~/.vim/after/plugin/lion.vim - options, mappings
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-endwise', { 'type': 'opt' })
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-sleuth')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-unimpaired')
  call packager#add('wellle/targets.vim')

  "-----------------------------
  " filesystem plugins
  "-----------------------------
  call packager#add('srstevenson/vim-picker')
    " ~/.vim/after/plugin/picker.vim - options, mappings
  call packager#add('justinmk/vim-dirvish')

  "-----------------------------
  " development plugins
  "-----------------------------
  call packager#add('dense-analysis/ale')
    " ~/.vim/plugin/ale.vim - (startup) options
    " ~/.vim/after/plugin/ale.vim - options, mappings
  call packager#add('airblade/vim-gitgutter')
    " ~/.vim/after/plugin/gitgutter.vim - options, mappings
  call packager#add('Alexisvt/flutter-snippets', { 'type': 'opt' })
  call packager#add('christoomey/vim-titlecase', { 'type': 'opt' })
  call packager#add('elixir-editors/vim-elixir')
  call packager#add('hrsh7th/vim-vsnip', { 'type': 'opt' })
  call packager#add('kristijanhusak/vim-js-file-import', { 'type': 'opt' })
    " ~/.vim/after/plugin/vsnip.vim - options, mappings
    " ~/.vim/vsnip - custom snippets
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
    " ~/.vim/after/plugin/emmet.vim - options, mappings
  call packager#add('nash0x7e2/awesome-flutter-snippets', { 'type': 'opt' })
  call packager#add('prabirshrestha/vim-lsp')
    " ~/.vim/after/plugin/lsp.vim - options, mappings
  call packager#add('sgur/vim-editorconfig')
  call packager#add('skywind3000/vim-dict')
    " ~/.vim/plugin/dict.vim - options, mappings
  call packager#add('tpope/vim-fugitive')

  "-----------------------------
  " misc plugins
  "-----------------------------
  call packager#add('christoomey/vim-tmux-navigator')
    " ~/.vim/after/plugin/tmux-navigator.vim - options, mappings
  call packager#add('christoomey/vim-tmux-runner')
    " ~/.vim/after/plugin/tmux-runner.vim - options, mappings
  call packager#add('lervag/wiki.vim', { 'type': 'opt' })
    " ~/.vim/after/plugin/wiki.vim - options, mappings
  call packager#add('ludovicchabant/vim-gutentags')

  "-----------------------------
  " neovim plugins
  "-----------------------------
  if has("nvim")
	  call packager#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
        " ~/.vim/after/plugin/nvim-colorizer.vim - options, mappings
        " ~/.vim/lua/nvim-colorizer.lua - options, mappings
  endif
endfunction

" Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  autocmd FileType css,html,elixir,eelixir,tmpl packadd emmet-vim
  autocmd FileType cs,dart,fsharp,go,html,java,javascript,javascriptreact,json,markdown,perl,python,rust,typescript,typescriptreact packadd pear-tree
  autocmd FileType dart packadd vim-vsnip | packadd awesome-flutter-snippets | packadd flutter-snippets
  autocmd FileType elixir,eelixir,lua,ruby,chrystal,sh,zsh,vb,vbnet,asbvbs,vim,c,cpp,xdefaults,haskell,obj-c,make,verilog,matlab,htmldjango,htmljinja,jinja.html,snippets packadd vim-endwise
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact,vue,svelte packadd emmet-vim | packadd vim-js-file-import | packadd vim-vsnip
  autocmd FileType markdown,text packadd vim-vsnip | packadd vim-titlecase | packadd vim-auto-popmenu
augroup END
