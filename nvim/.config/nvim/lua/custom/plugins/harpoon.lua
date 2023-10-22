-- File: lua/custom/plugins/harpoon.lua

return {
	"ThePrimeagen/harpoon",
	-- Optional dependency
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup {
			-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			save_on_toggle = false,

			-- saves the harpoon file upon every change. disabling is unrecommended.
			save_on_change = true,

			-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
			enter_on_sendcmd = false,

			-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
			tmux_autoclose_windows = false,

			-- filetypes that you want to prevent from adding to the harpoon list menu.
			excluded_filetypes = { "harpoon" },

			-- set marks specific to each git branch inside git repository
			mark_branch = false,

			-- enable tabline with harpoon marks
			tabline = false,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
		}
		-- Keymappings
		vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = "[H]arpoon [A]dd" })
		vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next, { desc = "[H]arpoon [N]ext" })
		vim.keymap.set('n', '[h', require('harpoon.ui').nav_next, { desc = "Harpoon Next" })
		vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev, { desc = "[H]arpoon [P]revious" })
		vim.keymap.set('n', ']h', require('harpoon.ui').nav_prev, { desc = "Harpoon Previous" })
		vim.api.nvim_set_keymap('n', '<leader>hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
			{ noremap = true, silent = true, desc = "[H]arpoon [M]arks" })
		vim.api.nvim_set_keymap('n', '<leader>hu', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>',
			{ noremap = true, silent = true, desc = "[H]arpoon [U]i" })
	end,
}
