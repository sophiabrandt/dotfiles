" lazy load Plugins with a mapping
nnoremap <Leader>ww :<C-u>packadd wiki.vim<BAR>WikiIndex<CR>

let g:wiki_root             = '~/wiki'
let g:wiki_filetypes        = ['md']
let g:wiki_link_target_type = 'md'
let g:wiki_list_todos       = ['TODO', 'IN_PROGRESS', 'DONE']
let g:wiki_journal          = {
                  \ 'name': 'log'
                  \}

nmap <Leader>wt <Plug>(wiki-list-toggle)
nmap <Leader>jp <Plug>(wiki-journal-prev)
nmap <Leader>jn <Plug>(wiki-journal-next)

let g:wiki_mappings_global = {
                  \ '<Plug>(wiki-list-toggle)'   : '<A-s>',
                  \ 'i_<Plug>(wiki-list-toggle)' : '<A-s>',
                  \ '<Plug>(wiki-journal-prev)'  : '<Leader>jp',
                  \ '<Plug>(wiki-journal-next)'  : '<Leader>jn',
                  \}