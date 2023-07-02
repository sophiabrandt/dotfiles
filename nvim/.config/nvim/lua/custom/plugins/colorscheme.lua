return {
	-- nord
	{
		'shaunsingh/nord.nvim',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
vim.cmd.colorscheme "nord"
		end,
	},
	-- github
	{
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()

		end,
	},
	-- tokyo-night
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()

		end,
	},
	-- kanagawa
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()

		end,
	},
}
