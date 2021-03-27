let g:vsnip_snippet_dir = $HOME . '/.vim/vsnip'

" use snippet for multiple filetypes
let g:vsnip_filetypes                 = {}
let g:vsnip_filetypes.typescript      = ['typescript', 'javascript']
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript', 'javascript']

" Expand or jump
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Insert mode snippet completion mapping - '<Control-z>'
inoremap <silent> <C-z> <C-r>=snippets#Complete()<CR>
