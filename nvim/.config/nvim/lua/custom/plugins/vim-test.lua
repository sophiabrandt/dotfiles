return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    -- Set the keymaps
    vim.api.nvim_set_keymap('n', '<leader>t', ':TestNearest', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>T', ':TestFile', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>a', ':TestSuite', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>L', ':TestLast', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', '<leader>g', ':TestVisit', { silent = true, noremap = true })

    -- Set the test strategy
    vim.cmd 'let test#strategy = "vimux"'

    -- Set options for the vimux pane
    vim.g.VimuxOrientation = 'h'
    vim.g.VimuxHeight = '40'
  end,
}
