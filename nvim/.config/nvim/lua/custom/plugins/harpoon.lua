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
		vim.keymap.set('n', '<leader>pa', require('harpoon.mark').add_file, { desc = "Har[P]oon [A]dd" })
		vim.keymap.set('n', '<leader>pn', require('harpoon.ui').nav_next, { desc = "Har[P]oon [N]ext" })
		vim.keymap.set('n', '<lelader>pp', require('harpoon.ui').nav_prev, { desc = "Har[P]oon [P]revious" })
		vim.api.nvim_set_keymap('n', '<leader>pm', [[<Cmd>:Telescope harpoon marks<CR>]],
			{ noremap = true, silent = true, desc = "Har[P]oon [M]arks" })

		local wk = require("which-key")
		wk.register({
			["<leader>p"] = {
				name = "+harpoon",
				a = { require('harpoon.mark').add_file, "Add File" },
				n = { require('harpoon.ui').nav_next, "Navigate Next" },
				p = { require('harpoon.ui').nav_prev, "Navigate Previous" },
			}
		}, { prefix = "<leader>" })
	end,
}
