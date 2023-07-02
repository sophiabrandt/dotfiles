return {
	vim.keymap.set('n', '<localleader>f', vim.lsp.buf.format, { desc = '[F]ormat code' })
}
