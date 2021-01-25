function! extCmd#InsertResult()
    return system(input('Command: '))[:-2]
endfunction
