" https://www.reddit.com/r/vim/comments/8asgjj/topnotch_vim_markdown_live_previews_with_no/
function! markdown#Preview() abort
  if executable('grip') && exists('s:markdown_job_id') && s:markdown_job_id > 0
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  " use grip with github-access token to avoid hitting the API limit
  let grip = 'pass show github/grip-access-token | xargs -I {} grip --pass {} '
  let s:markdown_job_id = jobstart(
    \ grip . shellescape(expand('%:p')) . " 0 2>&1 | awk -F ':|/' '/Running/ { print $5 }'",
    \ { 'on_stdout': 'OnGripStart', 'pty': 1 })
  function! OnGripStart(_, output, __)
    let port = a:output[0][0:5]
    echom 'Markdown preview running on' port
    let uname = substitute(system('uname'), '\n', '', '')
    if uname == 'Linux'
      call system('xdg-open http://localhost:' . port)
    else
      call system('open http://localhost:' . port)
    endif
  endfunction
endfunction

