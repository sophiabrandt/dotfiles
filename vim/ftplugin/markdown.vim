setlocal spell
nmap <silent><Leader>md :<C-u>call markdown#Preview()<CR>

let g:apc_is_enabled = 0

function! ApcToggle()
    if g:apc_is_enabled
        execute 'ApcEnable'
		echom 'Enabled Apc'
        let g:apc_is_enabled = 0
    else
        let g:apc_is_enabled = 1
        execute 'ApcDisable'
		echom 'Disabled Apc'
    endif
endfunction

nmap <silent><Leader>ap :<C-u>call ApcToggle()<CR>
