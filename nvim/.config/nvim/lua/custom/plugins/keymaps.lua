return {
  vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true }), -- better Undo
  vim.api.nvim_set_keymap(
    'n',
    '<leader>f',
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
    { noremap = true, desc = 'Search [F]iles' }
  ),
  vim.api.nvim_set_keymap('n', '<leader>mt', ':MergetoolToggle<CR>', { silent = true, noremap = true, desc = 'Mergetool Toggle' }),
  vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>x', ':<C-u>bp<bar>bd! #<CR>', { silent = true, noremap = true, desc = 'Close buffer' }),
  vim.api.nvim_set_keymap('n', '<leader>X', ':<C-u>%bd<bar>e#<bar>bd#<CR>', { silent = true, noremap = true, desc = 'Close all buffers except current one' }),
  vim.api.nvim_set_keymap('n', '[b', ':bprevious<CR>', { silent = true, noremap = true, desc = 'Previous buffer' }),
  vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', { silent = true, noremap = true, desc = 'Next buffer' }),
  vim.api.nvim_set_keymap(
    'n',
    '<localleader>g',
    [[<Cmd>lua vim.fn.system("tmux popup -h '80%' -w '80%' -E 'lazygit'")<CR>]],
    { noremap = true, silent = true }
  ),
  -- insert mode
  vim.api.nvim_set_keymap('i', '<c-e>', '<c-o>$', { silent = true, noremap = true, desc = 'Jump to end of line' }),
  vim.api.nvim_set_keymap('i', '<c-a>', '<c-o>^', { silent = true, noremap = true, desc = 'Jump to start of line' }),
  vim.api.nvim_set_keymap('i', 'faf', '=>', { silent = true, noremap = true, desc = 'Fat arrow function' }),
  vim.api.nvim_set_keymap('i', 'aaf', '->', { silent = true, noremap = true, desc = 'Normal arrow function' }),
  vim.api.nvim_command [[iabbrev <silent> diy <C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR>]],
}
