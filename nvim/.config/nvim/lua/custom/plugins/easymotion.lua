return {
	"easymotion/vim-easymotion",
	version = "*",
	config = function()
		-- EasyMotion configuration in Lua for Neovim
		vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings,
		vim.g.EasyMotion_smartcase = 1 -- Enable case-insensitive feature

		-- Normal mode mappings
		vim.api.nvim_set_keymap('n', ';', '<Plug>(easymotion-sn)', {})
		vim.api.nvim_set_keymap('o', ';', '<Plug>(easymotion-tn)', {})
		vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-s2)', {})
		vim.api.nvim_set_keymap('n', 'S', '<Plug>(easymotion-s)', {})
		vim.api.nvim_set_keymap('n', 't', '<Plug>(easymotion-t2)', {})
		vim.api.nvim_set_keymap('n', 'T', '<Plug>(easymotion-T2)', {})

		-- Leader key mappings
		vim.api.nvim_set_keymap('n', '<Leader>l', '<Plug>(easymotion-lineforward)', {})
		vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', {})
		vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', {})
		vim.api.nvim_set_keymap('n', '<Leader>h', '<Plug>(easymotion-linebackward)', {})
	end
}
