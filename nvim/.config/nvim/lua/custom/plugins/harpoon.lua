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
		-- Harpon telescope extension
		require("telescope").load_extension('harpoon')

		-- Keymappings
		vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = "[H]arpoon [A]dd" })
		vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next, { desc = "[H]arpoon [N]ext" })
		vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev, { desc = "[H]arpoon [P]revious" })
		vim.api.nvim_set_keymap('n', '<leader>hm', [[<Cmd>:Telescope harpoon marks<CR>]],
			{ noremap = true, silent = true, desc = "[H]arpoon [M]arks" })

		local wk = require("which-key")
		wk.register({
			["<leader>h"] = {
				name = "[H]arpoon", _ = 'which_key_ignore',
				a = { require('harpoon.mark').add_file, "Add File" },
				n = { require('harpoon.ui').nav_next, "Navigate Next" },
				p = { require('harpoon.ui').nav_prev, "Navigate Previous" },
			}
		}, { prefix = "<leader>" })
	end,
}
