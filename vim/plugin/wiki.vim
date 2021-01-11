" lazy load Plugins with a mapping
nnoremap <Leader>ww :<C-u>packadd wiki.vim<BAR>WikiIndex<CR>

" create a PDF
" https://old.reddit.com/r/vim/comments/ktc3r2/mapping_to_create_a_pdf_from_vimwiki_markdown/
nnoremap <Leader>wp :!pandoc %:p --pdf-engine=xelatex --to=pdf -o ~/%:t:r.pdf<left><left><left><left> nnoremap <leader>W :!pandoc %:p --pdf-engine=xelatex --to=pdf -o ~/%:t:r.pdf<cr>

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
