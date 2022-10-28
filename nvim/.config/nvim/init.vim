set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require("plugin.autopairs")
require("plugin.cmp")
require("plugin.lsp-config")
require("plugin.null-ls")
EOF
