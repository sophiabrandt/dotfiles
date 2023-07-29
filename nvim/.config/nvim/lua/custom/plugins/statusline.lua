local function mode_map()
	local mode = vim.api.nvim_get_mode().mode
	if mode == 'n' then
		return '∙'
	elseif mode == 'i' then
		return '∙∙'
	elseif mode == 'v' or mode == 'V' or mode == '^V' then
		return '∙∙∙'
	elseif mode == 'c' then
		return '∙∙∙∙'
	else
		return '' -- in case any other modes are not considered
	end
end

return {
	'nvim-lualine/lualine.nvim',
	config = function()
		require('lualine').setup {
			opts = {
				options = {
					icons_enabled = false,
					theme = 'auto',
					component_separators = '|',
					section_separators = '',
				},
			},
			sections = {
				lualine_a = { { 'mode', fmt = mode_map } },
				lualine_b = { 'branch' }
			}
		}
	end,
}
