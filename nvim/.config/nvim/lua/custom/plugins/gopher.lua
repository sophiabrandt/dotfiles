return {
	"olexsmir/gopher.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "go",
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
	build = function()
		vim.cmd [[silent! GoInstallDeps]]
	end,
	vim.keymap.set('n', '<leader>gsj', "<cmd>GoTagAdd json <CR>", { desc = "Add json struct tags" }),
	vim.keymap.set('n', '<leader>gsy', "<cmd>GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" }),
	vim.keymap.set('n', '<leader>gif', "<cmd>GoIfErr<CR>", { desc = "if err snippet" })
}
