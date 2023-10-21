-- File: lua/custom/plugins/undotree.lua

return {
	"mbbill/undotree",
	vim.keymap.set('n', '<leader><u>', vim.cmd.UndotreeToggle)
}
