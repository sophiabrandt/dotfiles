return {
	-- nord
	{
		'shaunsingh/nord.nvim',
		lazy = false,
		priority = 1000,
		config = function()
vim.cmd.colorscheme "nord"
		end,
	},
	-- github
	{
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	},
	-- tokyo-night
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	},
	-- kanagawa
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	},
	-- catpuccin
	{
		'catppuccin/nvim',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	}
}
