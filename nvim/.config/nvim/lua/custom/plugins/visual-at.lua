-- https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
vim.api.nvim_exec([[
  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction
]], false)

vim.api.nvim_set_keymap('x', '@', ':<C-u>call ExecuteMacroOverVisualRange()<CR>', { noremap = true })

return {}
