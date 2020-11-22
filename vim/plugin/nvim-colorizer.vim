" lazy load plugins with a mapping
nnoremap <LocalLeader>c :<C-u>packadd nvim-colorizer.lua<bar>lua require 'nvim-colorizer'<CR>:<C-u>ColorizerAttachToBuffer<CR>
