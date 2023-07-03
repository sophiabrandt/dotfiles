return {
	vim.keymap.set('n', '<localleader>f', vim.lsp.buf.format, { desc = '[F]ormat code' }),
	vim.api.nvim_set_keymap('i', 'hsr', '=>', { silent = true }),
	vim.api.nvim_set_keymap('i', 'nsr', '->', { silent = true })
}
