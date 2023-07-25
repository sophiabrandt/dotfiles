-- key mapping
vim.api.nvim_set_keymap('x', '@', ':lua ExecuteMacroOverVisualRange()<CR>', { noremap = true })

-- https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
function ExecuteMacroOverVisualRange()
	local start_line, _, _, _ = unpack(vim.fn.getpos("'<"))
	local end_line, _, _, _ = unpack(vim.fn.getpos("'>"))

	local char = vim.fn.getcharstr()

	print("@" .. char)

	-- execute macro
	for line = start_line, end_line do
		vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { line, 1 })
		vim.api.nvim_feedkeys("@" .. char, 'n', true)
	end
end

return {}
