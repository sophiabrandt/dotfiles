return {
	vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, { desc = 'Format code' }),
	vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('i', 'hsr', '=>', { silent = true }),
	vim.api.nvim_set_keymap('i', 'nsr', '->', { silent = true })
}
