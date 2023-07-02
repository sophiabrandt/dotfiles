nmap <Leader>f  <Plug>(PickerEdit)
nmap <Leader>be <Plug>(PickerEdit)
nmap <C-p>      <Plug>(PickerEdit)
nmap <Leader>bs <Plug>(PickerSplit)
nmap <Leader>bt <Plug>(PickerTabedit)
nmap <Leader>bv <Plug>(PickerVsplit)
nmap <Leader>bb <Plug>(PickerBuffer)
nmap <Leader>b] <Plug>(PickerTag)
nmap <Leader>bw <Plug>(PickerStag)
nmap <Leader>bo <Plug>(PickerBufferTag)
nmap <Leader>bh <Plug>(PickerHelp)

" do not use Git to search files
let g:picker_custom_find_executable = 'fd'
let g:picker_custom_find_flags = '-H -E .git'
