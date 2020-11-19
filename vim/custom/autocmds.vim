" omnifunc
" see :h ft-syntax-omni
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" set relative line numbering when entering insert mode
" return to absolute line numbering when cursor leaves buffer/window/split
augroup number_toggle
  autocmd!
  autocmd InsertEnter * set relativenumber
  autocmd BufLeave,WinLeave,InsertLeave,FocusLost * set norelativenumber
augroup END

" auto-create non-existing directory when saving file
augroup auto_create_dir
  autocmd!
  autocmd BufWritePre * :call autodir#Make(expand('<afile>'), +expand('<abuf>'))
augroup END

" automatically change working directory
augroup working_directory
  autocmd!
  " set current directory on insert mode
  autocmd InsertEnter * let save_cwd = getcwd() | silent! lcd %:p:h
  " switch back to previous directory when leaving insert mode
  autocmd InsertLeave * silent execute 'lcd' fnameescape(save_cwd)
augroup END

" Restore default Enter/Return behaviour for the command line window.
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufReadPost loclist nnoremap <buffer> <CR> <CR>
