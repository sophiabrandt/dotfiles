return {
	"olexsmir/gopher.nvim",
	ft = "go",
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
	build = function()
		vim.cmd [[silent! GoInstallDeps]]
	end,
	requires = { -- dependencies
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	vim.keymap.set('n', '<leader>gsj', "<cmd>GoTagAdd json <CR>", { desc = "Add json struct tags" }),
	vim.keymap.set('n', '<leader>gsy', "<cmd>GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })
}
