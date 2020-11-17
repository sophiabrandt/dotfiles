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
  call packager#add('fenetikm/falcon')
  call packager#add('jaredgorski/spacecamp')
  "-----------------------------
  " style plugins
  "-----------------------------
  "-----------------------------
  " behaviour plugins
  "-----------------------------
  call packager#add('bronson/vim-visual-star-search')
  call packager#add('chaoren/vim-wordmotion')
    " ~/.vim/plugin/after/wordmotion.vim - options, mappings
  call packager#add('justinmk/vim-sneak')
    " ~/.vim/plugin/sneak.vim - options, mappings
  call packager#add('mbbill/undotree')
    " ~/.vim/after/plugin/undotree.vim - mappings
    " ~/.vim/after/ftplugin/undotree.vim - options
  call packager#add('mhinz/vim-grepper')
    " ~/.vim/after/plugin/grepper.vim - options, mappings
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('skywind3000/vim-auto-popmenu', { 'type': 'opt' })
  call packager#add('tommcdo/vim-lion')
    " ~/.vim/after/plugin/lion.vim - options, mappings
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-endwise', { 'type': 'opt' })
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-repeat')
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
  call packager#add('airblade/vim-gitgutter')
    " ~/.vim/after/plugin/gitgutter.vim - options, mappings
  call packager#add('dense-analysis/ale')
    " ~/.vim/plugin/ale.vim - (startup) options
    " ~/.vim/after/plugin/ale.vim - options, mappings
  call packager#add('dsznajder/vscode-es7-javascript-react-snippets', { 'type': 'opt' })
  call packager#add('fivethree-team/vscode-svelte-snippets', { 'type': 'opt' })
  call packager#add('hrsh7th/vim-vsnip', { 'type': 'opt' })
    " ~/.vim/after/plugin/vsnip.vim - options, mappings
    " ~/.vim/vsnip - custom snippets
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
    " ~/.vim/after/plugin/emmet.vim - options, mappings
  call packager#add('nash0x7e2/awesome-flutter-snippets', { 'type': 'opt' })
  call packager#add('prabirshrestha/vim-lsp')
    " ~/.vim/after/plugin/lsp.vim - options, mappings
  call packager#add('sgur/vim-editorconfig')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('skywind3000/vim-dict')
    " ~/.vim/plugin/dict.vim - options, mappings
  "-----------------------------
  " misc plugins
  "-----------------------------
  call packager#add('christoomey/vim-tmux-navigator')
    " ~/.vim/after/plugin/tmux-navigator.vim - options, mappings
  call packager#add('christoomey/vim-tmux-runner')
    " ~/.vim/after/plugin/tmux-runner.vim - options, mappings
  call packager#add('iamcco/markdown-preview.nvim', { 'type': 'opt', 'do': { -> mkdp#util#install() } })
    " ~/.vim/after/plugin/markdown-preview.vim - options, mappings
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
  autocmd FileType dart packadd vim-vsnip | packadd awesome-flutter-snippets
  autocmd FileType javascript,javascriptreact,svelte,typescript,typescriptreact packadd emmet-vim | packadd vim-vsnip | packadd vscode-es7-javascript-react-snippets | packadd vscode-svelte-snippets
  autocmd FileType lua,elixir,eelixir,ruby,chrystal,sh,zsh,vb,vbnet,asbvbs,vim,c,cpp,xdefaults,haskell,objc,make,verilog,matlab,htmldjango,htmljinja,jinja.html,snippets packadd vim-endwise
  autocmd FileType markdown packadd markdown-preview.nvim
  autocmd FileType markdown,text packadd vim-auto-popmenu | let g:apc_enable_ft = {'text':1, 'markdown':1}
augroup END
