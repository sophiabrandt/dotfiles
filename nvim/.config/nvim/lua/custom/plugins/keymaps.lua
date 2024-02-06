return {
	vim.keymap.set('n', 'U', '<C-r>', { noremap = true }), -- better Undo
	vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, { desc = 'Format code' }),
	vim.keymap.set('n', '<leader>f',
		"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
		{ noremap = true, desc = 'Search [F]iles' }),
	vim.api.nvim_set_keymap('n', '<leader>x', ':<C-u>bp<bar>bd! #<CR>',
		{ silent = true, noremap = true, desc = "Close buffer" }),
	vim.api.nvim_set_keymap('n', '<leader>X', ':<C-u>%bd<bar>e#<bar>bd#<CR>',
		{ silent = true, noremap = true, desc = "Close all buffers except current one" }),
	vim.api.nvim_set_keymap('n', '[b', ':bprevious<CR>', { silent = true, noremap = true, desc = "Previous buffer" }),
	vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', { silent = true, noremap = true, desc = "Next buffer" }),
	vim.api.nvim_set_keymap('n', '<localleader>g',
		[[<Cmd>lua vim.fn.system("tmux popup -h '80%' -w '80%' -E 'lazygit'")<CR>]],
		{ noremap = true, silent = true }),
	vim.api.nvim_set_keymap('i', 'hsr', '=>', { silent = true, noremap = true }),
	vim.api.nvim_set_keymap('i', 'hra', '->', { silent = true, noremap = true }),
}
