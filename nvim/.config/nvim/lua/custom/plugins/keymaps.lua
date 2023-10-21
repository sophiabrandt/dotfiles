return {
	vim.keymap.set('n', 'U', '<C-r>', { noremap = true }), -- better Undo
	vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, { desc = 'Format code' }),
	vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' }),
	vim.api.nvim_set_keymap('n', '<leader>x', ':<C-u>bp<bar>bd! #<CR>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('n', 'gp', ':bprevious<CR>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('n', 'gn', ':bnext<CR>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('n', '<localleader>g',
		[[<Cmd>lua vim.fn.system("tmux popup -h '80%' -w '80%' -E 'lazygit'")<CR>]],
		{ noremap = true, silent = true }),
	vim.api.nvim_set_keymap('i', 'hsr', '=>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('i', 'nra', '->', { silent = true, noremap = true }),
}
