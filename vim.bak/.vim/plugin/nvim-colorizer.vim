" lazy load plugins with a mapping
nnoremap <LocalLeader>o :<C-u>packadd nvim-colorizer.lua<bar>lua require 'colorizer'<CR>:<C-u>ColorizerAttachToBuffer<CR>
