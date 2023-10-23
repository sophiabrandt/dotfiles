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
	-- rose pine
	{
		'rose-pine/neovim',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	},
}
