return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    -- Set the keymaps
    vim.api.nvim_set_keymap('n', 't', ':TestNearest', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', 'T', ':TestFile', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', 'a', ':TestSuite', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', 'L', ':TestLast', { silent = true, noremap = true })
    vim.api.nvim_set_keymap('n', 'g', ':TestVisit', { silent = true, noremap = true })

    -- Set the test strategy
    vim.cmd 'let test#strategy = "vimux"'

    -- Set options for the vimux pane
    vim.g.VimuxOrientation = 'h'
    vim.g.VimuxHeight = '40'
  end,
}
