" auto-create non-existing directory when saving file
" https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function! autodir#Make(file, buf) abort
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
