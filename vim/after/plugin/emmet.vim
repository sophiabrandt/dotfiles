" lazy load plugins with a mapping
nnoremap <LocalLeader>e :<C-u>packadd emmet-vim<CR>

let g:user_emmet_settings={
\  'javascript' : {
\    'extends': 'jsx',
\    },
\  'typescript' : {
\    'extends': 'jsx',
\    },
\}

let g:user_emmet_leader_key='<C-z>'
