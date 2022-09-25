set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require("plugin.lsp-config")
require("plugin.cmp")
EOF
