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
	-- darcula
	{
		'doums/darcula',
		lazy = false,
		priority = 1000,
		config = function()

		end,
	},
	-- falcon
	{
		'fenetikm/falcon',
		lazy = false,
		priority = 1000,
		config = function()

		end
	},
	-- poimandres
	{
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
		config = function()

		end
	},
}
